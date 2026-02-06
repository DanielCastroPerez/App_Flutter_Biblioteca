//import 'package:flutter/foundation.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class EnvConfig {
  static String get apiUrl {
    final url = dotenv.env['API_BASE_URL'];
    if (url == null || url.isEmpty) {
      throw Exception("API_BASE_URL not found in .env");
    }
    return url;
  }
}


// import 'package:flutter/foundation.dart';
// import 'package:flutter_dotenv/flutter_dotenv.dart';

// class EnvConfig {
//   static String get apiUrl {
//     if (kIsWeb) {
//       final url = dotenv.env['API_BASE_URL_WEB'];
//       if (url == null || url.isEmpty) {
//         throw Exception("API_BASE_URL_WEB not found in .env");
//       }
//       return url;
//     } else {
//       final url = dotenv.env['API_BASE_URL_ANDROID'];
//       if (url == null || url.isEmpty) {
//         throw Exception("API_BASE_URL_ANDROID not found in .env");
//       }
//       return url;
//     }
//   }
// }
