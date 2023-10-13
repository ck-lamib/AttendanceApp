import 'package:attendance_bloc/common/utils/common_constants.dart';
import 'package:attendance_bloc/common/views/splash_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const AttendanceApp());
}

class AttendanceApp extends StatelessWidget {
  const AttendanceApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(
              // scaffoldBackgroundColor: Colors.black,

              useMaterial3: true)
          .copyWith(
              textTheme: const TextTheme(
                headlineLarge:
                    TextStyle(fontSize: 28, fontWeight: FontWeight.bold, color: AppColor.lightPink),
                headlineSmall:
                    TextStyle(fontSize: 24, fontWeight: FontWeight.w600, color: AppColor.lightPink),
                titleLarge:
                    TextStyle(fontSize: 23, fontWeight: FontWeight.w600, color: AppColor.lightPink),
                titleMedium:
                    TextStyle(fontSize: 20, fontWeight: FontWeight.w500, color: AppColor.lightPink),
                titleSmall:
                    TextStyle(fontSize: 18, fontWeight: FontWeight.w500, color: AppColor.lightPink),
                bodyLarge: TextStyle(
                    fontSize: 18, fontWeight: FontWeight.normal, color: AppColor.lightPink),
                bodyMedium: TextStyle(
                    fontSize: 16, fontWeight: FontWeight.normal, color: AppColor.lightPink),
                bodySmall: TextStyle(
                    fontSize: 14, fontWeight: FontWeight.normal, color: AppColor.lightPink),
              ),
              // appBarTheme: const AppBarTheme(
              //   backgroundColor: Colors.transparent,
              //   centerTitle: true,
              //   titleTextStyle:
              //       TextStyle(fontSize: 28, fontWeight: FontWeight.bold, color: AppColor.lightPink),
              // ),
              bottomNavigationBarTheme: BottomNavigationBarThemeData(
                backgroundColor: const Color(0xffFBE9FF),
                selectedItemColor: AppColor.dark,
                unselectedItemColor: AppColor.dark.withOpacity(0.8),
              )),
      debugShowCheckedModeBanner: false,
      home: const SplashPage(),
      onGenerateRoute: generateRoute,
    );
  }
}
