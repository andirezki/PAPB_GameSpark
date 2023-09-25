import 'package:flutter/material.dart';
import 'package:http/http.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

TextEditingController emailController = TextEditingController();
TextEditingController passwordController = TextEditingController();

void login(String email, password) async {
  try {
    Response response =
        await post(Uri.parse('https://reqres.in/api/register'), body: {
      'email': email,
      'password': password,
    });
    if (response.statusCode == 200) {
      print('account created');
    } else {
      print('failed to create account');
    }
  } catch (e) {
    print('e. toString()');
  }
}

class _SignUpState extends State<SignUp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.all(32),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextField(
            controller: emailController,
            decoration: InputDecoration(
              labelText: 'Username',
            ),
          ),
          TextField(
            controller: passwordController,
            decoration: InputDecoration(
              labelText: 'Password',
            ),
            obscureText: true,
          ),
          const SizedBox(
            height: 20,
          ),
          GestureDetector(
            onTap: () {
              login(emailController.text.toString(),
                  passwordController.text.toString());
            },
            child: Container(
              height: 60,
              width: 300,
              decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.circular(30),
              ),
              child: const Center(
                child: Text(
                  "sign up",
                  style: TextStyle(color: Colors.white, fontSize: 18),
                ),
              ),
            ),
          ),
        ],
      ),
    ));
  }
}
