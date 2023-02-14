import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import 'package:flutter/material.dart';

class GoogleButton extends StatelessWidget {
 
  final VoidCallback onTap;
  final bool gloading;
  const GoogleButton({super.key,  required this.onTap,this.gloading=false});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 50,
        width: double.infinity,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.white,
            border: Border.all()),
            
        // child: loading? CircularProgressIndicator(strokeWidth: 3,color: Colors.black,) 
        // :Text(
        //   text,
        //   style: TextStyle(
        //   color: Colors.brown.shade700,
        //   fontSize: 20,
        //   fontWeight: FontWeight.bold),
        // ),
        child: gloading? CircularProgressIndicator(strokeWidth: 3,color: Colors.green,) 
            :Image.asset("assets/images/google-logo.jpg"),
      ),
    );
  }
}
