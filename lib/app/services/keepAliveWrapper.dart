/*
 * @Author: web-kiko kikoiiii@163.com
 * @Date: 2024-03-04 11:57:43
 * @LastEditors: web-kiko kikoiiii@163.com
 * @LastEditTime: 2024-03-06 17:06:16
 * @FilePath: \flutter3_getx_shop\lib\app\services\keepAliveWrapper.dart
 * @Description: 这是默认设置,请设置`customMade`, 打开koroFileHeader查看配置 进行设置: https://github.com/OBKoro1/koro1FileHeader/wiki/%E9%85%8D%E7%BD%A
 */

import 'package:flutter/material.dart';

class KeepAliveWrapper extends StatefulWidget {
  const KeepAliveWrapper(
      {Key? key, @required this.child, this.keepAlive = true})
      : super(key: key);

  final Widget? child;
  final bool keepAlive;

  @override
  State<KeepAliveWrapper> createState() => _KeepAliveWrapperState();
}

class _KeepAliveWrapperState extends State<KeepAliveWrapper>
    with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    return widget.child!;
  }

  @override
  bool get wantKeepAlive => widget.keepAlive;  
}
