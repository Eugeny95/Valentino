import 'package:auth_feature/data/auth_data.dart';
import 'package:date_picker_timeline/date_picker_timeline.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

import 'package:toggle_switch/toggle_switch.dart';
import 'package:valentino/buisiness/auth_bloc/auth_bloc.dart';
import 'package:valentino/buisiness/basket_bloc/basket_bloc_bloc.dart';
import 'package:valentino/ui/auth_page/signin_or_signup_screen.dart';
import 'package:valentino/ui/constants.dart';

class DateTimePage extends StatefulWidget {
  @override
  _DateTimePageState createState() {
    return _DateTimePageState();
  }
}

class _DateTimePageState extends State<DateTimePage> {
  int toggleIndex = 0;
  int selectedIndex = -1; // Индекс выбранной кнопки

  void _selectButton(int index) {
    setState(() {
      selectedIndex = index; // Устанавливаем индекс выбранной кнопки
    });
  }

  DateTime _selectedValue = DateTime.now();
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    List<String> buttonLabels = [
      '12:00',
      '12:30',
      '13:00',
      '13:30',
      '... до 22:30',
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
                ToggleSwitch(
                  minWidth: 250,
                  cornerRadius: 10,
                  activeBgColor: [kPrimaryColor],
                  inactiveBgColor: Color.fromARGB(0, 91, 91, 91),
                  inactiveFgColor: Colors.white,
                  initialLabelIndex: toggleIndex,
                  totalSwitches: 2,
                  labels: ['Ближайшее время', 'Выбрать время'],
                  radiusStyle: true,
                  onToggle: (index) {
                    if (index == 0) if (index == 1) {
                      return;
                    }

                    setState(() {
                      toggleIndex = index!;
                    });
                  },
                ),
                SizedBox(
                  height: height * 0.02,
                ),
                Align(
                    alignment: Alignment.center, //or choose another Alignment
                    child: Container(
                      color: Colors.transparent,
                      // height: height * 0.01,
                      child: (toggleIndex == 1)
                          ? Column(
                              children: [
                                Container(
                                  height: height * 0.1,
                                  child: DatePicker(
                                    DateTime.now(),
                                    initialSelectedDate: DateTime.now(),
                                    daysCount: 30,
                                    dayTextStyle: TextStyle(
                                        color:
                                            Color.fromARGB(255, 201, 201, 201),
                                        fontSize: 12),
                                    dateTextStyle: TextStyle(
                                        color:
                                            Color.fromARGB(255, 201, 201, 201),
                                        fontSize: 20),
                                    monthTextStyle: TextStyle(
                                        color:
                                            Color.fromARGB(255, 201, 201, 201),
                                        fontSize: 10),
                                    selectionColor:
                                        Color.fromARGB(255, 95, 95, 95),
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
                                SizedBox(height: height * 0.1),
                                Text(
                                  selectedIndex == -1
                                      ? "Не выбрано"
                                      : "Выбрано: ${buttonLabels[selectedIndex]}",
                                  style: TextStyle(fontSize: 20),
                                ),
                                ToggleButtons(
                                  borderColor:
                                      const Color.fromARGB(255, 96, 96, 96),
                                  isSelected: List.generate(buttonLabels.length,
                                      (index) => index == selectedIndex),
                                  onPressed: _selectButton,
                                  children: buttonLabels
                                      .map((label) => Padding(
                                            padding: const EdgeInsets.all(16.0),
                                            child: Text(label),
                                          ))
                                      .toList(),
                                ),
                              ],
                            )
                          : Column(
                              mainAxisAlignment: MainAxisAlignment.end,
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                SizedBox(height: height * 0.01),
                                Container(
                                  color: Color.fromARGB(0, 120, 120, 120),
                                  padding: EdgeInsets.all(10),
                                  child: Text(
                                    DateFormat('dd.MM.yyyy    HH:mm')
                                        .format(DateTime.now()
                                            .add(Duration(minutes: 30)))
                                        .toString(),
                                    style: TextStyle(
                                      fontSize: height * 0.05,
                                      fontFamily: 'Moniqa',
                                    ),
                                  ),
                                ),
                              ],
                            ),
                    )),
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
