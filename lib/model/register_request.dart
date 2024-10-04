class RegisterRequest {
  String? userName;
  String? phoneNumber;
  String? branch;
  String? email;
  String? password;
  String? upiPassword;

  RegisterRequest(
      {this.userName,
        this.phoneNumber,
        this.branch,
        this.email,
        this.password,
        this.upiPassword});

  RegisterRequest.fromJson(Map<String, dynamic> json) {
    userName = json['userName'];
    phoneNumber = json['phoneNumber'];
    branch = json['branch'];
    email = json['email'];
    password = json['password'];
    upiPassword = json['upiPassword'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['userName'] = this.userName;
    data['phoneNumber'] = this.phoneNumber;
    data['branch'] = this.branch;
    data['email'] = this.email;
    data['password'] = this.password;
    data['upiPassword'] = this.upiPassword;
    return data;
  }
}