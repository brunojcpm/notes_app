import 'package:notes_app/domains/note/models/note.model.dart';
import 'package:notes_app/shared/result.dart';

abstract class NoteRepository {
  Future<Result<List<Note>>> getNotes();
  Future<Result<void>> saveNote(Note task);
}
