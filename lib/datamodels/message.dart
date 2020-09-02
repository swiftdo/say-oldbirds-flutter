class Message {
  int id;
  String name;
  String message;
  String time;
  Message.fromJson(Map json)
      : id = json['id'],
        name = json['name'],
        time = json['time'],
        message = json['message'];
}

class Messages {
  int count;
  List<Message> messages;
  Messages.fromJson(Map json)
      : count = json['count'],
        messages = (json['messages'] as List)
            .map(
              (item) => Message.fromJson(item),
            )
            .toList();
}
