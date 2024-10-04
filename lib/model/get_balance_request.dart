class GetBalanceRequest {
  String? id;
  String? upiPassword;

  GetBalanceRequest({this.id, this.upiPassword});

  GetBalanceRequest.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    upiPassword = json['upiPassword'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['upiPassword'] = this.upiPassword;
    return data;
  }
}