class RegisterResponseModel {
  String? message;
  UserData? userData;

  RegisterResponseModel({this.message, this.userData});

  RegisterResponseModel.fromJson(Map<String, dynamic> json) {
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
  String? userName;
  String? email;
  String? phoneNumber;
  String? branch;
  String? bankAccountType;
  String? bankName;
  AccountCreatedAt? accountCreatedAt;
  int? accountBalance;
  String? upiPassword;

  UserData(
      {this.uid,
        this.userName,
        this.email,
        this.phoneNumber,
        this.branch,
        this.bankAccountType,
        this.bankName,
        this.accountCreatedAt,
        this.accountBalance,
        this.upiPassword});

  UserData.fromJson(Map<String, dynamic> json) {
    uid = json['uid'];
    userName = json['User Name'];
    email = json['Email'];
    phoneNumber = json['Phone Number'];
    branch = json['Branch'];
    bankAccountType = json['Bank Account Type'];
    bankName = json['Bank Name'];
    accountCreatedAt = json['Account created at'] != null
        ? new AccountCreatedAt.fromJson(json['Account created at'])
        : null;
    accountBalance = json['Account Balance'];
    upiPassword = json['upiPassword'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['uid'] = this.uid;
    data['User Name'] = this.userName;
    data['Email'] = this.email;
    data['Phone Number'] = this.phoneNumber;
    data['Branch'] = this.branch;
    data['Bank Account Type'] = this.bankAccountType;
    data['Bank Name'] = this.bankName;
    if (this.accountCreatedAt != null) {
      data['Account created at'] = this.accountCreatedAt!.toJson();
    }
    data['Account Balance'] = this.accountBalance;
    data['upiPassword'] = this.upiPassword;
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