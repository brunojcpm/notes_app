import 'package:logger/logger.dart';
import 'package:notes_app/data/services/contracts/log.service.contract.dart';

class LoggerService implements LogService {
  final Logger _logger = Logger();

  @override
  void error(String message, {Object? error, StackTrace? stackTrace}) {
    _logger.e(
      message,
      stackTrace: stackTrace,
      time: DateTime.now(),
      error: error,
    );
  }

  @override
  void debug(String message) {
    _logger.d(message, time: DateTime.now());
  }

  @override
  void info(String message) {
    _logger.i(message, time: DateTime.now());
  }
}

final logger = LoggerService();
