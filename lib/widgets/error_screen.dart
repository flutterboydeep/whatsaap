import 'package:flutter/material.dart';

class ErrorScreen extends StatelessWidget {
  final error;
  const ErrorScreen({
    super.key,
    required this.error,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text("$error"),
      ),
    );
  }
}
