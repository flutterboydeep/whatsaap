import 'package:flutter/material.dart';
import 'package:whatsaap/widgets/commonWidget/colors.dart';
import 'package:whatsaap/responsive/responsiveLayout.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Whatsaap',
      theme: ThemeData.dark(
        useMaterial3: true,
      ).copyWith(
        // textTheme: TextTheme(s),
        // primaryColor: Color.fromRGBO(5, 188, 148, 1),
        // colorScheme: ColorScheme.fromSeed(
        // seedColor: const Color.fromARGB(255, 4, 48, 6),
        // secondary: Color.fromRGBO(3, 32, 26, 1)),
        // seedColor: Color.fromRGBO(2, 77, 61, 1),

        scaffoldBackgroundColor: backgroundColor,
        iconButtonTheme: IconButtonThemeData(
            style:
                ButtonStyle(iconColor: MaterialStateProperty.all(Colors.grey))),
      ),
      home: const ResponsiveLayout(),
    );
  }
}
