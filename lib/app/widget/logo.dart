import 'package:flutter/material.dart';

import '../units/screenAdapter.dart';

class Logo extends StatelessWidget {
  const Logo({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      margin: EdgeInsets.all(ScreenAdapter.width(80)),
      child: SizedBox(
        width: ScreenAdapter.width(220),
        height: ScreenAdapter.width(220),
        child: Image.asset("assets/images/logo.png", fit: BoxFit.cover),
      ),
    );
  }
}
