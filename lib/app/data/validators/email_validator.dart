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