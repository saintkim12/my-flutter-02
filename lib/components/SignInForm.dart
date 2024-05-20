// import 'dart:io';
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:my_flutter_02/pages/signed.dart';

///
/// @NOTE
/// 상태가 포함된 form + state
/// ref: https://docs.flutter.dev/cookbook/forms/validation
///

class SignInForm extends StatefulWidget {
  const SignInForm({super.key});

  @override
  SignInFormState createState() {
    return SignInFormState();
  }
}

class SignInFormState extends State<SignInForm> {
  // form의 고유한 키
  final _formKey = GlobalKey<FormState>();
  final fieldId = TextEditingController();
  final fieldPassword = TextEditingController();

  // final httpClient = HttpClient();

  Future<void> onSignIn() async {
    if (!_formKey.currentState!.validate()) {
      return;
    }
    ScaffoldMessenger.of(context)
        .showSnackBar(const SnackBar(content: Text('Sign in...')));
    Timer(Duration(seconds: 3), () {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text('Sign In: ${fieldId.text}')));
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => const SignedPage()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextFormField(
              controller: fieldId,
              decoration: const InputDecoration(labelText: "ID"),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter some text';
                }
                return null;
              }),
          TextFormField(
              controller: fieldPassword,
              obscureText: true,
              decoration: const InputDecoration(labelText: "Password"),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter some text';
                }
                return null;
              }),
          Padding(
              padding: const EdgeInsets.symmetric(
                  // padding top+bottom or left+right
                  vertical: 16),
              child: ElevatedButton(
                  onPressed: onSignIn, child: const Text("Submit")))
        ],
      ),
    );
  }
}
