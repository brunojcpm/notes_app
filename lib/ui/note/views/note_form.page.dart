import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:notes_app/ui/ui.dart';

class NoteFormPage extends StatelessWidget {
  static String routeID = '/note';

  final NoteFormViewModel _viewModel;

  final GlobalKey<FormState> _form = GlobalKey();
  final NoteFormModel _noteFormModel = NoteFormModel();

  NoteFormPage({super.key, required viewModel}) : _viewModel = viewModel;

  void _handleSubmit(BuildContext context) async {
    if (_form.currentState?.validate() != true) {
      return;
    }

    _form.currentState?.save();

    await _viewModel.save.execute(_noteFormModel);

    if (!context.mounted) {
      return;
    }

    if (_viewModel.save.error) {
      return print('Deu erro');
    }

    context.pop(HomePage.routeID);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Nota')),
      body: ListenableBuilder(
        listenable: _viewModel.save,
        builder: (context, child) {
          return SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Form(
                key: _form,
                child: Column(
                  spacing: 8,
                  children: <Widget>[
                    TextFormField(
                      decoration: InputDecoration(
                        label: Text('Titulo'),
                        helper: Text('Informe o título da sua nota'),
                      ),
                      validator: _noteFormModel.titleValidator,
                      onSaved: _noteFormModel.handleTitle,
                      enabled: !_viewModel.save.running,
                    ),
                    TextFormField(
                      decoration: InputDecoration(
                        label: Text('Descrição'),
                        helper: Text(
                          'Informe uma descrição para esta nota (opcional)',
                        ),
                      ),
                      onSaved: _noteFormModel.handleDescription,
                      enabled: !_viewModel.save.running,
                    ),
                    const SizedBox(height: 30),
                    Row(
                      children: <Widget>[
                        Expanded(
                          child: ElevatedButton(
                            onPressed: !_viewModel.save.running
                                ? () => _handleSubmit(context)
                                : null,
                            child: Text('Criar nota'),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
