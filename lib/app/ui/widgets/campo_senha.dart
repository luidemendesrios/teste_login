import 'package:flutter/material.dart';

class CampoSenha extends StatefulWidget {
  const CampoSenha({super.key});

  @override
  State<CampoSenha> createState() => _CampoSenhaState();
}

class _CampoSenhaState extends State<CampoSenha> {
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return TextField(
              key: const Key('password_key'), //chave para ser usada nos teste de widgets
              controller: passwordController,
              obscureText: true,
              decoration:  const InputDecoration(
                hintText: 'Senha',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(16)
                  )
                )
              ),
            );
  }
}