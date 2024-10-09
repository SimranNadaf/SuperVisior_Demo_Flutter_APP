import 'package:flutter/material.dart';

class UserInfo extends StatelessWidget{
  const UserInfo({super.key, required this.title, required this.value, required this.logo});

  final String title;
  final String value;
  final IconData logo;

@override
  Widget build(BuildContext context) {
      return Padding(
        padding: const EdgeInsets.fromLTRB(30,15,10,15),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Icon(logo, color: Colors.white,),
            const SizedBox(width: 16,),
            Text(
                '$title: $value',
                style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w400, color: Colors.white),
              ),
          ],
        ),
      );    
  }
}