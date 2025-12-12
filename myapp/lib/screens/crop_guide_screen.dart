import 'package:flutter/material.dart';

class CropGuideScreen extends StatelessWidget {
  final String cropName;
  final String cropImage;

  const CropGuideScreen({
    super.key,
    required this.cropName,
    required this.cropImage,
  });

  Map<String, dynamic> _getCropGuide(String crop) {
    final guides = {
      'قمح': {
        'water': '500-600 ملم/موسم',
        'fertilizer': 'نيتروجين: 150-200 كجم/هكتار\nفوسفور: 60-80 كجم/هكتار',
        'planting': 'نوفمبر - ديسمبر',
        'spacing': '20 سم بين الصفوف',
        'notes': 'يتحمل البرودة، يحتاج تربة جيدة الصرف',
        'season': 'شتوي',
        'harvest': '3-4 أشهر',
      },
      'ذرة': {
        'water': '500-800 ملم/موسم',
        'fertilizer': 'نيتروجين: 180-220 كجم/هكتار\nبوتاسيوم: 80-120 كجم/هكتار',
        'planting': 'أبريل - مايو',
        'spacing': '60-75 سم بين الصفوف',
        'notes': 'محصول صيفي يحتاج حرارة',
        'season': 'صيفي',
        'harvest': '3-4 أشهر',
      },
      'طماطم': {
        'water': '600-800 ملم/موسم',
        'fertilizer': 'نيتروجين: 100-150 كجم/هكتار\nبوتاسيوم: 150-200 كجم/هكتار',
        'planting': 'فبراير - مارس أو أغسطس - سبتمبر',
        'spacing': '50-60 سم بين النباتات',
        'notes': 'تحتاج دعامات، حساسة للصقيع',
        'season': 'صيفي',
        'harvest': '2-3 أشهر',
      },
      'خيار': {
        'water': '400-600 ملم/موسم',
        'fertilizer': 'نيتروجين: 80-120 كجم/هكتار\nبوتاسيوم: 100-150 كجم/هكتار',
        'planting': 'مارس - أبريل',
        'spacing': '90-120 سم بين الصفوف',
        'notes': 'ينمو بسرعة، يحتاج رطوبة عالية',
        'season': 'صيفي',
        'harvest': '50-70 يوم',
      },
      'بطاطس': {
        'water': '500-700 ملم/موسم',
        'fertilizer': 'فوسفور: 80-120 كجم/هكتار\nبوتاسيوم: 150-200 كجم/هكتار',
        'planting': 'فبراير - مارس',
        'spacing': '30-35 سم بين النباتات',
        'notes': 'تحتاج تربة جيدة التصريف',
        'season': 'ربيعي',
        'harvest': '3-4 أشهر',
      },
    };

    return guides[crop] ?? {
      'water': 'تختلف حسب المنطقة',
      'fertilizer': 'تختلف حسب التربة',
      'planting': 'على مدار السنة',
      'spacing': 'تختلف حسب الصنف',
      'notes': 'استشر خبير زراعي محلي',
      'season': 'مختلف',
      'harvest': 'غير محدد',
    };
  }

  Widget _buildInfoChip(String label, String value, IconData icon) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        color: const Color(0xFF00D4AA).withOpacity(0.1),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: const Color(0xFF00D4AA).withOpacity(0.3)),
      ),
      child: Column(
        children: [
          Icon(icon, size: 20, color: const Color(0xFF00D4AA)),
          const SizedBox(height: 5),
          Text(
            label,
            style: const TextStyle(fontSize: 11, color: Colors.white70),
          ),
          const SizedBox(height: 3),
          Text(
            value,
            style: const TextStyle(fontSize: 13, fontWeight: FontWeight.bold, color: Colors.white),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final guide = _getCropGuide(cropName);

    return Scaffold(
      appBar: AppBar(
        title: Text('إرشادات زراعة $cropName'),
        backgroundColor: const Color(0xFF0A0E21),
      ),
      backgroundColor: const Color(0xFF0A0E21),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            // الصورة
            Container(
              height: 200,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                border: Border.all(color: const Color(0xFF00D4AA)),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(19),
                child: Image.asset(
                  cropImage,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) {
                    return Container(
                      color: const Color(0xFF1A1F38),
                      child: const Center(
                        child: Icon(Icons.eco, size: 80, color: Color(0xFF00D4AA)),
                      ),
                    );
                  },
                ),
              ),
            ),
            const SizedBox(height: 20),
            
            // معلومات سريعة
            GridView.count(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              crossAxisCount: 2,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              childAspectRatio: 1.5,
              children: [
                _buildInfoChip('الموسم', guide['season'], Icons.calendar_today),
                _buildInfoChip('مدة النضج', guide['harvest'], Icons.timer),
              ],
            ),
            const SizedBox(height: 20),
            
            // إرشادات
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.05),
                borderRadius: BorderRadius.circular(15),
                border: Border.all(color: Colors.white.withOpacity(0.1)),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'إرشادات الزراعة',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
                  ),
                  const SizedBox(height: 15),
                  
                  _buildGuideItem('💧 كمية الماء', guide['water'], Icons.water_drop),
                  const SizedBox(height: 12),
                  
                  _buildGuideItem('🌱 السماد', guide['fertilizer'], Icons.grass),
                  const SizedBox(height: 12),
                  
                  _buildGuideItem('📅 وقت الزراعة', guide['planting'], Icons.calendar_today),
                  const SizedBox(height: 12),
                  
                  _buildGuideItem('📏 المسافات', guide['spacing'], Icons.square_foot),
                  const SizedBox(height: 12),
                  
                  _buildGuideItem('💡 ملاحظات', guide['notes'], Icons.info),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildGuideItem(String title, String value, IconData icon) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(icon, color: const Color(0xFF00D4AA), size: 24),
        const SizedBox(width: 12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600, color: Colors.white),
              ),
              const SizedBox(height: 4),
              Text(
                value,
                style: TextStyle(fontSize: 14, color: Colors.white.withOpacity(0.8)),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
