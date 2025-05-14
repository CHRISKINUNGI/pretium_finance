// lib/utils/logger.dart
import 'package:flutter/foundation.dart'; // For kDebugMode
import 'package:logger/logger.dart';

class AppLogger {
  late final Logger _logger;
  final Type? context; // Optional context (e.g., the class using the logger)

  AppLogger([this.context]) {
    _logger = Logger(
      // Customize the printer for different log levels and to include context
      printer: PrettyPrinter(
        methodCount: 1, // Number of method calls to be displayed
        errorMethodCount: 5, // Number of method calls if stacktrace is provided
        lineLength: 100, // Width of the log output
        colors: true, // Colorful log messages
        printEmojis: true, // Print an emoji for each log message
        printTime: true, // Should each log print contain a timestamp
        // You can further customize the prefix for each log level
        // levelPrefixes: {
        //   Level.trace: '[TRACE]',
        //   Level.debug: '[DEBUG]',
        //   Level.info: '[INFO]',
        //   Level.warning: '[WARN]',
        //   Level.error: '[ERROR]',
        //   Level.fatal: '[FATAL]',
        // },
      ),
      // Filter logs based on build mode (e.g., only show debug logs in debug mode)
      filter: kDebugMode ? DevelopmentFilter() : ProductionFilter(),
      // You can also set a global log level
      // level: Level.debug, // Default is Level.verbose
    );
  }

  String _formatMessage(String message) {
    return context != null ? '[${context.toString()}] $message' : message;
  }

  /// Log a message at level [Level.trace].
  void t(dynamic message, {Object? error, StackTrace? stackTrace}) {
    _logger.t(_formatMessage(message.toString()), error: error, stackTrace: stackTrace);
  }

  /// Log a message at level [Level.debug].
  void d(dynamic message, {Object? error, StackTrace? stackTrace}) {
    _logger.d(_formatMessage(message.toString()), error: error, stackTrace: stackTrace);
  }

  /// Log a message at level [Level.info].
  void i(dynamic message, {Object? error, StackTrace? stackTrace}) {
    _logger.i(_formatMessage(message.toString()), error: error, stackTrace: stackTrace);
  }

  /// Log a message at level [Level.warning].
  void w(dynamic message, {Object? error, StackTrace? stackTrace}) {
    _logger.w(_formatMessage(message.toString()), error: error, stackTrace: stackTrace);
  }

  /// Log a message at level [Level.error].
  void e(dynamic message, {Object? error, StackTrace? stackTrace}) {
    _logger.e(_formatMessage(message.toString()), error: error, stackTrace: stackTrace);
  }

  /// Log a message at level [Level.fatal].
  void f(dynamic message, {Object? error, StackTrace? stackTrace}) {
    _logger.f(_formatMessage(message.toString()), error: error, stackTrace: stackTrace);
  }
}

// Optional: Define a ProductionFilter if you want to suppress certain logs in release.
class ProductionFilter extends LogFilter {
  @override
  bool shouldLog(LogEvent event) {
    // In production, only log warnings, errors, and fatal errors.
    return event.level.index >= Level.warning.index;
  }
}