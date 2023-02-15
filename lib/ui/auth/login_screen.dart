import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import 'package:flutter/material.dart';
import 'package:flutter_firebase_app/ui/auth/auth_service.dart';
import 'package:flutter_firebase_app/ui/auth/signup_screen.dart';
import 'package:flutter_firebase_app/utils/snack.dart';
import 'package:flutter_firebase_app/widgets/google_button.dart';
import 'package:flutter_firebase_app/widgets/round_button.dart';

import '../welcome.dart';

class Loginscreen extends StatefulWidget {
  const Loginscreen({super.key});

  @override
  State<Loginscreen> createState() => _LoginscreenState();
}

class _LoginscreenState extends State<Loginscreen> {
  final _formKey = GlobalKey<FormState>();
  final emailConroller = TextEditingController();
  final passWordController = TextEditingController();
  FirebaseAuth _auth = FirebaseAuth.instance;
  bool loading = false;
  bool gloading = false;

  void login() {
    _auth
        .signInWithEmailAndPassword(
            email: emailConroller.text.toString(),
            password: passWordController.text.toString())
        .then((value) {
      setState(() {
        loading = false;
      });
      successSnackBar(context, "Log in Successful");
      Navigator.push(context,
          MaterialPageRoute(builder: (context) => const WelcomeScreen()));
    }).onError((error, stackTrace) {
      errorSnackBar(context, error.toString());
    });
  }

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
          child: SingleChildScrollView(
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
                    loading: loading,
                    onTap: (() {
                      if (_formKey.currentState!.validate()) {
                        login();
                      }
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
                  ),
                  GoogleButton(onTap: (() {
                    setState(() {
                      gloading = true;
                    });
                    AuthService().signInWithGoogle().then((value) {
                      setState(() {
                        gloading = false;
                      });
                      successSnackBar(context, "Google Sign in Succesful");
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const WelcomeScreen()));
                    });
                  }))
                ]),
          ),
        ),
      ),
    );
  }
}
