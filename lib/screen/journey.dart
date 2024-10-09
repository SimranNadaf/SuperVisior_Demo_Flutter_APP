import 'package:flutter/material.dart';

class Journey extends StatelessWidget {
  const Journey({super.key, required this.title});
  final String title;
  @override
  Widget build(BuildContext context) {
      return Scaffold(
         backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          title,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: const Color.fromARGB(255, 242, 103, 34),
        foregroundColor: Colors.white,
      ),
      body: Center(child: Text('Let\'s Start $title', style: const TextStyle(fontSize: 24, fontWeight: FontWeight.w500, color: Colors.black87),)),
      );   
  }
}