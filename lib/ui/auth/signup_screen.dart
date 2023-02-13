import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';


import '../../widgets/round_button.dart';
import 'login_screen.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final _formKey = GlobalKey<FormState>();
  final emailConroller = TextEditingController();
  final passWordController = TextEditingController();
  FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    emailConroller.dispose();
    passWordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Sign Up"), automaticallyImplyLeading: false),
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
                text: "Sign Up",
                onTap: (() {
                  if (_formKey.currentState!.validate()) {
                    _auth.createUserWithEmailAndPassword(
                        email: emailConroller.text.toString(),
                        password: passWordController.text.toString());
                    //     .then((value) {})
                    //     .onError((error, stackTrace) {
                    //   Utils().toastMessage(error.toString());
                    // });
                  }
                }),
              ),
              Row(
                children: [
                  Text("Already have an account?"),
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const Loginscreen()));
                    },
                    child: Text(
                      "Login",
                      style: TextStyle(color: Colors.amber.shade700),
                    ),
                  )
                ],
              )
            ]),
      ),
    );
  }
}
