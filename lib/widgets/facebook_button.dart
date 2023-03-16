import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import 'package:flutter/material.dart';

class FacebookButton extends StatelessWidget {
  final VoidCallback onTap;
  final bool floading;
  const FacebookButton({super.key, required this.onTap, this.floading = false});

  
  // const GoogleButton({super.key,  required this.onTap,this.gloading=false});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 50,
        width: double.infinity,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Color.fromARGB(255, 40, 86, 155),
            border: Border.all()),
            
        // child: loading? CircularProgressIndicator(strokeWidth: 3,color: Colors.black,) 
        // :Text(
        //   text,
        //   style: TextStyle(
        //   color: Colors.brown.shade700,
        //   fontSize: 20,
        //   fontWeight: FontWeight.bold),
        // ),
        child: floading? CircularProgressIndicator(strokeWidth: 3,color: Colors.white,) 
            :Image.asset("assets/images/fb_logo.png"),
      ),
    );
  }
}