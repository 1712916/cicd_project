import 'package:shelf/shelf.dart';

import '../../repositories/authenticate_repository/authen_repository.dart';

abstract class ILoginService {
  Future<Response> onLogin({required String account, required String password});
}

class LoginService implements ILoginService{
  final AuthenRepository authenRepository;

  LoginService(this.authenRepository);

  Future<Response> onLogin({required String account, required String password}) async {
    //validate here
    return authenRepository.onLogin(account: account, password: password);
  }
}