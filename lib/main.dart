import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:whatsaap/features/auth/auth_screens/dummyMap.dart';
import 'package:whatsaap/features/auth/auth_screens/otp_screen.dart';
import 'package:whatsaap/features/auth/auth_screens/user_information_screen.dart';
import 'package:whatsaap/features/landing/screens/landing_screen.dart';
import 'package:whatsaap/firebase_options.dart';
import 'package:whatsaap/router.dart';
import 'package:whatsaap/widgets/commonWidget/colors.dart';
import 'package:whatsaap/responsive/responsiveLayout.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ProviderScope(
      child: MaterialApp(
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
          appBarTheme: AppBarTheme(backgroundColor: appBarColor),
          scaffoldBackgroundColor: backgroundColor,
          iconButtonTheme: IconButtonThemeData(
              style: ButtonStyle(
                  iconColor: MaterialStateProperty.all(Colors.grey))),
        ),
        onGenerateRoute: (settings) => generateRoute(settings),
        home: UserInformationScreen(),
        // home: LandingScreen(),
        // home: const ResponsiveLayout(),
      ),
    );
  }
}
