class WeatherInfo {
  final String cityName;
  final double temperature;
  final double feelsLike;

  WeatherInfo({
    required this.cityName,
    required this.temperature,
    required this.feelsLike,
  });

  factory WeatherInfo.fromJson(Map<String, dynamic> json) {
    return WeatherInfo(
      cityName: json['name'],
      temperature: json['main']['temp'],
      feelsLike: json['main']['feels_like'],
    );
  }
}
