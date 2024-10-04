class LoginResponseModel {
  String? message;
  UserData? userData;

  LoginResponseModel({this.message, this.userData});

  LoginResponseModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    userData = json['userData'] != null
        ? new UserData.fromJson(json['userData'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = this.message;
    if (this.userData != null) {
      data['userData'] = this.userData!.toJson();
    }
    return data;
  }
}

class UserData {
  String? uid;
  String? email;
  int? accountBalance;
  String? userName;
  String? upiPassword;
  String? branch;
  AccountCreatedAt? accountCreatedAt;
  String? phoneNumber;
  String? bankName;
  String? bankAccountType;

  UserData(
      {this.uid,
        this.email,
        this.accountBalance,
        this.userName,
        this.upiPassword,
        this.branch,
        this.accountCreatedAt,
        this.phoneNumber,
        this.bankName,
        this.bankAccountType});

  UserData.fromJson(Map<String, dynamic> json) {
    uid = json['uid'];
    email = json['Email'];
    accountBalance = json['Account Balance'];
    userName = json['User Name'];
    upiPassword = json['upiPassword'];
    branch = json['Branch'];
    accountCreatedAt = json['Account created at'] != null
        ? new AccountCreatedAt.fromJson(json['Account created at'])
        : null;
    phoneNumber = json['Phone Number'];
    bankName = json['Bank Name'];
    bankAccountType = json['Bank Account Type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['uid'] = this.uid;
    data['Email'] = this.email;
    data['Account Balance'] = this.accountBalance;
    data['User Name'] = this.userName;
    data['upiPassword'] = this.upiPassword;
    data['Branch'] = this.branch;
    if (this.accountCreatedAt != null) {
      data['Account created at'] = this.accountCreatedAt!.toJson();
    }
    data['Phone Number'] = this.phoneNumber;
    data['Bank Name'] = this.bankName;
    data['Bank Account Type'] = this.bankAccountType;
    return data;
  }
}

class AccountCreatedAt {
  int? iSeconds;
  int? iNanoseconds;

  AccountCreatedAt({this.iSeconds, this.iNanoseconds});

  AccountCreatedAt.fromJson(Map<String, dynamic> json) {
    iSeconds = json['_seconds'];
    iNanoseconds = json['_nanoseconds'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_seconds'] = this.iSeconds;
    data['_nanoseconds'] = this.iNanoseconds;
    return data;
  }
}