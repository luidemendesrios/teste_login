import 'package:flutter_test/flutter_test.dart';
import 'package:teste_login/app/data/validators/email_validator.dart';
/*
class EmailValidator {
  String? validate({String? email}){ // retorno da função nula
    if(email == null || email == ''){
      return 'O e-mail é obrigatório';
    }
    final emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    if(!emailRegex.hasMatch(email)){ //! nega se o email não entrar na regra do regExp
      return 'O e-mail é inválido';
    }
    return null; //caso não entre em nenhum dos casos acima ele retorna nulo
  } //função 
}
*/

void main() {
  late EmailValidator  emailValidator;

  setUp(() {
    emailValidator = EmailValidator(); //Instânciar 
  });
  group('Validação do e-mail', () { 
    test('Deve retornar uma mensagem de erro caso o e-mail seja null', () {
      final result = emailValidator.validate();

      expect(result, 'O e-mail é obrigatório');
    });

     test('Deve retornar uma mensagem de erro caso o e-mail seja vazio', () {
      final result = emailValidator.validate(email:'');

      expect(result, 'O e-mail é obrigatório');
    });

    test('Deve retornar uma mensagem de erro caso o e-mail seja inválido', () {
      final result = emailValidator.validate(email:'luide');

      expect(result, 'O e-mail é inválido');
    });

    test('Deve retornar null caso o email seja válido', () {
      final result = emailValidator.validate(email:'luide@gmail.com');

      expect(result, isNull);
    });
  });
}