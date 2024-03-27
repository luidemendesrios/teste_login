import 'package:flutter/material.dart';

class CampoEmail extends StatefulWidget {
  const CampoEmail({super.key});

  @override
  State<CampoEmail> createState() => _CampoEmailState();
}

class _CampoEmailState extends State<CampoEmail> {
  final TextEditingController emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return TextField(
              key: const Key('email_key'), //chave para ser usada nos teste de widgets
              controller: emailController,
              keyboardType: TextInputType.emailAddress,
              decoration:  const InputDecoration(
                hintText: 'E-mail',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(16)
                  )
                )
              ),
            );
  }
}