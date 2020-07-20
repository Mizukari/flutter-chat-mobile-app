class AddFriendRequest {
  String friend;
  String username;

  AddFriendRequest({this.friend, this.username});

  AddFriendRequest.fromJson(Map<String, dynamic> json) {
    friend = json['friend'];
    username = json['username'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['friend'] = this.friend;
    data['username'] = this.username;
    return data;
  }
}
