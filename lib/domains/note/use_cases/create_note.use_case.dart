// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:notes_app/data/repositories/note/note.repository.dart';
import 'package:notes_app/data/services/logger.service.dart';
import 'package:notes_app/domains/note/models/note.model.dart';
import 'package:notes_app/shared/result.dart';

class CreateNoteUseCase {
  final NoteRepository _localRepository;

  CreateNoteUseCase({required NoteRepository localNoteRepository})
    : _localRepository = localNoteRepository;

  Future<Result<Note>> execute({
    required String title,
    String? description,
  }) async {
    try {
      final newNote = Note.create(title: title, description: description);

      switch (newNote) {
        case Ok<Note>():
          logger.info('Note created');
        case Error<Note>():
          throw newNote.error;
      }

      final saveNote = await _localRepository.saveNote(newNote.value);

      switch (saveNote) {
        case Ok<void>():
          logger.info('Note saved successfully');
        case Error<void>():
          throw saveNote.error;
      }

      return Result.ok(newNote.value);
    } catch (error, stackTrace) {
      logger.error(
        'Error to create or save note',
        stackTrace: stackTrace,
        error: error,
      );
      return Result.error(Exception(error));
    }
  }
}
