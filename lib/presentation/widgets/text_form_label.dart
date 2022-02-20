import 'package:athlon_task/shared/constants/dimens.dart';
import 'package:flutter/cupertino.dart';

class TextFormLabel extends StatelessWidget {
  final String text;

  TextFormLabel(this.text);

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(bottom: Dimens.tiny),
        child: Text(text));
  }
}
