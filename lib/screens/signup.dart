import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:slash_screen/screens/student_screen.dart';
import 'package:slash_screen/screens/teacher_screen.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final emailController = TextEditingController();
  final passController = TextEditingController();
  final ageController = TextEditingController();
  final typeController = TextEditingController();
  String selectedRole = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('SignUp'),
        centerTitle: true,
        automaticallyImplyLeading: false,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextField(
              controller: emailController,
              decoration: InputDecoration(hintText: 'Email'),
            ),
            SizedBox(
              height: 20,
            ),
            TextField(
              controller: passController,
              decoration: InputDecoration(hintText: 'Password'),
            ),
            SizedBox(
              height: 20,
            ),
            TextField(
              controller: ageController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                hintText: 'age',
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Please Select Your Profession',
                      style: TextStyle(fontSize: 16),
                      textAlign: TextAlign.left,
                    ),
                  ),
                  RadioListTile(
                    title: Text('Student'),
                    value: 'Student',
                    groupValue: selectedRole,
                    onChanged: (value) {
                      setState(() {
                        selectedRole = value!;
                      });
                    },
                  ),
                  RadioListTile(
                    title: Text('Teacher'),
                    value: 'Teacher',
                    groupValue: selectedRole,
                    onChanged: (value) {
                      setState(() {
                        selectedRole = value!;
                      });
                    },
                  ),
                  RadioListTile(
                    title: Text('Admin'),
                    value: 'Admin',
                    groupValue: selectedRole,
                    onChanged: (value) {
                      setState(() {
                        selectedRole = value!;
                      });
                    },
                  ),
                ],
              ),
            ),
            InkWell(
                onTap: () async {
                  SharedPreferences sp = await SharedPreferences.getInstance();
                  sp.setString('email', emailController.text.toString());
                  sp.setString('password', emailController.text.toString());
                  sp.setString('age', emailController.text.toString());
                  sp.setString('type', selectedRole);

                  sp.setBool('isLogin', true);

                  if (sp.getString('type') == 'Student') {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => StudentScreen()));
                  } else if (sp.getString('type') == 'Teacher') {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => TeacherScreen()));
                  } else {
                    return null;
                  }
                },
                child: Container(
                  height: 50,
                  width: double.infinity,
                  color: Colors.blue,
                  child: Center(
                    child: Text('Sign Up'),
                  ),
                )),
          ],
        ),
      ),
    );
  }
}
