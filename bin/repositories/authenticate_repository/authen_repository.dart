import '../../custom_response.dart';
import '../../services/authenticate_service/authen_service.dart';

class AuthenRepository implements ILoginService {
  //connect to data
  AuthenRepository();

  @override
  Future<CustomResponse> onLogin({required String account, required String password}) async {
    if (account == 'kieuphong' && password == '123123') {
      return CustomResponse<Map<String, dynamic>>(
        statusCode: 200,
        message: 'Đăng nhập thành công',
        data: {
          'account': 'kieuphong',
          'userName': 'Kiều Phong',
          'dateOfBirth': '15/12/1999',
        },
      );
    }
    return CustomResponse(
      statusCode: 401,
      message: 'Sai mật khẩu hoặc tài khoản',
    );
  }
}
