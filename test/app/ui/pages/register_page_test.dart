import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:teste_login/app/ui/pages/register_page.dart';

void main() {
  group('Testes do campo de email', () { 
    testWidgets('Deve confirmar que o campo de email aparece na tela corretamente', (tester) async{
      await tester.pumpWidget(const MaterialApp(home: RegisterPage(),
      ),
      );//o async é usado pois a função leva um tempo para ser executada
      final emailKey = find.byKey(const Key('email_key')); //busca o campo na tela pela sua chave

      expect(emailKey, findsOneWidget); // vai verificar se o campo email esta aparecendo na tela
    },);//A função acima renderiza a tela

    testWidgets('Deve exibir uma snackbar com a mensagem de erro caso o e-mail seja nulo', (tester) async{
      await tester.pumpWidget(const MaterialApp(home: RegisterPage(),
      ),
      );
      final registerButton = find.byKey(const Key('register_button_key')); 
      await tester.tap(registerButton); // função que fala qual item vai clicar 
      await tester.pumpAndSettle(); //renderiza todos itens da tela e deixa ela pronta para o próximo comando

      expect(find.text('O e-mail é obrigatório'), findsOneWidget); 
    },);

    testWidgets('Deve exibir uma snackbar com a mensagem de erro caso o e-mail seja vazio', (tester) async{
      await tester.pumpWidget(const MaterialApp(home: RegisterPage(),
      ),
      );
      final emailField = find.byKey(const Key('email_key'));
      await tester.tap(emailField);
      await tester.pumpAndSettle();

      await tester.enterText(emailField, '');
      await tester.pumpAndSettle();

      final registerButton = find.byKey(const Key('register_button_key')); 
      await tester.tap(registerButton);  
      await tester.pumpAndSettle();

      expect(find.text('O e-mail é obrigatório'), findsOneWidget); 
    },
    );

     testWidgets(
        'deve exibir uma SnackBar com a mensagem de erro caso o e-mail seja inválido',
        (tester) async {
          await tester.pumpWidget(
            const MaterialApp(
              home: RegisterPage(),
            ),
          );

          final emailField = find.byKey(const Key('email_key'));
          await tester.tap(emailField);
          await tester.pumpAndSettle();

          await tester.enterText(emailField, 'william');
          await tester.pumpAndSettle();

          final registerButton = find.byKey(const Key('register_button_key'));
          await tester.tap(registerButton);
          await tester.pumpAndSettle();

          expect(find.text('O e-mail é inválido'), findsNothing);
        },
      );

        testWidgets(
        'não deve exibir nenhuma SnackBar com mensagem de erro caso o e-mail seja válido',
        (tester) async {
          await tester.pumpWidget(
            const MaterialApp(
              home: RegisterPage(),
            ),
          );

          final emailField = find.byKey(const Key('email_key'));
          await tester.tap(emailField);
          await tester.pumpAndSettle();

          await tester.enterText(emailField, 'william@gmail.com');
          await tester.pumpAndSettle();

          final registerButton = find.byKey(const Key('register_button_key'));
          await tester.tap(registerButton);
          await tester.pumpAndSettle();

          expect(find.text('O e-mail é inválido'), findsNothing);
        },
      );

  },
  );

   group(
    'testes do campo de senha',
    () {
      testWidgets(
        'deve confirmar que o campo de senha aparece na tela corretamente',
        (tester) async {
          await tester.pumpWidget(
            const MaterialApp(
              home: RegisterPage(),
            ),
          );

          final passwordField = find.byKey(const Key('password_key'));

          expect(passwordField, findsOneWidget);
        },
      );

      testWidgets(
        'deve exibir uma SnackBar com a mensagem de erro caso a senha seja nula',
        (tester) async {
          await tester.pumpWidget(
            const MaterialApp(
              home: RegisterPage(),
            ),
          );

          final emailField = find.byKey(const Key('email_key'));
          await tester.tap(emailField);
          await tester.pumpAndSettle();

          await tester.enterText(emailField, 'william@gmail.com');
          await tester.pumpAndSettle();

          final registerButton = find.byKey(const Key('register_button_key'));
          await tester.tap(registerButton);
          await tester.pumpAndSettle();

          expect(find.text('A senha é obrigatória'), findsNothing);
        },
      );

      testWidgets(
        'deve exibir uma SnackBar com a mensagem de erro caso a senha seja vazia',
        (tester) async {
          await tester.pumpWidget(
            const MaterialApp(
              home: RegisterPage(),
            ),
          );

          final emailField = find.byKey(const Key('email_key'));
          await tester.tap(emailField);
          await tester.pumpAndSettle();

          await tester.enterText(emailField, 'william@gmail.com');
          await tester.pumpAndSettle();

          final passwordField = find.byKey(const Key('password_key'));
          await tester.tap(passwordField);
          await tester.pumpAndSettle();

          await tester.enterText(passwordField, '');
          await tester.pumpAndSettle();

          final registerButton = find.byKey(const Key('register_button_key'));
          await tester.tap(registerButton);
          await tester.pumpAndSettle();

          expect(find.text('A senha é obrigatória'), findsNothing);
        },
      );

      testWidgets(
        'deve exibir uma SnackBar com a mensagem de erro caso a senha seja menor que 6 caracteres',
        (tester) async {
          await tester.pumpWidget(
            const MaterialApp(
              home: RegisterPage(),
            ),
          );

          final emailField = find.byKey(const Key('email_key'));
          await tester.tap(emailField);
          await tester.pumpAndSettle();

          await tester.enterText(emailField, 'william@gmail.com');
          await tester.pumpAndSettle();

          final passwordField = find.byKey(const Key('password_key'));
          await tester.tap(passwordField);
          await tester.pumpAndSettle();

          await tester.enterText(passwordField, 'ana');
          await tester.pumpAndSettle();

          final registerButton = find.byKey(const Key('register_button_key'));
          await tester.tap(registerButton);
          await tester.pumpAndSettle();

          expect(
            find.text('A senha deve possuir pelo menos 6 caracteres'),
            findsNothing,
          );
        },
      );

      testWidgets(
        'deve exibir uma SnackBar com a mensagem de erro caso a senha não seja alfanumérica',
        (tester) async {
          await tester.pumpWidget(
            const MaterialApp(
              home: RegisterPage(),
            ),
          );

          final emailField = find.byKey(const Key('email_key'));
          await tester.tap(emailField);
          await tester.pumpAndSettle();

          await tester.enterText(emailField, 'william@gmail.com');
          await tester.pumpAndSettle();

          final passwordField = find.byKey(const Key('password_key'));
          await tester.tap(passwordField);
          await tester.pumpAndSettle();

          await tester.enterText(passwordField, 'william');
          await tester.pumpAndSettle();

          final registerButton = find.byKey(const Key('register_button_key'));
          await tester.tap(registerButton);
          await tester.pumpAndSettle();

          expect(
            find.text('A senha deve ser alfanumérica'),
            findsNothing,
          );
        },
      );

      testWidgets(
        'não deve nenhuma SnackBar com mensagem de erro caso a senha seja válida',
        (tester) async {
          await tester.pumpWidget(
            const MaterialApp(
              home: RegisterPage(),
            ),
          );

          final emailField = find.byKey(const Key('email_key'));
          await tester.tap(emailField);
          await tester.pumpAndSettle();

          await tester.enterText(emailField, 'william@gmail.com');
          await tester.pumpAndSettle();

          final passwordField = find.byKey(const Key('password_key'));
          await tester.tap(passwordField);
          await tester.pumpAndSettle();

          await tester.enterText(passwordField, 'william123');
          await tester.pumpAndSettle();

          final registerButton = find.byKey(const Key('register_button_key'));
          await tester.tap(registerButton);
          await tester.pumpAndSettle();

          expect(
            find.text('A senha deve ser alfanumérica'),
            findsNothing,
          );
        },
      );
    },
  );

  group(
    'testes do botão de cadastro',
    () {
      testWidgets(
        'deve confirmar que o botão de cadastro aparece na tela corretamente',
        (tester) async {
          await tester.pumpWidget(
            const MaterialApp(
              home: RegisterPage(),
            ),
          );

          final registerButton = find.byKey(const Key('register_button_key'));

          expect(registerButton, findsOneWidget);
        },
      );

      testWidgets(
        'deve exibir uma SnackBar com a mensagem de erro para um email e senha inválidos ao clicar no botão',
        (tester) async {
          await tester.pumpWidget(
            const MaterialApp(
              home: RegisterPage(),
            ),
          );

          final emailField = find.byKey(const Key('email_key'));
          await tester.tap(emailField);
          await tester.pumpAndSettle();

          await tester.enterText(emailField, 'william');
          await tester.pumpAndSettle();

          final passwordField = find.byKey(const Key('password_key'));
          await tester.tap(passwordField);
          await tester.pumpAndSettle();

          await tester.enterText(passwordField, '123');
          await tester.pumpAndSettle();

          final registerButton = find.byKey(const Key('register_button_key'));
          await tester.tap(registerButton);
          await tester.pumpAndSettle();

          expect(
            find.byType(SnackBar),
            findsOneWidget,
          );
        },
      );

      testWidgets(
        'não deve exibir uma SnackBar com a mensagem de erro para um email e senha válidos ao clicar no botão',
        (tester) async {
          await tester.pumpWidget(
            const MaterialApp(
              home: RegisterPage(),
            ),
          );

          final emailField = find.byKey(const Key('email_key'));
          await tester.tap(emailField);
          await tester.pumpAndSettle();

          await tester.enterText(emailField, 'william@gmail.com');
          await tester.pumpAndSettle();

          final passwordField = find.byKey(const Key('password_key'));
          await tester.tap(passwordField);
          await tester.pumpAndSettle();

          await tester.enterText(passwordField, 'william123');
          await tester.pumpAndSettle();

          final registerButton = find.byKey(const Key('register_button_key'));
          await tester.tap(registerButton);
          await tester.pumpAndSettle();

          expect(
            find.byType(SnackBar),
            findsOneWidget,
          );
        },
      );
    },
  );

}