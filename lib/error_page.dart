import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ErrorPage extends StatelessWidget {
  const ErrorPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: GestureDetector(
          onTap: () {
            Router.neglect(context, () {
              context.goNamed("Homepage");
            }); //Instead of push replacement
          },
          child: Text(
            "Go to Homepage",
            style: TextStyle(color: Colors.blue.shade900),
          ),
        ),
      ),
    );
  }
}
