import 'package:flutter/material.dart';

class RegisterPage extends StatelessWidget {
  static String routeID = '/register';

  RegisterPage({super.key});

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Cadastre-se')),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            spacing: 16,
            children: <Widget>[
              TextFormField(
                controller: _nameController,
                decoration: InputDecoration(label: Text('Nome:')),
              ),
              TextFormField(
                controller: _emailController,
                decoration: InputDecoration(label: Text('E-mail:')),
              ),
              TextFormField(
                controller: _passwordController,
                decoration: InputDecoration(label: Text('Senha:')),
              ),
              TextFormField(
                controller: _confirmPasswordController,
                decoration: InputDecoration(label: Text('Confirme a senha:')),
              ),
              SizedBox(height: 16),
              Row(
                children: <Widget>[
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {},
                      child: Text('Finalizar'),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
