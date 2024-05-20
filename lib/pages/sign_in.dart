import 'package:flutter/material.dart';
import 'package:my_flutter_02/components/SignInForm.dart';

class SignInPage extends StatelessWidget {
  const SignInPage({super.key});

  @override
  Widget build(BuildContext context) {
    const form = SignInForm();
    
    return const Scaffold(
      body: form,
    );
  }
}
