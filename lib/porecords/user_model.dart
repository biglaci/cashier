//MARK: Login Response
class UserResponse {
  final String token;
  final User data;
  final String status;

  UserResponse({required this.token, required this.status, required this.data});

  factory UserResponse.init(String name,String email, int? id, String token) {
    return UserResponse(
      token: token,
      data: User.initUser(name,email,id),
      status: "ok",
    );
  }
}

class User {
  final int? userId;
  final String name;
  final String email;
  final String nameUpperCase;

  User(
      {required this.userId,
      this.name = "",
      required this.email,
      required this.nameUpperCase});

  factory User.initUser(String name, String email, int? id) {
    return User(
      userId: id,
      name: name,
      email: email,
      nameUpperCase: name.toUpperCase()
    );
  }
}
