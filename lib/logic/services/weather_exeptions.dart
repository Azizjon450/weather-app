class WeatherExeptions implements Exception {
  final String message;
  WeatherExeptions(this.message);

  @override
  String toString() {
    return message;
  }
}