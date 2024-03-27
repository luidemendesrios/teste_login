import 'package:flutter/material.dart';
import '../../data/auth/auth_service.dart';

class BotaoRegister extends StatefulWidget {
  const BotaoRegister({super.key});
  @override
  State<BotaoRegister> createState() => _BotaoRegisterState();
}

class _BotaoRegisterState extends State<BotaoRegister> {
   final TextEditingController emailController = TextEditingController();
   final TextEditingController passwordController = TextEditingController();
   final Auth _auth = Auth();

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(onPressed: (){
           final String? result = _auth.register(
              emailController.text, 
              passwordController.text
              );
              //exibir msg de erro
              if(result != null){
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text(result),
                  backgroundColor: Colors.red,
                ),
                );
              }
          }, 
          key: const Key('register_button_key'),
          style: ButtonStyle(
            shape: MaterialStatePropertyAll(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
            ),
            padding: const MaterialStatePropertyAll(
              EdgeInsets.symmetric(
                vertical: 26,
              ),
            )
          ),
          child: const Text('REGISTRAR'),
          );
  }
}