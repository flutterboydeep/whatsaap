import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:whatsaap/features/auth/controller/auth_controller.dart';
import 'package:whatsaap/features/landing/screens/landing_screen.dart';

import 'package:whatsaap/firebase_options.dart';
import 'package:whatsaap/helper/helperClasses/loader.dart';
import 'package:whatsaap/layoutScreens/mobile_screen_layout.dart';
import 'package:whatsaap/router.dart';
import 'package:whatsaap/widgets/commonWidget/colors.dart';

import 'package:whatsaap/widgets/error_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(ProviderScope(child: const MyApp()));
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
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
        appBarTheme: AppBarTheme(backgroundColor: appBarColor),
        scaffoldBackgroundColor: backgroundColor,
        iconButtonTheme: IconButtonThemeData(
            style:
                ButtonStyle(iconColor: MaterialStateProperty.all(Colors.grey))),
      ),
      onGenerateRoute: (settings) => generateRoute(settings),
      home: ref.watch(userDataAuthProvider).when(data: (user) {
        if (user == null) {
          // return const MobileScreenLayout();
          return const LandingScreen();
        } else {
          // return const MobileScreenLayout();
          return const MobileScreenLayout();
        }
      }, error: (err, trace) {
        return ErrorScreen(
          error: err.toString(),
        );
      }, loading: () {
        return Loader();
      }),
      // home: UserInformationScreen(),
      // home: LandingScreen(),
      // home: const ResponsiveLayout(),
    );
  }
}
