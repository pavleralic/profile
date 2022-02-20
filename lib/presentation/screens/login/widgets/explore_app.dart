import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ExploreAppButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 48.0,
      child: OutlinedButton(
        onPressed: null,
        style: OutlinedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.0),
          ),
          side: BorderSide(width: 1, color: Color(0xFFC9CDD4)),
        ),
        child: Text(tr('login.explore_the_app'),
            style: TextStyle(fontSize: 16.0, color: Color(0xFF798393))),
      ),
    );
  }
}
