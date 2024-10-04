
class GetBalanceResponse {
  String? message;
  int? accountBalance;

  GetBalanceResponse({this.message, this.accountBalance});

  GetBalanceResponse.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    accountBalance = json['accountBalance'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = this.message;
    data['accountBalance'] = this.accountBalance;
    return data;
  }
}