abstract interface class LogService {
  void error(String message, {Object? error, StackTrace? stackTrace});
  void debug(String message);
  void info(String message);
}
