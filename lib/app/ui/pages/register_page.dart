import 'package:flutter/material.dart';
import 'package:teste_login/app/ui/widgets/campo_email.dart';
import 'package:teste_login/app/ui/widgets/campo_senha.dart';
import '../widgets/botao_register.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});
  @override
  State<RegisterPage> createState() => _RegisterPageState();
}
class _RegisterPageState extends State<RegisterPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Page Login'),
      ),
      body:  const SingleChildScrollView(
        padding:  EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch, //para arrumar o botão
          children: [
             CampoEmail(),
             SizedBox(height: 16),
             CampoSenha(),
             SizedBox(height: 32),
             BotaoRegister(),
          ],
        ),
      ),
    );
  }
}