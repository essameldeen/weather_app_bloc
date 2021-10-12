import 'package:flutter/material.dart';

class ErrorWidget extends StatelessWidget {
  final String message;

  ErrorWidget(this.message);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Text(
          message,
          style: TextStyle(
            fontSize: 20.0,
            color: Colors.red,
          ),
        ),
      ),
    );
  }
}
