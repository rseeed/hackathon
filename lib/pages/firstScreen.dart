import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: SplashScreen(), // Используем виджет SplashScreen в качестве главного виджета
  ));
}

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: Future.delayed(Duration(seconds: 2), () {}),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          // Когда Future завершен, перейдите на новую страницу
          WidgetsBinding.instance.addPostFrameCallback((_) {
            Navigator.of(context).pushReplacement(
              MaterialPageRoute(
                builder: (BuildContext context) => NewPage(), // Замените NewPage на виджет вашей новой страницы
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
              // Здесь добавляем анимацию загрузки
              Positioned(
                top: 500, // Установите желаемую вертикальную позицию
                left: 180, // Установите желаемую горизонтальную позицию
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(Color(0xFF002882)), // Задайте цвет загрузки
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
