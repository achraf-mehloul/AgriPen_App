import 'package:flutter/material.dart';
import '../home_screen.dart';

class GuestModeScreen extends StatelessWidget {
  const GuestModeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.person_outline,
              size: 100,
              color: Colors.green,
            ),
            const SizedBox(height: 30),
            const Text(
              'وضع الزائر',
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: Colors.green,
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              'يمكنك استخدام التطبيق كمستخدم زائر، لكن بعض الميزات ستكون محدودة',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16, color: Colors.grey),
            ),
            const SizedBox(height: 30),
            
            const Row(
              children: [
                Icon(Icons.check, color: Colors.green),
                SizedBox(width: 10),
                Expanded(child: Text('تحليل التربة')),
              ],
            ),
            const SizedBox(height: 10),
            const Row(
              children: [
                Icon(Icons.check, color: Colors.green),
                SizedBox(width: 10),
                Expanded(child: Text('اختيار المحاصيل')),
              ],
            ),
            const SizedBox(height: 10),
            const Row(
              children: [
                Icon(Icons.close, color: Colors.red),
                SizedBox(width: 10),
                Expanded(child: Text('حفظ التقارير (غير متاح)')),
              ],
            ),
            const SizedBox(height: 10),
            const Row(
              children: [
                Icon(Icons.close, color: Colors.red),
                SizedBox(width: 10),
                Expanded(child: Text('المزامنة السحابية (غير متاح)')),
              ],
            ),
            const SizedBox(height: 40),
            
            // زر المتابعة
            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => const HomeScreen()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: const Text(
                  'المتابعة كزائر',
                  style: TextStyle(fontSize: 18),
                ),
              ),
            ),
            const SizedBox(height: 20),
            
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text(
                'العودة لتسجيل الدخول',
                style: TextStyle(fontSize: 16, color: Colors.green),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
