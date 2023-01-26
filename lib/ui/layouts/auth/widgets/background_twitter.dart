import 'package:flutter/material.dart';

class BackgroundTwitter extends StatelessWidget {
  const BackgroundTwitter({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Container(
                width: 600,
                height: double.infinity,
                decoration: buidBoxDecoration(),
                child: 
                    Container(
                      constraints: const BoxConstraints(maxHeight: 400),
                      child: const Center(
                          child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 20),
                            child: Image(
                                  image: AssetImage('twitter-white-logo.png',),
                                  width: 400,
                                ),
                          ),
                      ),
                ),
              )
    );
  }

  
  BoxDecoration buidBoxDecoration() {
    return const BoxDecoration(
        image: DecorationImage(
            image: AssetImage('twitter-bg.png'),
            fit: BoxFit.cover
        )
    );
  }
}