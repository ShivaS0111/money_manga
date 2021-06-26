import 'dart:async';

enum LogLevel {
  verbose,
  debug,
  info,
  warn,
  error
}

extension _LogLevelOperator on LogLevel {

  bool operator < (LogLevel other) => index < other.index;
  bool operator <= (LogLevel other) => index <= other.index;
  bool operator > (LogLevel other) => index > other.index;
  bool operator >= (LogLevel other) => index >= other.index;
}

class InviaLog {
  
  static LogLevel logLevel = LogLevel.verbose;

  static void v({
    required String tag,
    required String message}) {

    if (logLevel <= LogLevel.verbose) {
      final log = '[v] [$_time][$tag] $message';
      _history.add(MapEntry(tag, log));
      print('\x1B[90m$log\x1B[0m');
    }
  }

  static void d({
    required String tag,
    required String message}) {
    
    if (logLevel <= LogLevel.debug) {
      final log = '[d] [$_time][$tag] $message';
      _history.add(MapEntry(tag, log));
      print('$log');
    }
  }

  static void i({
    required String tag,
    required String message}) {

    if (logLevel <= LogLevel.info) {
      final log = '[i] [$_time][$tag] $message';
      _history.add(MapEntry(tag, log));
      print('\x1B[34m$log\x1B[0m');
    }
  }

  static void w({
    required String tag,
    required String message}) {

    if (logLevel <= LogLevel.warn) {
      final log = '[w] [$_time][$tag] $message';
      _history.add(MapEntry(tag, log));
      print('\x1B[33m$log\x1B[0m');
    }
  }

  static void e({
    required String tag,
    required String message,
    Exception? exception}) {

    if (logLevel <= LogLevel.error) {
      final log = '[e] [$_time][$tag] $message - $exception';
      _history.add(MapEntry(tag, log));
      print('\x1B[31m$log\x1B[0m');
    }
  }
  
  static String get _time => DateTime.now().toIso8601String();

  static final List<MapEntry<String, String>> _history = [];

  // Load saved log data after filtering.
  static Future<List<String>> history({String? filter}) async {

    final completer = Completer<List<String>>()
      ..complete(_filter(filter));

    return completer.future;
  }

  static List<String> _filter(String? tag) {

    var filtered = <String>[];
    if (tag != null) {
      for (MapEntry entry in _history) {
        if (entry.key == tag) filtered.add(entry.value);
      }
    } else {
      for (MapEntry entry in _history) {
        filtered.add(entry.value);
      }
    }
    return filtered;
  }

  // Clear saved log messages
  static void clear() => _history.clear();
}
