class User {
   String email;
   String password;

  User(this.email, this.password);

  User.fromJson(Map json)
      : email = json['email'],
        password = json['password'];

  Map toJson() => {
        'email': email,
        'password': password,
      };
}
