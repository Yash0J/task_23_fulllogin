import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:task_23_fulllogin/sreens/auth/login_page.dart';

import 'utils/constants/colors.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences prefs = await SharedPreferences.getInstance();
  var email = prefs.getString("eve.holt@reqres.in");
  var password = prefs.getString("cityslicka");
  print(email);
  print(password);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        brightness: Brightness.dark,
        primaryColor: AppColors.primaryColor,
        colorScheme: ColorScheme.dark(
          primary: AppColors.primaryColor,
          background: AppColors.darkBlue,
          secondary: AppColors.purple,
        ),
        useMaterial3: true,
      ),
      home: const Login(),
    );
  }
}
