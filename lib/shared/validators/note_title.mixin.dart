mixin NoteTitleValidator {
  String? titleValidator(String? title) {
    if (title == null) {
      return 'O título é obrigatório';
    }

    if (title.isEmpty) {
      return 'O título é precisa ser preenchido';
    }

    if (title.length <= 3) {
      return 'O título precisa ter no mínimo 3 caracteres';
    }

    return null;
  }
}
