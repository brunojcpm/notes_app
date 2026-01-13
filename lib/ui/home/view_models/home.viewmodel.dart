import 'package:flutter/material.dart';
import 'package:notes_app/data/repositories/note/note.repository.dart';
import 'package:notes_app/data/services/logger.service.dart';
import 'package:notes_app/domains/note/models/note.model.dart';
import 'package:notes_app/shared/command.dart';
import 'package:notes_app/shared/result.dart';

class HomeViewModel extends ChangeNotifier {
  final NoteRepository _homeLocalRepository;

  late Command0 loadNoteCommand;

  List<Note> _notes = [];
  List<Note> get notes => _notes;

  HomeViewModel({required NoteRepository localRepository})
    : _homeLocalRepository = localRepository {
    loadNoteCommand = Command0(_loadNotes)..execute();
  }

  Future<Result<List<Note>>> _loadNotes() async {
    try {
      final notes = await _homeLocalRepository.getNotes();

      switch (notes) {
        case Ok<List<Note>>():
          _notes = notes.value;
        case Error<List<Note>>():
          throw notes.error;
      }

      return notes;
    } catch (error, stackTrace) {
      logger.error(
        'Error to get or load notes',
        error: error,
        stackTrace: stackTrace,
      );
      return Result.error(Exception('Erro ao carregar tarefas: $error'));
    } finally {
      notifyListeners();
    }
  }
}
