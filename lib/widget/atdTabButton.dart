import 'package:flutter/material.dart';

class Atdtabbutton extends StatefulWidget{
  const Atdtabbutton({super.key, required this.title, required this.onActivited, required this.onTapped});
  final String title;
  final bool onActivited;
  final Function onTapped;

  @override
  State<Atdtabbutton> createState() {
    return AtdtabbuttonState();
  }
}

class AtdtabbuttonState extends State<Atdtabbutton>{
  @override
  Widget build(BuildContext context) {
      return GestureDetector(
        onTap: (){
          widget.onTapped();
        },
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 10),
          margin: const EdgeInsets.symmetric(vertical: 20, horizontal: 5),
          decoration: BoxDecoration(
            color: widget.onActivited?  const Color.fromARGB(255, 63,162,246) : const Color.fromARGB(255, 255, 255, 255),
            borderRadius: BorderRadius.circular(20),
            border: Border.all(width: 1, color: const Color.fromARGB(255, 63,162,246))
          ),
          child: Text(widget.title, style: TextStyle(color: widget.onActivited?Colors.white:const Color.fromARGB(255, 63,162,246), fontWeight: FontWeight.w600),),
        ),
      );    
  }
}