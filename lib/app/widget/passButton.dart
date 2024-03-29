import 'package:flutter/material.dart';

import '../units/screenAdapter.dart';


class PassButton extends StatelessWidget {
  final String text;
  final void Function()? onPressed;
  const PassButton({super.key, required this.text, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: ScreenAdapter.height(80)),
      height: ScreenAdapter.height(140),
      child: ElevatedButton(
        style: ButtonStyle(
            backgroundColor:
                MaterialStateProperty.all(const Color.fromRGBO(240, 115, 49, 1)),
            foregroundColor: MaterialStateProperty.all(Colors.white),
            shape: MaterialStateProperty.all(RoundedRectangleBorder(
                borderRadius:
                    BorderRadius.circular(ScreenAdapter.height(70))))),
        onPressed: onPressed,
        child: Text(
          text,
          style: TextStyle(fontSize: ScreenAdapter.fontSize(46)),
        ),
      ),
    );
  }
}
