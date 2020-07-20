class AddFriendResponse {
  int status;
  String message;
  Data data;

  AddFriendResponse({this.status, this.message, this.data});

  AddFriendResponse.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data.toJson();
    }
    return data;
  }
}

class Data {
  int messageId;

  Data({this.messageId});

  Data.fromJson(Map<String, dynamic> json) {
    messageId = json['Message id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Message id'] = this.messageId;
    return data;
  }
}
