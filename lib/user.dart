class User {
  String? name;
  String? email;
  String? username;

  User({this.email, this.name, this.username});
  factory User.fromJson(Map<String, dynamic> data) {
    return User(
        name: data['name'], email: data['email'], username: data['username']);
  }
}
