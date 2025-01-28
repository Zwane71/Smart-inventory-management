#include "DHT.h"
#include <WiFi.h>
#include <PubSubClient.h>
#include <WiFiClientSecure.h>

// DHT sensor configuration
#define DHTTYPE DHT11  // DHT 11 sensor
#define DHTPIN 4       // GPIO pin connected to DATA pin of DHT11
DHT dht(DHTPIN, DHTTYPE);

// HC-SR04 ultrasonic sensor configuration
#define TRIG_PIN 13    // GPIO pin connected to TRIG pin of HC-SR04
#define ECHO_PIN 12    // GPIO pin connected to ECHO pin of HC-SR04

// Wi-Fi credentials
const char* ssid = "Impact School AP";
const char* password = "impact@123";

// HiveMQ Cloud details
const char* mqtt_server = "0c56a2b2afce49fc9e790d99a3f4cb3c.s1.eu.hivemq.cloud";
const int mqtt_port = 8883;
const char* mqtt_user = "makhohlisa";
const char* mqtt_password = "Themba@8471";

WiFiClientSecure espClient;
PubSubClient client(espClient);

// Wi-Fi setup function
void setup_wifi() {
  delay(10);
  Serial.println();
  Serial.print("Connecting to Wi-Fi: ");
  Serial.println(ssid);

  WiFi.begin(ssid, password);

  while (WiFi.status() != WL_CONNECTED) {
    delay(500);
    Serial.print(".");
  }

  Serial.println();
  Serial.println("Wi-Fi connected");
  Serial.println("IP address: ");
  Serial.println(WiFi.localIP());
}

// MQTT reconnect function
void reconnect() {
  while (!client.connected()) {
    Serial.print("Attempting MQTT connection...");
    if (client.connect("arduinoClient", mqtt_user, mqtt_password)) {
      Serial.println("connected");
      client.subscribe("test/topic"); // Subscribe to a topic
    } else {
      Serial.print("failed, rc=");
      Serial.print(client.state());
      Serial.println(" try again in 5 seconds");
      delay(5000);
    }
  }
}

// MQTT callback function
void callback(char* topic, byte* payload, unsigned int length) {
  Serial.print("Message arrived [");
  Serial.print(topic);
  Serial.print("] ");
  for (int i = 0; i < length; i++) {
    Serial.print((char)payload[i]);
  }
  Serial.println();
}

// Setup function
void setup() {
  Serial.begin(115200);
  setup_wifi();

  // Set up MQTT
  espClient.setInsecure(); // Use this for insecure TLS (not recommended for production)
  client.setServer(mqtt_server, mqtt_port);
  client.setCallback(callback);

  // Initialize DHT sensor
  dht.begin();

  // Initialize HC-SR04 pins
  pinMode(TRIG_PIN, OUTPUT);
  pinMode(ECHO_PIN, INPUT);
}

// Loop function
void loop() {
  if (!client.connected()) {
    reconnect();
  }
  client.loop();

  // DHT11: Read temperature and humidity
  float humidity = dht.readHumidity();
  float temperature = dht.readTemperature(); // Celsius by default

  // Check if DHT readings are valid
  if (isnan(humidity) || isnan(temperature)) {
    Serial.println("Failed to read from DHT sensor!");
  } else {
    // Publish DHT readings to MQTT
    String dhtMessage = "Humidity: " + String(humidity) + "% Temperature: " + String(temperature) + "°C";
    Serial.print("Publishing to MQTT topic 'sensor/dht': ");
    Serial.println(dhtMessage);
    if (client.publish("sensor/dht", dhtMessage.c_str())) {
      Serial.println("Data successfully sent to MQTT");
    } else {
      Serial.println("Failed to send data to MQTT");
    }
  }

  // HC-SR04: Measure distance
  digitalWrite(TRIG_PIN, LOW);
  delayMicroseconds(2);
  digitalWrite(TRIG_PIN, HIGH);
  delayMicroseconds(10);
  digitalWrite(TRIG_PIN, LOW);

  // Read duration of the echo pulse
  long duration = pulseIn(ECHO_PIN, HIGH);

  // Calculate distance (cm)
  float distance = (duration * 0.034) / 2;

  // Publish HC-SR04 readings to MQTT
  String distanceMessage = "Distance: " + String(distance) + " cm";
  Serial.print("Publishing to MQTT topic 'sensor/distance': ");
  Serial.println(distanceMessage);
  if (client.publish("sensor/distance", distanceMessage.c_str())) {
    Serial.println("Data successfully sent to MQTT");
  } else {
    Serial.println("Failed to send data to MQTT");
  }

  // Wait 5 seconds before publishing again
  delay(2000);
}
