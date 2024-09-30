import 'package:flutter/material.dart';

class AtdTab extends StatelessWidget{
  const AtdTab({super.key, required this.title, required this.chart});

  final String title;
  final Widget chart;

  @override
  Widget build(BuildContext context) {
      return Expanded(
            child: Container(
              padding: const EdgeInsets.all(20),
              margin: const EdgeInsets.only(left: 20, right: 20, bottom: 100, top: 10),
              width: double.infinity,
              height: double.infinity,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(20)),
              color: Color.fromARGB(255, 245, 239, 255),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(title, style: const TextStyle(color: Color.fromARGB(221, 34, 40, 49), fontSize: 20, fontWeight: FontWeight.w700),),
                  const SizedBox(height: 40,),
                  chart,
                ],
              ),
            ),
          );   
  }

}
