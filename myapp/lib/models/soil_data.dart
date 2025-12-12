class SoilData {
  final double ph;
  final double moisture;
  final double temperature;
  final double salinity;
  final double nitrogen;
  final double phosphorus;
  final double potassium;
  final DateTime date;

  SoilData({
    required this.ph,
    required this.moisture,
    required this.temperature,
    required this.salinity,
    required this.nitrogen,
    required this.phosphorus,
    required this.potassium,
    required this.date,
  });

  Map<String, dynamic> toMap() {
    return {
      'ph': ph,
      'moisture': moisture,
      'temperature': temperature,
      'salinity': salinity,
      'nitrogen': nitrogen,
      'phosphorus': phosphorus,
      'potassium': potassium,
      'date': date.toIso8601String(),
    };
  }

  factory SoilData.fromMap(Map<String, dynamic> map) {
    return SoilData(
      ph: map['ph'],
      moisture: map['moisture'],
      temperature: map['temperature'],
      salinity: map['salinity'],
      nitrogen: map['nitrogen'],
      phosphorus: map['phosphorus'],
      potassium: map['potassium'],
      date: DateTime.parse(map['date']),
    );
  }
}
