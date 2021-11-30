class Account {
  String email;
  String number;
  String address;

  Account(this.email, this.number, this.address);

  Account.FromJson(Map json)
      : email = json['email'],
        number = json['number'],
        address = json['address'];

  Map toJson() => {
        'email': email,
        'number': number,
        'address': address,
      };
}
