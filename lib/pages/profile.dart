import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:hackathon/main.dart';
import 'package:hackathon/pages/main_screen.dart';


class Profile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF3F7FA),
      body: Stack(
        children: [
          Positioned(
            top: 400,
            left: 10, // Отступ слева
            right: 0, // Отступ справа
            child: Transform.rotate(
              angle: 0, // Угол поворота 0 градусов
              child: SvgPicture.asset(
                'assets/Vector 42.svg',
                width: MediaQuery.of(context).size.width, // Установите ширину равной ширине экрана
                height: 300.0, // Установите желаемую высоту
                fit: BoxFit.cover,
              ),
            ),
          ),
          Positioned(
            top: 50,
            left: 20,
            child: SvgPicture.asset('assets/VTB_logo.svg', height: 30, width: 30),
          ),
          Positioned(
            top: 35,
            right: 20,
            child: SvgPicture.asset('assets/Logout.svg', height: 40, width: 40),
          ),
          Container(
            // Добавляем фоновое изображение
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/Vector 42.svg'),
                fit: BoxFit.cover, // Это растягивает изображение на весь экран
              ),
            ),
          ),
          Positioned(
            top: 90,
            left: 20,
            child: Container(
              width: 345.0,
              height: 100.0,
              child: const Text(
                'Еда Промокодовна, здравствуйте!',
                style: TextStyle(
                  fontFamily: 'Roboto',
                  fontSize: 34,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF122790),
                ),
                softWrap: true,
              ),
            ),
          ),
          Positioned(
            top: 187,
            left: 20,
            right: 20,
            child: Container(
              width: 345.0,
              height: 180.0,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10.0),
                boxShadow: const [
                  BoxShadow(
                    color: Colors.grey,
                    blurRadius: 10.0,
                    spreadRadius: 2.0,
                    offset: Offset(0, 4),
                  ),
                ],
              ),
              child: Padding(
                padding: EdgeInsets.only(left: 20, top: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Мои талоны',
                      style: TextStyle(
                        color: Color(0xFF122790),
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 20),
                    Row(
                      children: [
                        SvgPicture.asset('assets/Ellipse 10.svg', height: 25, width: 25),
                        const SizedBox(width: 10),
                        const Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'г. Москва, ул. Пришвина, д. 23',
                              style: TextStyle(fontSize: 13, color: Colors.black),
                            ),
                            Text(
                              '5 км, м.Бибирево',
                              style: TextStyle(fontSize: 11, color: Color(0xFF7B7E86)),
                            ),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    Row(
                      children: [
                        SvgPicture.asset('assets/Ellipse 10.svg', height: 25, width: 25),
                        SizedBox(width: 10),
                        const Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'г.Москва, ул.Садовая',
                              style: TextStyle(fontSize: 13, color: Colors.black),
                            ),
                            Align(
                              alignment: Alignment(-1, 0),
                              child: Text(
                                '5 км, м.Маяковская',
                                style: TextStyle(fontSize: 11, color: Color(0xFF7B7E86)),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: CurvedNavigationBar(
          backgroundColor: const Color(0xFFF3F7FA),
          color: const Color(0xFF122790),
          height: 65,
          index: 0,
          onTap: (index) {
            if (index == 1) {
              Navigator.pushReplacementNamed(context, '/main');
            }
            if (index == 2) {
              Navigator.pushReplacementNamed(context, '/chat');
            }
          },
          items: const [
            Icon(Icons.account_circle_sharp, color: Colors.white),
            Icon(Icons.business, color: Colors.white),
            Icon(Icons.message, color: Colors.white),
          ]
      ),
    );
  }
}