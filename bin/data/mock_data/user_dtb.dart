import '../../repositories/repositories.dart';

class UserMockData {
  static int _id = 0;

  static final List<UserModel> _users = [];

  static List<UserModel> get users => _users;

  static bool addUser({String? account, String? password, String? userName}) {
    _users.add(UserModel(
      id: (_id++).toString(),
      account: account!,
      password: password!,
      userName: userName ?? '',
    ));
    return true;
  }

  static initData() {
    AuthenRepository authenRepository = AuthenRepository();
    for (int i = 0; i < 10; i++) {
      authenRepository.onRegister(account: i.toString(), password: '123123');
    }
  }
}

class UserModel {
  final String id;
  final String account;
  final String password;
  String? userName;
  String? dateOfBirth;
  List<String>? addresses;

  UserModel({
    required this.id,
    required this.account,
    required this.password,
    this.userName,
    this.dateOfBirth,
    this.addresses,
  });

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'account': account,
      'userName': userName,
      'dateOfBirth': dateOfBirth,
      'addresses': addresses,
    };
  }
}
