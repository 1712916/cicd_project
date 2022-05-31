import 'package:shelf/shelf.dart';

import '../../repositories/authenticate_repository/authen_repository.dart';

abstract class IRegisterService {
  Future<Response> onRegister({required String account, required String password});
}

class RegisterService implements IRegisterService{
  final AuthenRepository authenRepository;

  RegisterService(this.authenRepository);


  @override
  Future<Response> onRegister({required String account, required String password}) {
    return authenRepository.onRegister(account: account, password: password);
  }
}