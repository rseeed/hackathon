import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_nav_bar/google_nav_bar.dart';


class RecoveryPass extends StatelessWidget {
  const RecoveryPass({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF3F7FA),
      body: Stack(
        children: [
          Positioned(
            top: 45, // Отступ сверху
            left: 20, // Отступ слева
            child: SvgPicture.asset('assets/VTB_logo (2).svg', height: 30, width: 30,), // Путь к вашему первому изображению
          ),
          Positioned(
            top: 120, // Отступ сверху для поля ввода
            left: 20, // Отступ слева для поля ввода
            child: Container(
              width: 330.0, // Ширина поля ввода
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      width: 260.0, // Увеличенная ширина поля ввода
                      height: 40.0, // Высота поля ввода
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(
                          color: Color(0xFFD6D8DE),
                          width: 1,
                        ),
                      ),
                      child: TextField(
                        decoration: const InputDecoration(
                          hintText: 'Город, район, улица',
                          contentPadding: EdgeInsets.only(left: 10, bottom: 10),
                          border: InputBorder.none,
                        ),
                        style: TextStyle(color: Color(0xFF7B7E86), fontSize: 15),
                        obscureText: false,
                        onChanged: (value) {},
                        maxLines: 1, // Установите максимальное количество строк равным 1
                      ),
                    ),
                  ),
                  const SizedBox(width: 10), // Отступ между полем ввода и кнопкой
                  ElevatedButton(
                    onPressed: () {
                      // Действие при нажатии на кнопку "Подобрать"
                    },
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(Color(0xFF002882)),
                    ),
                    child: const Text(
                      'Подобрать',
                      style: TextStyle(fontSize: 14, color: Colors.white),
                    ),
                  ),
                  const SizedBox(width: 10), // Дополнительный отступ между кнопкой и изображением
                  SvgPicture.asset('assets/Group 6356.svg', height: 40, width: 40,), // Путь к векторному изображению
                ],
              ),
            ),
          ),
          Positioned(
            top: 200, // Позиция сверху для контейнера с тенью
            left: 20, // Позиция слева для контейнера с тенью
            child: Container(
              width: 345.0, // Ширина контейнера с тенью
              height: 470.0, // Высота контейнера с тенью
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
                padding: const EdgeInsets.only(left: 20, top: 20, bottom: 10), // Отступы внутри контейнера
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Отделения',
                      style: TextStyle(
                        color: Color(0xFF122790),
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Expanded(
                      child: ListView(
                        children: [
                          _buildBranch('г.Москва, ул.Малая Пионерская', '5 км', () {print('клик');}),
                          _buildBranch('г.Москва, ул.Малая Пионерская', '5 км, м.Бибирево', () {print('клик');}),
                          _buildBranch('г.Москва, ул.Малая Пионерская', '5 км, м.Маяковская', () {print('клик');}),
                          _buildBranch('г.Москва, ул.Малая Пионерская', '5 км, м.Маяковская', () {print('клик');}),
                          _buildBranch('г.Москва, ул.Малая Пионерская', '5 км, м.Маяковская', () {print('клик');}),
                          _buildBranch('г.Москва, ул.Малая Пионерская', '5 км, м.Маяковская', () {print('клик');}),
                          _buildBranch('г.Москва, ул.Малая Пионерская', '5 км, м.Маяковская', () {print('клик');}),
                          _buildBranch('г.Москва, ул.Малая Пионерская', '5 км, м.Маяковская', () {print('клик');}),
                          _buildBranch('г.Москва, ул.Малая Пионерская', '5 км, м.Маяковская', () {print('клик');}),
                          _buildBranch('г.Москва, ул.Малая Пионерская', '5 км, м.Маяковская', () {print('клик');}),
                          // Добавьте больше отделений, если необходимо
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: Container(
        color: Color(0xFF122790),
        child: const Padding(
          padding: EdgeInsets.symmetric(
              horizontal: 15.0, vertical: 8.0
          ),
          child: GNav(
            selectedIndex: 1,
            gap: 8,
            backgroundColor: Color(0xFF122790),
            color: Colors.white,
            activeColor: Colors.white,
            tabBackgroundColor: Color(0x5000AAFF),
            padding: EdgeInsets.all(16),
            tabBorderRadius: 16,
            tabs: [
              GButton(
                icon: Icons.person,
                text: 'Профиль',
              ),
              GButton(
                icon: Icons.business,
                text: 'Отделения',
              ),
              GButton(
                icon: Icons.headset_mic,
                text: 'Поддержка',
              ),
            ]
          ),
        ),
      ),
    );
  }
  Widget _buildBranch(String salePointName, String address, Function() onTap) {
    return Card(
      elevation: 1,
      margin: const EdgeInsets.only(left: 10, bottom: 5, right: 30),
      child: ListTile(
        onTap: onTap,
        title: Text(
          salePointName,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        subtitle: Text(address),
      ),
    );
  }
}