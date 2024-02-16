import 'dart:convert';
import 'dart:js';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:task_23_fulllogin/sreens/home/home_page.dart';

class LoginModel {
  String email;
  String password;

  LoginModel({
    required this.email,
    required this.password,
  });

  Map<String, dynamic> toJson() {
    return {
      'email': email,
      'password': password,
    };
  }

  void login(LoginModel loginModel) async {
    try {
      http.Response response = await http.post(
        Uri.parse('https://reqres.in/api/login'),
        body: loginModel.toJson(),
      );

      String body = response.body;

      if (response.statusCode == 200) {
        var data = jsonDecode(body);
        print("token for login is: ${data['token']}");
        print('login successfully');
        Navigator.pushReplacement(context as BuildContext,
            MaterialPageRoute(builder: (context) => const HomePage()));
      } else {
        print('Login failed, status_code => ${response.statusCode}');
      }
    } catch (error) {
      print(error.toString());
    }
  }
}
