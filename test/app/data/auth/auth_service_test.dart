import 'package:flutter_test/flutter_test.dart';
import 'package:teste_login/app/data/auth/auth_service.dart';
//import 'package:teste_login/app/data/validators/email_validator.dart';
//import 'package:teste_login/app/data/validators/password_validator.dart';
/*
class Auth{
  register( String? email, String? password){
    final emailError = EmailValidator().validate(email: email);
    final passwordError = PasswordValidator().validate(password: password);
    return emailError ?? passwordError; //?? operador verificar se o emailError for
    //diferente de nulo ele retorna ele se não ele retorna o passwordError e se o 
    //passwordError for igual a nulo ele retorna nulo na função 
  }
}
*/
void main() {
  late Auth auth;

  setUp(() {
    auth = Auth();
  });
 
 group('Validação de cadastro', () {
    test('deve retornar uma mensagem para um email e senha inválido', () {
      final result = auth.register('istoai', '125');
      expect(result, isA<String>());
    });

     test('deve retornar null para um email e senha válido', () {
      final result = auth.register('luide@gmail.com', 'istoai125');
      expect(result, isNull);
    });
  });
}