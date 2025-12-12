import 'package:flutter/material.dart';
import '../widgets/custom_widgets.dart';
import '../widgets/custom_widgets.dart';
import 'result_screen.dart';
import '../models/soil_data.dart';

class SoilInputScreen extends StatefulWidget {
  const SoilInputScreen({super.key});

  @override
  _SoilInputScreenState createState() => _SoilInputScreenState();
}

class _SoilInputScreenState extends State<SoilInputScreen> {
  double _phValue = 7.0;
  double _moistureValue = 50.0;
  double _temperatureValue = 25.0;
  double _salinityValue = 1.0;
  double _nitrogenValue = 50.0;
  double _phosphorusValue = 50.0;
  double _potassiumValue = 50.0;

  void _analyzeSoil() {
    final soilData = SoilData(
      ph: _phValue,
      moisture: _moistureValue,
      temperature: _temperatureValue,
      salinity: _salinityValue,
      nitrogen: _nitrogenValue,
      phosphorus: _phosphorusValue,
      potassium: _potassiumValue,
      date: DateTime.now(),
    );

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ResultScreen(soilData: soilData),
      ),
    );
  }

  Widget _buildSlider({
    required String label,
    required double value,
    required double min,
    required double max,
    required String unit,
    required Function(double) onChanged,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              label,
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
            ),
            Text(
              '${value.toStringAsFixed(1)} $unit',
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.green,
              ),
            ),
          ],
        ),
        Slider(
          value: value,
          min: min,
          max: max,
          divisions: (max - min).round(),
          onChanged: (newValue) {
            setState(() => onChanged(newValue));
          },
          activeColor: Colors.green,
          inactiveColor: Colors.green[100],
        ),
        const SizedBox(height: 20),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('إدخال بيانات التربة'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'أدخل خصائص التربة:',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            
            // مستوى الحموضة (pH)
            _buildSlider(
              label: 'مستوى الحموضة (pH)',
              value: _phValue,
              min: 0,
              max: 14,
              unit: '',
              onChanged: (value) => setState(() => _phValue = value),
            ),
            
            // الرطوبة
            _buildSlider(
              label: 'الرطوبة',
              value: _moistureValue,
              min: 0,
              max: 100,
              unit: '%',
              onChanged: (value) => setState(() => _moistureValue = value),
            ),
            
            // الحرارة
            _buildSlider(
              label: 'الحرارة',
              value: _temperatureValue,
              min: -10,
              max: 50,
              unit: '°C',
              onChanged: (value) => setState(() => _temperatureValue = value),
            ),
            
            // الملوحة
            _buildSlider(
              label: 'الملوحة',
              value: _salinityValue,
              min: 0,
              max: 10,
              unit: 'dS/m',
              onChanged: (value) => setState(() => _salinityValue = value),
            ),
            
            // العناصر الغذائية
            const Text(
              'العناصر الغذائية:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            
            _buildSlider(
              label: 'نيتروجين (N)',
              value: _nitrogenValue,
              min: 0,
              max: 100,
              unit: 'ppm',
              onChanged: (value) => setState(() => _nitrogenValue = value),
            ),
            
            _buildSlider(
              label: 'فوسفور (P)',
              value: _phosphorusValue,
              min: 0,
              max: 100,
              unit: 'ppm',
              onChanged: (value) => setState(() => _phosphorusValue = value),
            ),
            
            _buildSlider(
              label: 'بوتاسيوم (K)',
              value: _potassiumValue,
              min: 0,
              max: 100,
              unit: 'ppm',
              onChanged: (value) => setState(() => _potassiumValue = value),
            ),
            
            const SizedBox(height: 40),
            
            // زر التحليل
            Center(
              child: AgriButton(
                text: 'تحليل التربة',
                icon: Icons.analytics,
                onPressed: _analyzeSoil,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
