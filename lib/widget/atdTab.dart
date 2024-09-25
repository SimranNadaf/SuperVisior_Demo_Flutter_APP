import 'package:flutter/material.dart';

class AtdTab extends StatelessWidget{
  const AtdTab({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
      return Expanded(
            child: Container(
              padding: const EdgeInsets.all(20),
              margin: const EdgeInsets.only(left: 20, right: 20, bottom: 20),
              width: double.infinity,
              height: double.infinity,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(20)),
              color: Color.fromARGB(255, 250, 246, 246),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(title, style: const TextStyle(color: Color.fromARGB(221, 61, 61, 61), fontSize: 20, fontWeight: FontWeight.w700),),
                  
                ],
              ),
            ),
          );   
  }

}