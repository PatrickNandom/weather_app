import 'package:intl/intl.dart';

class ForecastInfo {
  final String time;
  final double temperature;

  ForecastInfo({required this.time, required this.temperature});

  factory ForecastInfo.fromJson(Map<String, dynamic> json) {
    final dateTime = DateTime.parse(json['dt_txt']);
    final formattedTime = DateFormat('hh a').format(dateTime);
    return ForecastInfo(
      time: formattedTime,
      temperature: json['main']['temp'] - 273.15,
    );
  }
}
