import 'package:flutter_test/flutter_test.dart';
// Note: Ensure this import matches your project structure
import 'package:weather_app/models/weather.dart';

void main() {
  group('Weather Model Unit Tests', () {

    test('Weather.fromJson should correctly parse a Manila API response', () {
      // 1. Arrange: Define a realistic Manila JSON including the 'wind' object
      final Map<String, dynamic> manilaJson = {
        "weather": [
          {
            "main": "Clouds",
            "description": "broken clouds",
          }
        ],
        "main": {
          "temp": 31.2,
          "humidity": 65,
        },
        "wind": {
          "speed": 5.14  // Your model was crashing because this was missing
        },
        "name": "Manila"
      };

      // 2. Act
      final weather = Weather.fromJson(manilaJson);

      // 3. Assert
      expect(weather.city, 'Manila');
      expect(weather.temperature, 31.2);
      expect(weather.description, 'Clouds');
      // If your model has a windSpeed property, uncomment the line below:
      // expect(weather.windSpeed, 5.14);
    });

    test('Weather.fromJson should handle temperature as an integer safely', () {
      // 1. Arrange: API sometimes returns 30 instead of 30.0
      final Map<String, dynamic> integerTempJson = {
        "weather": [{"main": "Clear"}],
        "main": {"temp": 30},
        "wind": {"speed": 2.0},
        "name": "Manila"
      };

      // 2. Act
      final weather = Weather.fromJson(integerTempJson);

      // 3. Assert
      expect(weather.temperature, 30.0);
    });
  });
}
