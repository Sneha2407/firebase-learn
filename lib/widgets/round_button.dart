import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import 'package:flutter/material.dart';

class RoundButton extends StatelessWidget {
  final String text;
  final VoidCallback onTap;
  final bool loading;
  const RoundButton({super.key, required this.text, required this.onTap,this.loading=false});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 50,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.amber.shade200),
        child: Center(
            child:loading? CircularProgressIndicator(strokeWidth: 3,color: Colors.black,) 
            :Text(
          text,
          style: TextStyle(
              color: Colors.brown.shade700,
              fontSize: 20,
              fontWeight: FontWeight.bold),
        )),
      ),
    );
  }
}
