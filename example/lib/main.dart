import 'package:custom_date_picker_package/custom_date_picker_package.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff121212),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 30,
                    vertical: 20,
                  ),
                  child: CustomDatePicker(
                    icon: Icons.date_range_rounded,
                    calendarTitle: 'Selecciona la fecha',
                    title: 'Fecha inicial',
                    value: 'Pruebas del widget de fecha',
                    iconsColor: Colors.blue,
                    locale: 'es',
                    onNewDate: (date) {
                      date = date;
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
