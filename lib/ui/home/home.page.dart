import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:notes_app/domains/note/models/note.model.dart';
import 'package:notes_app/ui/ui.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  static String routeID = '/';

  final HomeViewModel _viewModel;

  const HomePage({super.key, required HomeViewModel viewModel})
    : _viewModel = viewModel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Note List')),
      body: SafeArea(
        child: ListenableBuilder(
          listenable: _viewModel.loadNoteCommand,
          builder: (_, child) {
            if (_viewModel.loadNoteCommand.error) {
              return Text('Erro ao carregar as notas');
            }

            if (_viewModel.loadNoteCommand.running) {
              return Center(child: CircularProgressIndicator());
            }

            return child ?? const SizedBox.shrink();
          },
          child: Consumer<HomeViewModel>(
            builder: (context, viewModel, _) {
              return ListView.separated(
                itemCount: viewModel.notes.length,
                separatorBuilder: (_, _) => Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Container(
                    width: double.infinity,
                    height: 1,
                    color: Colors.grey,
                  ),
                ),
                itemBuilder: (_, index) {
                  final Note note = viewModel.notes[index];

                  return ListTile(
                    key: ValueKey(note.id),
                    title: Text(note.title),
                    subtitle: note.description != null
                        ? Text(note.description ?? '')
                        : null,
                    trailing: Icon(Icons.chevron_right),
                  );
                },
              );
            },
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => context.push(RegisterPage.routeID),
        child: Icon(Icons.add),
      ),
    );
  }
}
