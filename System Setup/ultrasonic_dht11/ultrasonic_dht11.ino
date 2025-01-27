#include "DHT.h"

// DHT sensor configuration
#define DHTTYPE DHT11  // DHT 11 sensor
#define DHTPIN 4       // GPIO pin connected to DATA pin of DHT11
DHT dht(DHTPIN, DHTTYPE);

// HC-SR04 ultrasonic sensor configuration
#define TRIG_PIN 13    // GPIO pin connected to TRIG pin of HC-SR04
#define ECHO_PIN 12    // GPIO pin connected to ECHO pin of HC-SR04

void setup() {
  // Initialize serial communication
  Serial.begin(115200);
  Serial.println("DHT11 and HC-SR04 Sensor Test!");

  // Initialize DHT sensor
  dht.begin();

  // Initialize HC-SR04 pins
  pinMode(TRIG_PIN, OUTPUT);
  pinMode(ECHO_PIN, INPUT);
}

void loop() {
  // DHT11: Read temperature and humidity
  float humidity = dht.readHumidity();
  float temperature = dht.readTemperature(); // Celsius by default

  // Check if DHT readings are valid
  if (isnan(humidity) || isnan(temperature)) {
    Serial.println("Failed to read from DHT sensor!");
  } else {
    // Print DHT readings
    Serial.print("Humidity: ");
    Serial.print(humidity);
    Serial.print(" %\t");
    Serial.print("Temperature: ");
    Serial.print(temperature);
    Serial.println(" °C");
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

  // Print HC-SR04 readings
  Serial.print("Distance: ");
  Serial.print(distance);
  Serial.println(" cm");

  // Wait 2 seconds before next measurement
  delay(2000);
}
