import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:slash_screen/screens/signup.dart';

class StudentScreen extends StatefulWidget {
  const StudentScreen({super.key});

  @override
  State<StudentScreen> createState() => _StudentScreenState();
}

class _StudentScreenState extends State<StudentScreen> {

  String email = '';
  String age = '';
  String role = '';
  
  
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadDate();
  }

  void loadDate()async{
    SharedPreferences sp = await SharedPreferences.getInstance();
    email = sp.getString('email') ?? '';
    age = sp.getString('age') ?? '';
    role = sp.getString('type') ?? '';
    setState(() {

    });

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Student Screen'),
        centerTitle: true,
        automaticallyImplyLeading: false,
      ),

      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(child: Text('Student Screen')),
          Row(
            children: [
              Text('Email'),
              Text(email),
            ],

          ),
          Row(
            children: [
              Text('Age'),
              Text(age),
            ],

          ),
          Row(
            children: [
              Text('Profession'),
              Text(role),
            ],

          ),
          InkWell(
            onTap: ()async{
              SharedPreferences sp = await SharedPreferences.getInstance();
              sp.clear();
              Navigator.push(context, MaterialPageRoute(builder: (contet) => SignUpScreen()));
            },
            child: Container(
              height: 50,
              width: double.infinity,
              color: Colors.blue,
              child: Center(child: Text('Logout'),),
            ),
          )
        ],
      ),
    );
  }
}
