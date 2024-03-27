import 'package:flutter_test/flutter_test.dart';
import 'package:teste_login/app/data/validators/password_validator.dart';
/*
class PasswordValidator{
  String? validate({String? password}){
    if(password == null || password == ''){
      return 'A senha é obrigatória';
    }
    if(password.length < 6){
      return 'A senha deve possuir pelo menos 6 caracteres';
    }
    final alphanumeric = RegExp(r'^(?=.*[a-zA-Z])(?=.*[0-9]).+$');
    if(!alphanumeric.hasMatch(password)){
      return 'A senha deve ser alfanumérica';
    }
    return null;
  }
}
*/
void main() {
  late  PasswordValidator passwordValidator;
  setUp(() {
    passwordValidator = PasswordValidator();
  });
  group('Validação da senha', () { 
    test('Deve retornar uma mensagem de erro caso a senha seja nula', () {
      final result = passwordValidator.validate();

      expect(result, equals('A senha é obrigatória'));
    });

    test('Deve retornar uma mensagem de erro caso a senha seja vazia', () {
      final result = passwordValidator.validate(password: '');

      expect(result, equals('A senha é obrigatória'));
    });

     test('Deve retornar uma mensagem de erro caso a senha seja menor que 6 caracteres', () {
      final result = passwordValidator.validate(password: 'isto');

      expect(result, equals('A senha deve possuir pelo menos 6 caracteres'));
    });

    test('Deve retornar uma mensagem de erro caso a senha seja alfanumérica', () {
      final result = passwordValidator.validate(password: 'istoai');

      expect(result, equals('A senha deve ser alfanumérica'));
    });

     test('Deve retornar nulo caso a senha seja válida', () {
      final result = passwordValidator.validate(password: 'istoai34');

      expect(result, isNull);
    });
  });
}