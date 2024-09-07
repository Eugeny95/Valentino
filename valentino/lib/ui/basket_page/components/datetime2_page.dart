import 'package:auth_feature/data/auth_data.dart';
import 'package:date_picker_timeline/date_picker_timeline.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:intl/intl.dart';
import 'package:radio_grouped_buttons/custom_buttons/custom_radio_buttons_group.dart';

import 'package:toggle_switch/toggle_switch.dart';
import 'package:valentino/buisiness/auth_bloc/auth_bloc.dart';
import 'package:valentino/buisiness/basket_bloc/basket_bloc_bloc.dart';
import 'package:valentino/ui/auth_page/signin_or_signup_screen.dart';
import 'package:valentino/ui/constants.dart';

class DateTime2Page extends StatefulWidget {
  @override
  _DateTime2PageState createState() {
    return _DateTime2PageState();
  }
}

DateTime _dateTime = DateTime.now();

class _DateTime2PageState extends State<DateTime2Page> {
  int selectedIndex = -1; // Индекс выбранной кнопки
  int? selectedButton; // Хранит индекс выбранной кнопки
  bool isButtonEnabled = true; // Состояние кнопки

  // Цвета кнопок
  Color button1Color = kPrimaryColor;
  Color button2Color = Color.fromARGB(153, 140, 140, 140);

  void _onButtonPressed(int buttonIndex) {
    setState(() {
      selectedButton = buttonIndex; // Устанавливаем индекс выбранной кнопки

      // Меняем цвета кнопок в зависимости от нажатой
      if (buttonIndex == 1) {
        button1Color = kPrimaryColor; // Цвет для первой кнопки
        button2Color =
            const Color.fromARGB(255, 140, 140, 140); // Цвет для второй кнопки
      } else if (buttonIndex == 2) {
        button1Color =
            const Color.fromARGB(255, 140, 140, 140); // Цвет для первой кнопки
        button2Color = kPrimaryColor; // Цвет для второй кнопки
      }
    });
  }

  @override
  void initState() {
    super.initState();
    _checkTime(); // Проверяем время при инициализации
  }

  void _checkTime() {
    DateTime now = DateTime.now();
    // Проверяем, если текущее время больше 23:00 или меньше 12:00
    if (now.hour > 23 || now.hour < 12) {
      setState(() {
        isButtonEnabled = false; // Деактивируем кнопку
      });
    } else {
      setState(() {
        isButtonEnabled = true; // Активируем кнопку
      });
    }
  }

  void _selectButton(int index) {
    setState(() {
      selectedIndex = index; // Устанавливаем индекс выбранной кнопки
    });
  }

  int _selectedMins = 10;
  int _selectedHours = 1;
  DateTime _selectedValue = DateTime.now();
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    List<String> buttonList = [
      "12:00-12:30",
      "12:30-13:00",
      "13:00-13:30",
      "13:30-14:00",
      "14:00-14:30",
      "14:30-15:00",
      "15:00-15:30",
      "15:30-16:00",
      "16:00-17:30",
      "17:30-18:00",
      "18:00-18:30",
      "18:30-19:00",
      "19:00-19:30",
      "19:30-20:00",
      "20:00-20:30",
      "20:30-21:00",
      "21:00-21:30",
      "21:30-22:00",
      "22:00-22:30",
    ]; // Названия кнопок

