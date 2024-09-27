import 'package:logger/web.dart';

class LogService {
  static d(String message) {
    Logger logger = Logger();
    logger.d(message);
  }

  static w(String message) {
    Logger logger = Logger();
    logger.w(message);
  }

  static e(String message) {
    Logger logger = Logger();
    logger.e(message);
  }
}
