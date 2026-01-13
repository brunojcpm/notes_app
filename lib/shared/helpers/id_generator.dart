import 'dart:math';

class IdGenerator {
  static String uuidV4() {
    final random = Random();
    final bytes = List<int>.generate(16, (_) => random.nextInt(256));

    bytes[6] = (bytes[6] & 0x0f) | 0x40; // versão 4
    bytes[8] = (bytes[8] & 0x3f) | 0x80; // variante

    String toHex(int value) => value.toRadixString(16).padLeft(2, '0');

    return [
      bytes.sublist(0, 4).map(toHex).join(),
      bytes.sublist(4, 6).map(toHex).join(),
      bytes.sublist(6, 8).map(toHex).join(),
      bytes.sublist(8, 10).map(toHex).join(),
      bytes.sublist(10, 16).map(toHex).join(),
    ].join('-');
  }
}
