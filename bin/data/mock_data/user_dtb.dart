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
}

class UserModel {
  final String id;
  final String account;
  final String password;
  final String userName;

  UserModel({
    required this.id,
    required this.account,
    required this.password,
    required this.userName,
  });

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'account': account,
      'userName': userName,
    };
  }
}
