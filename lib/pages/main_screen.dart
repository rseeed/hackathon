import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:geolocator/geolocator.dart';
import 'package:geocoding/geocoding.dart';
import 'dart:convert';
import 'dart:io';
import 'dart:math';
import 'package:flutter/services.dart' show rootBundle;
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:hackathon/main.dart';
import 'package:hackathon/pages/profile.dart';


class MainScreen extends StatelessWidget {
  late String lat;
  late String long;
  List<dynamic> atms = [];

  Future<Position> _getCurrentLocation() async {
    bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Future.error('Вы отклонили геолокацию!');
    }

    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Вы отклонили геолокацию!');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return Future.error('Вы отклонили геолокацию!');
    }
    return await Geolocator.getCurrentPosition();
  }

  Future<String> getAddress(double latitude, double longitude) async {
    try {
      List<Placemark> placemarks = await placemarkFromCoordinates(latitude, longitude);
      Placemark placemark = placemarks.first;
      String address = '${placemark.street}, ${placemark.locality}, ${placemark.postalCode}, ${placemark.country}';
      return address;
    } catch (e) {
      return 'Не удалось определить адрес: $e';
    }
  }

  double toRadians(double degrees) {
    return degrees * (pi / 180);
  }

  double calculateDistance(double lat1, double lon1, double lat2, double lon2) {
    const double radius = 6371;

    double dLat = toRadians(lat2 - lat1);
    double dLon = toRadians(lon2 - lon1);

    double a = sin(dLat / 2) * sin(dLat / 2) +
        cos(toRadians(lat1)) * cos(toRadians(lat2)) *
            sin(dLon / 2) * sin(dLon / 2);

    double c = 2 * atan2(sqrt(a), sqrt(1 - a));
    double distance = radius * c;

    return distance;
  }

  Future<void> loadAtmsData() async {
    try {
      String jsonString = await rootBundle.loadString('assets/atms.json');
      Map<String, dynamic> jsonData = json.decode(jsonString);
      atms = jsonData['atms'];
    } catch (e) {
      print('Ошибка при загрузке данных: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF3F7FA),
      body: Stack(
        children: [
          Positioned(
            top: 50, // Отступ сверху
            left: 20, // Отступ слева
            child: SvgPicture.asset('assets/VTB_logo.svg', height: 30, width: 30,),
          ),
          Positioned(
            top: 110, // Отступ сверху для поля ввода
            left: 20, // Отступ слева для поля ввода
            child: Container(
              width: 350.0, // Ширина поля ввода
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      width: 260.0, // Увеличенная ширина поля ввода
                      height: 40.0, // Высота поля ввода
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(
                          color: const Color(0xFFD6D8DE),
                          width: 1,
                        ),
                      ),
                      child: TextField(
                        decoration: const InputDecoration(
                          hintText: 'Город, район, улица',
                          contentPadding: EdgeInsets.only(left: 10, bottom: 10),
                          border: InputBorder.none,
                        ),
                        style: const TextStyle(color: Color(0xFF7B7E86), fontSize: 15),
                        obscureText: false,
                        onChanged: (value) {},
                        maxLines: 1, // Установите максимальное количество строк равным 1
                      ),
                    ),
                  ),
                  const SizedBox(width: 10), // Отступ между полем ввода и кнопкой
                  ElevatedButton(
                    onPressed: () async {
                      try {
                        Position position = await _getCurrentLocation(); // Определение переменной position
                        lat = position.latitude.toString();
                        print(lat);
                        long = position.longitude.toString();
                        print(long);

                        await loadAtmsData();
                        atms.sort((a, b) {
                          double distanceA = calculateDistance(position.latitude, position.longitude,
                              a['latitude'], a['longitude']);
                          double distanceB = calculateDistance(position.latitude, position.longitude,
                              b['latitude'], b['longitude']);
                          return distanceA.compareTo(distanceB);
                        });
                        for (int i = 0; i < min(atms.length, 10); i++) {
                          print('---');
                          print('Банкомат ${i + 1}:');
                          print('Адрес: ${atms[i]['address']}');
                          print('Расстояние: ${calculateDistance(position.latitude, position.longitude,
                              atms[i]['latitude'], atms[i]['longitude'])} км');
                        }
                      } catch (e) {
                        print('Ошибка: $e');
                      }
                    },
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(Color(0xFF002882)),
                    ),
                    child: const Text(
                      'Подобрать',
                      style: TextStyle(fontSize: 14, color: Colors.white),
                    ),
                  ),
                  const SizedBox(width: 10),
                  SvgPicture.asset('assets/Group 6356.svg', height: 30, width: 30,),
                ],
              ),
            ),
          ),
          Positioned(
            top: 180,
            left: 20,
            child: Container(
              width: 355.0,
              height: 500.0,
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
                          _buildBranch('г.Москва, ул.Малая Пионерская', '5 км', context),
                          _buildBranch('г.Москва, ул.Малая Пионерская', '5 км, м.Бибирево', context),
                          _buildBranch('г.Москва, ул.Малая Пионерская', '5 км, м.Маяковская', context),
                          _buildBranch('г.Москва, ул.Малая Пионерская', '5 км, м.Маяковская', context),
                          _buildBranch('г.Москва, ул.Малая Пионерская', '5 км, м.Маяковская', context),
                          _buildBranch('г.Москва, ул.Малая Пионерская', '5 км, м.Маяковская', context),
                          _buildBranch('г.Москва, ул.Малая Пионерская', '5 км, м.Маяковская', context),
                          _buildBranch('г.Москва, ул.Малая Пионерская', '5 км, м.Маяковская', context),
                          _buildBranch('г.Москва, ул.Малая Пионерская', '5 км, м.Маяковская', context),
                          _buildBranch('г.Москва, ул.Малая Пионерская', '5 км, м.Маяковская', context),
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
      bottomNavigationBar: CurvedNavigationBar(
        backgroundColor: const Color(0xFFF3F7FA),
        color: const Color(0xFF122790),
        height: 65,
        index: 1,
        onTap: (index) {
          if (index == 0) {
            Navigator.pushReplacementNamed(context, '/profile');
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

  Widget _buildBranch(String salePointName, String address, context) {
    return Card(
      elevation: 1,
      margin: const EdgeInsets.only(left: 10, bottom: 5, right: 30),
      child: ListTile(
        onTap: () {
          Navigator.pushNamed(context, '/helper');
        },
        leading: SvgPicture.asset(
          'assets/Ellipse 10.svg',
          width: 30,
          height: 30,
        ),
        title: Text(
          salePointName,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        subtitle: Text(address),
      ),
    );
  }
}