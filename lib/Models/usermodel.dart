class UserModel {
  String? userName;
  String? password;
  String? url;
  String? currentDate;

  UserModel({this.userName, this.password, this.url, this.currentDate});

  UserModel.fromJson(Map<String, dynamic> json) {
    userName = json['UserName'];
    password = json['Password'];
    url = json['Url'];
    currentDate = json['CurrentDate'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['UserName'] = this.userName;
    data['Password'] = this.password;
    data['Url'] = this.url;
    data['CurrentDate'] = this.currentDate;
    return data;
  }
}

