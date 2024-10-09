import 'package:flutter/material.dart';
import 'package:login_app/screen/journey.dart';
class CardItem extends StatelessWidget {
  const CardItem({super.key, required this.title, required this.imageUrl});
  final String title;
  final String imageUrl;

  
  @override
  Widget build(BuildContext context) {
    void startJourney() {
      Navigator.of(context).push(MaterialPageRoute(builder: (ctx) => Journey(title: title)));
    }
    return GestureDetector(
      onTap: startJourney,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.black54, width: 1),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          children: [
            SizedBox(
              width: 45,
              height: 45,
              child: Image.asset(
                imageUrl,
              ),
            ),
            const SizedBox(height: 5,),
            SizedBox(
              width: 85,
              child: Text(
                title,
                style: const TextStyle(
                    fontSize: 10,
                    fontWeight: FontWeight.w600,
                    color: Colors.black),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