    return Scaffold(
      appBar: AppBar(
          iconTheme: IconThemeData(color: Color.fromARGB(0, 253, 253, 253)),
          backgroundColor: kPrimaryColor,
          title: Text('Выбор времени доставки',
              style: TextStyle(
                  color: Color.fromARGB(202, 255, 255, 255), fontSize: 18))),
      body: Column(
        children: [
          Container(
            height: height * 0.7,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  height: height * 0.05,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      onPressed: isButtonEnabled
                          ? () {
                              _onButtonPressed(1);
                            }
                          : null,
                      child: Text(
                        'Ближайшее время',
                        style: TextStyle(color: Colors.white, fontSize: 12),
                      ),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: button1Color,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12), // <-- Radius
                        ),
                        elevation: 5,
                        minimumSize: Size(
                            height * 0.15, width * 0.12), // Цвет первой кнопки
                      ),
                    ),
                    SizedBox(width: 20),
                    ElevatedButton(
                      onPressed: () => _onButtonPressed(2),
                      child: Text(
                        'Выбрать время',
                        style: TextStyle(color: Colors.white, fontSize: 12),
                      ),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: button2Color,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12), // <-- Radius
                        ),
                        elevation: 5,
                        minimumSize: Size(
                            height * 0.15, width * 0.12), // Цвет первой кнопки
                        // Цвет второй кнопки
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20),
                // Отображаем виджет в зависимости от нажатой кнопки
                if (selectedButton == 1)
                  Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      SizedBox(height: height * 0.01),
                      Container(
                        color: Color.fromARGB(0, 120, 120, 120),
                        padding: EdgeInsets.all(10),
                        child: Text(
                          DateFormat('dd.MM.yyyy    HH:mm')
                              .format(DateTime.now().add(Duration(minutes: 30)))
                              .toString(),
                          style: TextStyle(
                            fontSize: height * 0.05,
                            fontFamily: 'Moniqa',
                          ),
                        ),
                      ),
                    ],
                  )
                else if (selectedButton == 2)
                  Column(
                    children: [
                      Container(
                        height: height * 0.1,
                        child: DatePicker(
                          DateTime.now(),
                          initialSelectedDate: DateTime.now(),
                          daysCount: 30,
                          dayTextStyle: TextStyle(
                              color: Color.fromARGB(255, 201, 201, 201),
                              fontSize: 12),
                          dateTextStyle: TextStyle(
                              color: Color.fromARGB(255, 201, 201, 201),
                              fontSize: 20),
                          monthTextStyle: TextStyle(
                              color: Color.fromARGB(255, 201, 201, 201),
                              fontSize: 10),
                          selectionColor: Color.fromARGB(255, 95, 95, 95),
                          selectedTextColor: Colors.white,
                          locale: "ru",
                          onDateChange: (day) {
                            // New date selected
                            setState(() {
                              _selectedValue = day;
                            });
                          },
                        ),
                      ),
                      SizedBox(height: height * 0.05),
                      //Выбор времени
                      Center(
                        child: CustomRadioButton(
                          buttonLables: buttonList,
                          buttonValues: buttonList,
                          radioButtonValue: (value, index) {
                            print("Button value " + value.toString());
                            print("Integer value " + index.toString());
                          },
                          horizontal: true,
                          enableShape: true,
                          buttonSpace: 5,
                          buttonColor: Colors.white,
                          selectedColor: kPrimaryColor,
                          buttonWidth: width * 0.3,
                        ),
                      ),
                      // Text(
                      //   selectedIndex == -1
                      //       ? "Не выбрано"
                      //       : "Выбрано: ${buttonLabels[selectedIndex]}",
                      //   style: TextStyle(fontSize: 20),
                      // ),
                      // ToggleButtons(
                      //   borderColor: const Color.fromARGB(255, 96, 96, 96),
                      //   isSelected: List.generate(buttonLabels.length,
                      //       (index) => index == selectedIndex),
                      //   onPressed: _selectButton,
                      //   children: buttonLabels
                      //       .map((label) => Padding(
                      //             padding: const EdgeInsets.all(16.0),
                      //             child: Text(label),
                      //           ))
                      //       .toList(),
                      // ),
                    ],
                  ),

                SizedBox(
                  height: height * 0.02,
                ),
              ],
            ),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12), // <-- Radius
              ),
              elevation: 5,
              minimumSize: Size(height * 0.33, width * 0.13),
              backgroundColor: kFourthColor,
            ),
            child: Text('Подтвердить',
                style: (TextStyle(
                    fontSize: 13, color: Color.fromARGB(235, 227, 227, 227)))),
            onPressed: () async {
              // date = DateTime.now().add(Duration(minutes: 20));
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }
}
