import 'package:flutter/material.dart';

class SnackbarWidget extends StatelessWidget{
  const SnackbarWidget({super.key, required this.title});
  final String title;
  @override
  Widget build(BuildContext context) {
    return SnackBar(content: Text(title), backgroundColor: const Color.fromARGB(132, 242, 103, 34));    
  }
}