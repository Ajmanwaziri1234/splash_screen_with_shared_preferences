import 'dart:async';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:slash_screen/screens/signup.dart';
import 'package:slash_screen/screens/student_screen.dart';
import 'package:slash_screen/screens/teacher_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    isLogin();
  }

  void isLogin() async{
    SharedPreferences sp = await SharedPreferences.getInstance();
    bool isLogin = sp.getBool('isLogin') ?? false;
    String userType = sp.getString('type') ?? '';

    if(isLogin){

      if(userType == 'Student'){
        Timer(Duration(seconds: 3), () {
          Navigator.push(context, MaterialPageRoute(builder: (context)=> StudentScreen()));
        });
      }else if(userType == 'Teacher'){
        Timer(Duration(seconds: 3), () {
          Navigator.push(context, MaterialPageRoute(builder: (context)=> TeacherScreen()));
        });
      }else{
        Timer(Duration(seconds: 3), () {
          Navigator.push(context, MaterialPageRoute(builder: (context)=> TeacherScreen()));
        });
      }

    }else{
      Timer(Duration(seconds: 3), () {
        Navigator.push(context, MaterialPageRoute(builder: (context)=> SignUpScreen()));
      });
    }

  }
  @override
  Widget build(BuildContext context) {
    return const Center(child: CircleAvatar(backgroundImage: NetworkImage('https://images.pexels.com/photos/9843280/pexels-photo-9843280.jpeg?auto=compress&cs=tinysrgb&w=800',),
      radius: 50,



    ),
    );
  }
}
