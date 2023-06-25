// import 'package:logger/logger.dart';
import 'package:logger/logger.dart' as logger_lib;
class Logger {
  static LogMode _logMode = LogMode.debug;

  static void init(LogMode mode) {
    Logger._logMode = mode;
  }

  static void PretteyLogger(data){
    var logger = logger_lib.Logger();

    logger.d(data);
  }

  static void log(dynamic data, {StackTrace? stackTrace}) {
    if (_logMode == LogMode.debug) {
      print("Error: $data$stackTrace");
    }
  }
}

enum LogMode { debug, live }
