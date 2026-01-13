import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:notes_app/ui/ui.dart';

class SignInPage extends StatelessWidget {
  static String routeID = '/authentication';

  SignInPage({super.key});

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Autenticação')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: SingleChildScrollView(
          child: Column(
            spacing: 16,
            children: <Widget>[
              TextFormField(
                controller: _emailController,
                decoration: InputDecoration(label: Text('E-mail:')),
              ),
              TextFormField(
                controller: _passwordController,
                decoration: InputDecoration(label: Text('Senha:')),
              ),
              SizedBox(height: 16),
              Row(
                children: <Widget>[
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {},
                      child: Text('Entrar'),
                    ),
                  ),
                ],
              ),
              Row(
                children: <Widget>[
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {},
                      child: Text('Login com Google'),
                    ),
                  ),
                ],
              ),
              TextButton(
                child: Text('Cadastre-se'),
                onPressed: () => context.push(RegisterPage.routeID),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
