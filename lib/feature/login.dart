import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:movie_ui/core/route/app_route_name.dart';
import 'package:movie_ui/core/theme/app_color.dart';
import 'package:movie_ui/feature/register_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  void _login() async {
    try {
      UserCredential userCredential =
          await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: _emailController.text,
        password: _passwordController.text,
      );
      if (userCredential.user != null) {
        // เก็บข้อมูลผู้ใช้ใน Firestore
        await FirebaseFirestore.instance
            .collection('users')
            .doc(userCredential.user!.uid)
            .set({
          'email': _emailController.text,
          // เพิ่มข้อมูลอื่น ๆ ของผู้ใช้ตามต้องการ
        });

        Navigator.pushReplacementNamed(context, AppRouteName.home);
      }
    } catch (e) {
      // จัดการข้อผิดพลาด
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text(
              'Login failed',
              style: TextStyle(color: Color.fromARGB(255, 212, 70, 70)),
            ),
            content: const Text(
              'No account found with this email',
              style: TextStyle(color: Colors.black),
            ),
            backgroundColor: Colors.white.withOpacity(0.95),
            actions: <Widget>[
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop(); // ปิด AlertDialog
                },
                child: const Text('OK',
                    style: TextStyle(color: const Color(0xFFba903a), fontSize: 18)),
              ),
            ],
          );
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
      ),
      body: Container(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 100,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/pop.jpg'),
                  fit: BoxFit.contain,
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            const Text(
              "Let's get you started!",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.w700,
                color: Color(0xFFeabc5a),
              ),
            ),
            TextFormField(
              controller: _emailController,
              decoration: const InputDecoration(
                labelText: 'Username',
              ),
            ),
            const SizedBox(height: 20),
            TextFormField(
              controller: _passwordController,
              obscureText: true,
              decoration: const InputDecoration(
                labelText: 'Password',
              ),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const RegisterScreen(),
                      ),
                    );
                  },
                  child: const Text(
                    'Register now',
                    style: TextStyle(color: Color(0xFFE8B448)),
                  ),
                ),
                InkWell(
                  onTap: _login,
                  child: Container(
                    decoration: BoxDecoration(
                      color: AppColor.primaryColor,
                      borderRadius: BorderRadius.circular(16),
                    ),
                    padding: const EdgeInsets.symmetric(
                      vertical: 10,
                      horizontal: 20,
                    ),
                    child: Text(
                      "Login",
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
