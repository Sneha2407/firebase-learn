import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import 'package:flutter/material.dart';
import 'package:flutter_firebase_app/ui/auth/signup_screen.dart';
import 'package:flutter_firebase_app/widgets/round_button.dart';

class Loginscreen extends StatefulWidget {
  const Loginscreen({super.key});

  @override
  State<Loginscreen> createState() => _LoginscreenState();
}

class _LoginscreenState extends State<Loginscreen> {
  final _formKey = GlobalKey<FormState>();
  final emailConroller = TextEditingController();
  final passWordController = TextEditingController();

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    emailConroller.dispose();
    passWordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: (() async {
        SystemNavigator.pop();
        return true;
      }),
      child: Scaffold(
        appBar: AppBar(title: Text("Login"), automaticallyImplyLeading: false),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      TextFormField(
                        controller: emailConroller,
                        keyboardType: TextInputType.emailAddress,
                        decoration: const InputDecoration(
                            label: Text("Email"),
                            hintText: "abc@gmail.com",
                            prefixIcon: Icon(Icons.alternate_email)),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Enter Email";
                          }
                          return null;
                        },
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      TextFormField(
                        controller: passWordController,
                        // obscuringCharacter: "*",
                        obscureText: true,
                        decoration: const InputDecoration(
                            label: Text("Password"),
                            hintText: "Password",
                            prefixIcon: Icon(Icons.lock)),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Enter Password";
                          }
                          return null;
                        },
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                RoundButton(
                  text: "Login",
                  onTap: (() {
                    if (_formKey.currentState!.validate()) {}
                  }),
                ),
                Row(
                  children: [
                    Text("Dont have an account?"),
                    TextButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const SignupScreen()));
                      },
                      child: Text(
                        "Sign up",
                        style: TextStyle(color: Colors.amber.shade700),
                      ),
                    )
                  ],
                )
              ]),
        ),
      ),
    );
  }
}
