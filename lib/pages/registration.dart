import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hackathon/pages/main_screen.dart';
import 'package:hackathon/pages/recoveryPass.dart';


class Registration extends StatelessWidget {
  const Registration({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Stack(
          children: [
            Positioned(
              left: 20,
              // Фоновое векторное изображение
              child: SvgPicture.asset(
                'assets/Vector 4.svg',
                fit: BoxFit.cover,
              ),
            ),
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Logo
                  Transform.translate(
                    offset: const Offset(-25, -10),
                    child: SvgPicture.asset(
                      'assets/VTB_logo.svg',
                      width: 50,
                      height: 50,
                    ),
                  ),
                  const SizedBox(height: 30),

                  // Sign up container
                  Container(
                    width: 369.0,
                    height: 293.0,
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
                    child: Stack(
                      children: [
                        const Positioned(
                          top: 15.0,
                          left: 30.0,
                          child: Text(
                            'Вход',
                            style: TextStyle(
                              fontFamily: 'Roboto',
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF122790),
                              fontSize: 34.0,
                            ),
                          ),
                        ),
                        // Дополнительный контейнер 1
                        Positioned(
                          top: 70.0,
                          left: 30.0,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                'Логин',
                                style: TextStyle(
                                  fontFamily: 'Roboto',
                                  color: Color(0xFF7B7E86),
                                  fontSize: 13,
                                ),
                              ),
                              SizedBox(height: 10),
                              Container(
                                width: 255.0,
                                height: 40.0,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  border: Border.all(
                                    color: Color(0xFFD6D8DE),
                                    width: 1,
                                  ),
                                ),
                                child: TextField(
                                  decoration: const InputDecoration(
                                    contentPadding: EdgeInsets.only(left: 10, bottom: 10),
                                    border: InputBorder.none,
                                  ),
                                  style: TextStyle(color: Color(0xFF7B7E86)),
                                  obscureText: false,
                                  onChanged: (value) {},
                                ),
                              ),
                            ],
                          ),
                        ),
                        // Дополнительный контейнер 2
                        Positioned(
                          top: 150.0,
                          left: 30.0,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                'Пароль',
                                style: TextStyle(
                                  fontFamily: 'Roboto',
                                  color: Color(0xFF7B7E86),
                                  fontSize: 13,
                                ),
                              ),
                              SizedBox(height: 10),
                              Container(
                                width: 255.0,
                                height: 40.0,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  border: Border.all(
                                    color: Color(0xFFD6D8DE),
                                    width: 1,
                                  ),
                                ),
                                child: TextField(
                                  decoration: const InputDecoration(
                                    contentPadding: EdgeInsets.only(left: 10, bottom: 10),
                                    border: InputBorder.none,
                                  ),
                                  style: TextStyle(color: Color(0xFF7B7E86)),
                                  obscureText: true,
                                  onChanged: (value) {},
                                ),
                              ),
                            ],
                          ),
                        ),
                        Positioned(
                          top: 235.0,
                          left: 30.0,

                          child: GestureDetector(
                            onTap: () =>
                                Navigator.pushReplacementNamed(context, '/main'),
                            child: Container(
                              width: 74, // Установите желаемую ширину
                              height: 40, // Установите желаемую высоту
                              alignment: Alignment.center,
                              color: const Color(0xFF002882),
                              child: const Text('Войти', style: TextStyle(fontSize: 14, color: Colors.white)),
                            ),
                          ),
                        ),
                    ],
                  ),
                ),

                  const SizedBox(height: 30),
                  Positioned(
                    bottom: 30,
                    child: InkWell(
                      onTap: () {
                        // Переход на другую страницу
                        // Navigator.push(
                        //   context,
                        //   MaterialPageRoute(builder: (context) => RecoveryPass()),
                        // );
                      },
                      child: RichText(
                        text: TextSpan(
                          text: 'Забыли ',
                          style: const TextStyle(
                            color: Color(0xFF7B7E86), // Цвет логина
                            fontSize: 13,
                          ),
                          children: <TextSpan>[
                            TextSpan(
                              text: 'логин',
                              style: const TextStyle(
                                color: Color(0xFF002882), // Цвет логина
                                fontSize: 13,
                                decoration: TextDecoration.underline,
                              ),
                              recognizer: TapGestureRecognizer()
                                ..onTap = () {
                                  // Действие при нажатии на "логин"
                                  // Navigator.push(
                                  //   context,
                                  //   MaterialPageRoute(builder: (context) => RecoveryPass()),
                                  // );
                                },
                            ),
                            const TextSpan(text: ' или ',
                              style: TextStyle(
                                color: Color(0xFF7B7E86), // Цвет логина
                                fontSize: 13,
                              ),
                            ),
                            TextSpan(
                              text: 'пароль',
                              style: const TextStyle(
                                color: Color(0xFF002882), // Цвет логина
                                fontSize: 13,
                                decoration: TextDecoration.underline,
                              ),
                              recognizer: TapGestureRecognizer()
                                ..onTap = () {
                                  // Действие при нажатии на "пароль"
                                  // Navigator.push(
                                  //   context,
                                  //   MaterialPageRoute(builder: (context) => RecoveryPass()),
                                  // );
                                },
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}