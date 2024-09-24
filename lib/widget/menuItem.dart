import 'package:flutter/material.dart';

class MenuItem extends StatelessWidget {
  const MenuItem(
      {super.key,
      required this.title,
      required this.logo,
      required this.onTapped});

  final String title;
  final IconData logo;
  final Function onTapped;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20),
      child: Column(
        children: [
          ListTile(
            iconColor: const Color.fromARGB(255, 80, 71, 66),
            textColor: const Color.fromARGB(255, 80, 71, 66),
            leading: Icon(
              logo,
              size: 24,
            ),
            title: Text(
              title,
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
            ),
            onTap: () {
              onTapped();
            },
          ),
          Container(
            margin: const EdgeInsets.only(bottom: 20, right: 60, left: 52),
            width: double.infinity,
            height: 0,
            decoration: const BoxDecoration(
              color: Color.fromARGB(255, 80, 71, 66),
              boxShadow: [
                BoxShadow(
                  color: Color.fromARGB(255, 80, 71, 66),
                  spreadRadius: 0.5,
                  blurRadius: 0.5,
                  offset: Offset(0, 0.5),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
