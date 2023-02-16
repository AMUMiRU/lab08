import 'package:auth_buttons/auth_buttons.dart';
import 'package:flutter/material.dart';
import 'package:lab08/services/auth_service.dart';

class mainpage extends StatefulWidget {
  const mainpage({super.key});

  @override
  State<mainpage> createState() => _mainpageState();
}

class _mainpageState extends State<mainpage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("login"),
      ),
      body: SafeArea(
        child: GoogleAuthButton(
          onPressed: (){
            GoogleAuthService().signinWithGoogle().then((value) {
              //print(value.user!.uid);
            });
          },
        ),
      ),
    );
  }
}