import 'package:flutter/material.dart';

import '../../../buttons/link_text.dart';

class LinksBar extends StatelessWidget {
  const LinksBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
        color: Colors.black,
        height: (size.width>900)? size.height*0.07 : null,
        child: Wrap(
            alignment: WrapAlignment.center,
            children: const [
            LinkText(text: 'About',),
            LinkText(text: 'Help Center',),
            LinkText(text: 'Term of Service',),
            LinkText(text: 'Privacy Policy',),
            LinkText(text: 'Cooky Policy',),
            LinkText(text: 'Ads Info',),
            LinkText(text: 'Blog',),
            LinkText(text: 'Status',),
            LinkText(text: 'Careers',),
            LinkText(text: 'Brand Resources',),
            LinkText(text: 'Advertising',),
            LinkText(text: 'Marketing',),
        ]),
    );
  }
}