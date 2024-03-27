import '../validators/email_validator.dart';
import '../validators/password_validator.dart';

class Auth{
  register( String? email, String? password){
    final emailError = EmailValidator().validate(email: email);
    final passwordError = PasswordValidator().validate(password: password);
    return emailError ?? passwordError; //?? operador verificar se o emailError for
    //diferente de nulo ele retorna ele se não ele retorna o passwordError e se o 
    //passwordError for igual a nulo ele retorna nulo na função 
  }
}