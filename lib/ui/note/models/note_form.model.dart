import 'package:notes_app/shared/validators/note_title.mixin.dart';

class NoteFormModel with NoteTitleValidator {
  String? title;
  String? description;

  void handleTitle(String? title) {
    this.title = title;
  }

  void handleDescription(String? description) {
    this.description = description;
  }
}
