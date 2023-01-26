import 'package:flutter/material.dart';

class LinkText extends StatefulWidget {
  const LinkText({Key? key, required this.text,  this.onPressed}) : super(key: key);

  final String text;
  final Function? onPressed;
  
  @override
  State<LinkText> createState() => _LinkTextState();
}

class _LinkTextState extends State<LinkText> {

  bool isOver = false;
  
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){ 
          if(widget.onPressed != null)  widget.onPressed!();
      },
      child: MouseRegion(
        cursor: SystemMouseCursors.click,
        onEnter: (event) => setState(() {
            isOver= true;
        }),
        onExit: (event) => setState(() {
            isOver= false;
        }),
        child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            child: Text(
                  widget.text, 
                  style: TextStyle(
                      fontSize: 12, 
                      color: Colors.white,
                      decoration: isOver ? TextDecoration.underline: TextDecoration.none)),
        ),
      ),
    );
  }
}