#include <WiFi.h>
#include <PubSubClient.h>
#include <WiFiClientSecure.h>

// Replace with your Wi-Fi credentials
const char* ssid = "Impact School AP";
const char* password = "impact@123";

// HiveMQ Cloud details
const char* mqtt_server = "6e7c894469e245b29b53f05ac13ea7ae.s1.eu.hivemq.cloud";
const int mqtt_port = 8883;
const char* mqtt_user = "ThebeCodes";
const char* mqtt_password = "ThebeHive8";

WiFiClientSecure espClient;
PubSubClient client(espClient);

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

void callback(char* topic, byte* payload, unsigned int length) {
  Serial.print("Message arrived [");
  Serial.print(topic);
  Serial.print("] ");
  for (int i = 0; i < length; i++) {
    Serial.print((char)payload[i]);
  }
  Serial.println();
}

void setup() {
  Serial.begin(115200);
  setup_wifi();

  // Set up MQTT
  espClient.setInsecure(); // Use this for insecure TLS (not recommended for production)
  client.setServer(mqtt_server, mqtt_port);
  client.setCallback(callback);
}

void loop() {
  if (!client.connected()) {
    reconnect();
  }
  client.loop();

  // Publish a message
  client.publish("test/topic", "Hello from Arduino");
  delay(5000);
}