import 'package:say_oldbirds_flutter/app/locator.dart';
import 'package:say_oldbirds_flutter/datamodels/message.dart';
import 'package:say_oldbirds_flutter/services/messages_service.dart';
import 'package:stacked/stacked.dart';

class MessageAddViewModel extends ReactiveViewModel {
  final _messageServer = locator<MessagesService>();

  List<Message> get messages => _messageServer.messages;

  String name;
  String message;

  addMessage() async {
    await _messageServer.addMessage(name: name, message: message);
    name = null;
    message = null;
    notifyListeners();
  }

  @override
  List<ReactiveServiceMixin> get reactiveServices => [_messageServer];
}
