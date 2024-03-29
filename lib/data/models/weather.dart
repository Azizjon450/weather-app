class Weather {
  final String id;
  final String main;
  final String descrip;
  final String icon;
  final double temperature;
  final String city;
  final DateTime time;

  Weather({
    required this.id,
    required this.main,
    required this.descrip,
    required this.icon,
    required this.temperature,
    required this.city,
    required this.time,
  });
}
