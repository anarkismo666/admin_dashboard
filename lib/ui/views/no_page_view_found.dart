
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class NoPageViewFound extends StatelessWidget {
  const NoPageViewFound({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        child:  Center(
            child: Text(
                "404 Page not found", 
                style: GoogleFonts.roboto(fontSize: 30, fontWeight: FontWeight.bold),
            ),
        ),
    );
  }
}