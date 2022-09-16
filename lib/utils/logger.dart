import 'package:flutter/foundation.dart';

enum Level { verbose, debug, info, warning, error }

// TODO add funtion name
class Logger {
  String _msg = '';

  Logger();

  // set level of the msg
  Logger level(Level l) {
    _msg += " ${l.toString()}";
    return this;
  }

  // set location of the msg
  Logger at(Object className) {
    _msg += " ${className.runtimeType.toString()}";
    return this;
  }

  // print the msg only in debug mode
  void log(Object msg) {
    if (kDebugMode) {
      _msg += " ${msg.toString()}";
      print(_msg);
    }
  }
}
