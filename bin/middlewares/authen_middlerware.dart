import 'package:dart_jsonwebtoken/dart_jsonwebtoken.dart';
import 'package:shelf/shelf.dart';

import '../custom_response.dart';
import '../server.dart';

class AuthenMiddleware {
  static Middleware get middleware => createMiddleware(
        requestHandler: (request) {
          try {
            String token = getTokenFromRequest(request);
            try {
              JWT.verify(
                token,
                SecretKey(secretKey),
              );
            } on JWTUndefinedError catch (e) {
              if (e.error is JWTExpiredError) {
                return CustomResponse(statusCode: 408, message: 'Phiên đã kết thúc');
              }
              return CustomResponse(statusCode: 500, message: 'Lỗi từ server :3');
            } catch (e) {
              return CustomResponse(statusCode: 500, message: 'Lỗi từ server :3');
            }
          } catch (e) {
            return CustomResponse(statusCode: 401, message: 'Unauthorized');
          }
        },
      );

  static String getTokenFromRequest(Request request) {
    if (request.headers['authorization'] != null) {
      try {
        String token = (request.headers['authorization'] as String).split(' ')[1];
        return token;
      } catch (e) {
        throw Exception('authorization wrong format');
      }
    }
    throw Exception('không tìm thấy token');
  }
}
