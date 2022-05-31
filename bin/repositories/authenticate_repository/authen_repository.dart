import 'package:dart_jsonwebtoken/dart_jsonwebtoken.dart';
import 'package:dbcrypt/dbcrypt.dart';
import 'package:shelf/shelf.dart';

import '../../custom_response.dart';
import '../../data/mock_data/mock_data.dart';
import '../../services/authenticate_service/authen_service.dart';

class AuthenRepository implements ILoginService, IRegisterService {
  //connect to data
  AuthenRepository();

  @override
  Future<Response> onLogin({required String account, required String password}) async {
    try {
      final user = UserMockData.users.firstWhere((element) => element.account == account);
      if (DBCrypt().checkpw(password, user.password)) {
        //gen token
        final jwt = JWT(
          {
            'id': user.id,
          },
        );
        String secretKey = 'kieuPhong';
        String token = jwt.sign(SecretKey(secretKey), expiresIn: Duration(seconds: 30));

        return CustomResponse<Map<String, dynamic>>(
          statusCode: 200,
          message: 'Đăng nhập thành công',
          data: {
            'userInfo': user.toJson(),
            'token': token,
          },
        );
      }
      print('Sai mật khẩu');
    } catch (e) {
      print('Không tìm thấy account');
    }
    return CustomResponse(
      statusCode: 401,
      message: 'Sai mật khẩu hoặc tài khoản',
    );
  }

  @override
  Future<Response> onRegister({required String account, required String password}) async {
    try {
      final user = UserMockData.users.firstWhere((element) => element.account == account);
      return CustomResponse(
        statusCode: 409,
        message: 'Không thể đăng ký tài khoản này',
      );
    } catch (e) {
      String hashedPassword = DBCrypt().hashpw(password, DBCrypt().gensalt());
      final isSuccess = UserMockData.addUser(account: account, password: hashedPassword);
      if (isSuccess) {
        return CustomResponse(
          statusCode: 201,
          message: 'Đăng ký thành công',
        );
      }
      return CustomResponse(
        statusCode: 500,
        message: 'Đã xuất hiện lỗi tại server',
      );
    }
  }
}
