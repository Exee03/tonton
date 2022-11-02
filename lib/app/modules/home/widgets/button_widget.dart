import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ButtonWidget extends StatelessWidget {
  const ButtonWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (Platform.isAndroid) {
      return ElevatedButton(
        onPressed: () {},
        child: Text('Android'),
      );
    }
    return CupertinoButton.filled(
      child: Text("iOS"),
      onPressed: () {},
    );
  }
}
