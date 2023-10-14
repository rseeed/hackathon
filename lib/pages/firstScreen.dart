import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hackathon/pages/registration.dart';


class firstScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: Future.delayed(const Duration(seconds: 2), () {}),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          WidgetsBinding.instance.addPostFrameCallback((_) {
            Navigator.of(context).pushReplacement(
              MaterialPageRoute(
                builder: (BuildContext context) => const Registration(),
              ),
            );
          });
        }

        return Scaffold(
          body: Stack(
            children: [
              Positioned(
                left: 0,
                top: 150,
                child: SvgPicture.asset(
                  'assets/Vector 43.svg',
                ),
              ),
              Positioned(
                top: 100,
                left: 100,
                child: SvgPicture.asset(
                  'assets/VTB_logo.svg',
                  width: 50,
                  height: 50,
                ),
              ),
              Center(
                child: SvgPicture.asset(
                  'assets/Polygon 8.svg',
                ),
              ),
              const Positioned(
                top: 500,
                left: 180,
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(Color(0xFF002882)),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
