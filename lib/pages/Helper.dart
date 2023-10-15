import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';


class Helper extends StatefulWidget {
  @override
  _HelperState createState() => _HelperState();
}

class _HelperState extends State<Helper> {
  String dropdownValue = 'Выберите один из вариантов';
  @override
  Widget build(BuildContext context) {
    return Scaffold( // Добавляем Scaffold здесь
      backgroundColor: Color(0xFFF3F7FA),
      body: Stack(
        children: [
          Positioned(
            top: 52,
            left: 20,
            child: SvgPicture.asset('assets/Vector.svg'),
          ),
          Align(
            alignment: Alignment.topCenter,
            child: Padding(
              padding: const EdgeInsets.only(top: 50),
              child: Text(
                'Запись в отделение',
                style: TextStyle(
                  fontFamily: 'Roboto',
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF122790),
                ),
              ),
            ),
          ),
          Positioned(
            top: 90,
            left: 20,
            child:
            Column(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Имя',
                      style: TextStyle(
                        fontFamily: 'Roboto',
                        color: Color(0xFF7B7E86),
                        fontSize: 15,
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
                        onChanged: (value) {},
                      ),
                    ),
                  ],
                ),

                // Дополнительный контейнер 2
                SizedBox(height: 5,),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Фамилия',
                      style: TextStyle(
                        fontFamily: 'Roboto',
                        color: Color(0xFF7B7E86),
                        fontSize: 15,
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
                        onChanged: (value) {},
                      ),
                    ),
                  ],
                ),

              ],

            ),
          ),
          Positioned(
            top: 240,
            left: 20,
            child: Container(
              child: Text(
                'Цель посещения',
                style: TextStyle(
                  fontFamily: 'Roboto',
                  fontSize: 15,
                  color: Color(0xFF7B7E86),
                ),
              ),
            ),
          ),
          Positioned(
            top: 270,
            left: 20,
            child: Container(
              width: 300,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12 ),
                  border: Border.all(color: Color(0xFF7B7E86),),),
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),// Здесь устанавливаем фиксированную высоту
              child: DropdownButton<String>(
                value: dropdownValue,
                style: const TextStyle(color: Color(0xFF7B7E86), fontSize: 15),
                iconSize: 36,

                onChanged: (String? newValue) {
                  setState(() {
                    dropdownValue = newValue!;
                  });
                },

                items: const [
                  DropdownMenuItem<String>(
                    value: 'Выберите один из вариантов',
                    child: Text('Выберите один из вариантов'),
                  ),
                  DropdownMenuItem<String>(
                    value: 'Получение кредита',
                    child: Text('Получение кредита'),
                  ),
                  DropdownMenuItem<String>(
                    value: 'Консультация по инвестициям',
                    child: Text('Консультация по инвестициям'),
                  ),
                  DropdownMenuItem<String>(
                    value: 'Финансовое планирование',
                    child: Text('Финансовое планирование'),
                  ),
                  DropdownMenuItem<String>(
                    value: 'Обмен валюты',
                    child: Text('Обмен валюты'),
                  ),
                ],
              ),
            )
            ),
          Positioned(
            top: 340,
            left: 20,
            child: Container(
              child: Text(
                'Дата и Время посещения',
                style: TextStyle(
                  fontFamily: 'Roboto',
                  fontSize: 15,
                  color: Color(0xFF7B7E86),
                ),
              ),
            ),
          ),
          Positioned(
            top:370,
          left: 20,
          child:
          Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  OutlinedButton(
                    onPressed: () {
                      // Обработчик для кнопки 4
                    },
                    child: Text(
                      '14:00',
                      style: TextStyle(
                        fontSize: 20,
                        color: Color(0xFF7B7E86), // Измените цвет текста по вашему желанию
                      ),
                    ),
                    style: OutlinedButton.styleFrom(
                      side: BorderSide(
                        color: Color(0xFF7B7E86), // Измените цвет обводки по вашему желанию
                        width: 1,
                      ),
                      padding: EdgeInsets.symmetric(
                        horizontal: 16.0,
                        vertical: 12.0,
                      ),
                    ),
                  ),
                  SizedBox(width: 10),
                  OutlinedButton(
                    onPressed: () {
                      // Обработчик для кнопки 5
                    },
                    child: Text(
                      '14:10',
                      style: TextStyle(
                        fontSize: 20,
                        color: Color(0xFF7B7E86), // Измените цвет текста по вашему желанию
                      ),
                    ),
                    style: OutlinedButton.styleFrom(
                      side: BorderSide(
                        color: Color(0xFF7B7E86), // Измените цвет обводки по вашему желанию
                        width: 1,
                      ),
                      padding: EdgeInsets.symmetric(
                        horizontal: 16.0,
                        vertical: 12.0,
                      ),
                    ),
                  ),
                  SizedBox(width: 10),
                  OutlinedButton(
                    onPressed: () {
                      // Обработчик для кнопки 6
                    },
                    child: Text(
                      '14:20',
                      style: TextStyle(
                        fontSize: 20,
                        color: Color(0xFF7B7E86), // Измените цвет текста по вашему желанию
                      ),
                    ),
                    style: OutlinedButton.styleFrom(
                      side: BorderSide(
                        color: Color(0xFF7B7E86), // Измените цвет обводки по вашему желанию
                        width: 1,
                      ),
                      padding: EdgeInsets.symmetric(
                        horizontal: 16.0,
                        vertical: 12.0,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  OutlinedButton(
                    onPressed: () {
                      // Обработчик для кнопки 4
                    },
                    child: Text(
                      '14:30',
                      style: TextStyle(
                        fontSize: 20,
                        color: Color(0xFF7B7E86), // Измените цвет текста по вашему желанию
                      ),
                    ),
                    style: OutlinedButton.styleFrom(
                      side: BorderSide(
                        color: Color(0xFF7B7E86), // Измените цвет обводки по вашему желанию
                        width: 1,
                      ),
                      padding: EdgeInsets.symmetric(
                        horizontal: 16.0,
                        vertical: 12.0,
                      ),
                    ),
                  ),
                  SizedBox(width: 10),
                  OutlinedButton(
                    onPressed: () {
                      // Обработчик для кнопки 5
                    },
                    child: Text(
                      '14:40',
                      style: TextStyle(
                        fontSize: 20,
                        color: Color(0xFF7B7E86), // Измените цвет текста по вашему желанию
                      ),
                    ),
                    style: OutlinedButton.styleFrom(
                      side: BorderSide(
                        color: Color(0xFF7B7E86), // Измените цвет обводки по вашему желанию
                        width: 1,
                      ),
                      padding: EdgeInsets.symmetric(
                        horizontal: 16.0,
                        vertical: 12.0,
                      ),
                    ),
                  ),
                  SizedBox(width: 10),
                  OutlinedButton(
                    onPressed: () {
                      // Обработчик для кнопки 6
                    },
                    child: Text(
                      '14:50',
                      style: TextStyle(
                        fontSize: 20,
                        color: Color(0xFF7B7E86), // Измените цвет текста по вашему желанию
                      ),
                    ),
                    style: OutlinedButton.styleFrom(
                      side: BorderSide(
                        color: Color(0xFF7B7E86), // Измените цвет обводки по вашему желанию
                        width: 1,
                      ),
                      padding: EdgeInsets.symmetric(
                        horizontal: 16.0,
                        vertical: 12.0,
                      ),
                    ),
                  ),
                ],
              ),

            ],
          ),
          ),
          Positioned(
            top: 490,
            left: 20,
            child: Container(
              child: Text(
                'Местоположение',
                style: TextStyle(
                  fontFamily: 'Roboto',
                  fontSize: 15,
                  color: Color(0xFF7B7E86),
                ),
              ),
            ),
          ),
          Positioned(
            top: 530, // Устанавливаем отступ сверху от предыдущего виджета
            left: 20,
            child: Image.asset(
              'assets/map.jpg', // Путь к вашей картинке
              width: 300, // Установите желаемую ширину картинки
              height: 200, // Установите желаемую высоту картинки
              fit: BoxFit.cover, // Установите тип изменения размера (cover, contain, fill, etc.)
            ),
          ),
          Positioned(
            bottom: 00, // Установите желаемый отступ снизу
            left: 0, right: 0, // Занимайте всю доступную ширину
            child: ElevatedButton(
              onPressed: () {
                // Действие, которое будет выполнено при нажатии кнопки
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFF122790), // Цвет кнопки (синий)
                minimumSize: Size(double.infinity, 50), // Размер кнопки (ширину на всю доступную ширину и высоту 50)
              ),
              child: Text(
                'Получить талон',
                style: TextStyle(
                  fontSize: 18, // Размер текста
                  color: Colors.white, // Цвет текста (белый)
                ),
              ),
            ),
          ),

        ],
      ),
    );
  }
}
