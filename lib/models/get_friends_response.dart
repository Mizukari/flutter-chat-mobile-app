class GetFriendsResponse {
  int status;
  String message;
  List<Data> data;

  GetFriendsResponse({this.status, this.message, this.data});

  GetFriendsResponse.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    if (json['data'] != null) {
      data = new List<Data>();
      json['data'].forEach((v) {
        data.add(new Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  int userId;
  String username;
  String name;
  String friendUsername;
  String friendName;

  Data(
      {this.userId,
        this.username,
        this.name,
        this.friendUsername,
        this.friendName});

  Data.fromJson(Map<String, dynamic> json) {
    userId = json['user_id'];
    username = json['username'];
    name = json['name'];
    friendUsername = json['friend_username'];
    friendName = json['friend_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['user_id'] = this.userId;
    data['username'] = this.username;
    data['name'] = this.name;
    data['friend_username'] = this.friendUsername;
    data['friend_name'] = this.friendName;
    return data;
  }
}
