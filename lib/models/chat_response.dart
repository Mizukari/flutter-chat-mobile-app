class ChatResponse {
  int id;
  String type;
  String content;
  String sender;
  String receiver;
  Null room;
  String dateTime;

  ChatResponse(
      {this.id,
        this.type,
        this.content,
        this.sender,
        this.receiver,
        this.room,
        this.dateTime});

  ChatResponse.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    type = json['type'];
    content = json['content'];
    sender = json['sender'];
    receiver = json['receiver'];
    room = json['room'];
    dateTime = json['dateTime'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['type'] = this.type;
    data['content'] = this.content;
    data['sender'] = this.sender;
    data['receiver'] = this.receiver;
    data['room'] = this.room;
    data['dateTime'] = this.dateTime;
    return data;
  }
}
