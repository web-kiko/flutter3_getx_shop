import 'package:flutter/material.dart';

import '../units/screenAdapter.dart';

class UserAgreement extends StatelessWidget {
  const UserAgreement({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
            margin: EdgeInsets.only(top: ScreenAdapter.height(80)),
            child: Wrap(
              crossAxisAlignment:WrapCrossAlignment.center,
              children: [
                Checkbox(
                    activeColor: Colors.red, value: true, onChanged: (v) {}),
                const Text(
                  "意阅读并同意"),
                const Text(
                  "《商城用户协议》",
                  style: TextStyle(color: Colors.red),
                ),
                  const Text(
                  "《商城用户协议》",
                  style: TextStyle(color: Colors.red),
                ),
                const Text("《商城隐私协议》", style: TextStyle(color: Colors.red)),
              ],
            ),
          );
  }
}