import 'package:admin_dashboard/ui/layouts/auth/widgets/background_twitter.dart';
import 'package:admin_dashboard/ui/layouts/auth/widgets/custom_title.dart';
import 'package:admin_dashboard/ui/layouts/auth/widgets/links_bar.dart';
import 'package:flutter/material.dart';


class AuthLayout extends StatelessWidget {
  const AuthLayout({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {

    final size = MediaQuery.of(context).size;

    return Scaffold(
      body: Scrollbar(
        thumbVisibility: false,
        child: ListView(
          physics: const ClampingScrollPhysics(),
          children: [
                (size.width>900)
                ? _DesktopBody(child: child) // Desktop
                : _MovileBody(child: child), // Movil
                // Footer LinksBar
                const LinksBar(),
            ],
        ),
      )


   );
  }
}

// Vista para moviles
class _MovileBody extends StatelessWidget {
  const _MovileBody({Key? key, required this.child}) : super(key: key);

  final Widget child;
  
  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.black,
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children:  [
                const SizedBox(height: 20,),
                const CustomTitle(),
                Container(
                    width: double.infinity,
                    height: 420,
                    child: child,
                ),
                Container(
                    width: double.infinity,
                    height: 400,
                    child: const BackgroundTwitter(),
                )
            ],
        ),
    );
  }
}

// Vista en desktop y tablets
class _DesktopBody extends StatelessWidget {
  const _DesktopBody({Key? key, required this.child}) : super(key: key);

  final Widget child; 

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Container(
        width: size.width,
        height: size.height * 0.95,
        color: Colors.black,
        child: Row(
            children: [
              // Twitter Background
              const Expanded(child: BackgroundTwitter()),
              // viewcontainer
              Container(
                  width: 600,
                  color: Colors.black,
                  child: Column(
                      children: [
                        const SizedBox(height: 20,),
                        const CustomTitle(),
                        //const SizedBox(height: 20,),
                        Expanded(child: child)
                      ],
                  ),
              )
            ],
        ),
    );
  }

}