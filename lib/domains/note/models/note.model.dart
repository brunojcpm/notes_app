import 'package:notes_app/shared/helpers/id_generator.dart';
import 'package:notes_app/shared/result.dart';

class Note {
  final String id;
  final String title;
  final String? description;

  Note._({required this.id, required this.title, this.description});

  factory Note.empty() {
    return Note._(id: IdGenerator.uuidV4(), title: '', description: null);
  }

  static Result<Note> create({required String title, String? description}) {
    final validation = _validateTitle(title);
    switch (validation) {
      case Ok<void>():
        return Result.ok(
          Note._(
            id: IdGenerator.uuidV4(),
            title: title.trim(),
            description: description?.trim(),
          ),
        );
      case Error<void>():
        return Result.error(validation.error);
    }
  }

  Result<Note> update({required String title, String? description}) {
    final validation = _validateTitle(title.trim());

    switch (validation) {
      case Ok<void>():
        return Result.ok(
          Note._(id: id, title: title.trim(), description: description?.trim()),
        );
      case Error<void>():
        return Result.error(validation.error);
    }
  }

  static Result<void> _validateTitle(String title) {
    if (title.trim().isEmpty) {
      return Result.error(Exception('O título precisa ser preenchido'));
    }

    if (title.trim().length < 3) {
      return Result.error(
        Exception('O título precisa ter no mínimo 3 caracteres'),
      );
    }

    return Result.ok(null);
  }

  bool get isEmpty => title.isEmpty && (description?.isEmpty ?? true);

  factory Note.fromMap(Map<String, dynamic> map) {
    return Note._(
      id: map['id'] as String,
      title: map['title'] as String,
      description: map['description'] != null
          ? map['description'] as String
          : null,
    );
  }
}
