import 'dart:async';

import 'package:notes_app/data/repositories/note/note.repository.dart';
import 'package:notes_app/data/services/logger.service.dart';
import 'package:notes_app/domains/note/models/note.model.dart';
import 'package:notes_app/shared/result.dart';

class NoteLocalRepository extends NoteRepository {
  @override
  Future<Result<List<Note>>> getNotes() async {
    try {
      await Future.delayed(const Duration(seconds: 2));

      return Result.ok([
        Note.fromMap({
          'id': '1',
          'title': 'Note 1',
          'description': 'Realizar uma ação 1',
        }),
        Note.fromMap({
          'id': '2',
          'title': 'Note 2',
          'description': 'Realizar o modo 2',
        }),
        Note.fromMap({
          'id': '3',
          'title': 'Note 3',
          'description': 'Realizar a trajetória 3',
        }),
      ]);
    } catch (error, stackTrace) {
      logger.error(
        'Error to get remote notes',
        stackTrace: stackTrace,
        error: error,
      );
      return Result.error(Exception(error));
    }
  }

  @override
  Future<Result<void>> saveNote(Note task) async {
    try {
      await Future.delayed(const Duration(seconds: 2));

      return Result.ok(null);
    } catch (error, stackTrace) {
      logger.error(
        'Error to save remote note',
        stackTrace: stackTrace,
        error: error,
      );
      return Result.error(Exception(error));
    }
  }
}
