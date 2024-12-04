import 'package:flutter/material.dart';

//Light mode & Dark mode
import 'package:climbon/theme/light_mode.dart';
import 'package:climbon/theme/dark_mode.dart';

class SigninButton extends StatelessWidget{
  final String text;
  final void Function()? onTap;
  final Color color;

  const SigninButton({
    super.key,
    required this.text,
    required this.onTap,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(8),
        ),
        padding: EdgeInsets.all(14),
        child: Center(
          child: Text(
            text,
            style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 18,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}