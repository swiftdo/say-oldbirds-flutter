import 'package:say_oldbirds_flutter/app/locator.dart';
import 'package:say_oldbirds_flutter/datamodels/message.dart';
import 'package:say_oldbirds_flutter/services/messages_service.dart';
import 'package:stacked/stacked.dart';

class MessagesViewModel extends ReactiveViewModel {
  final _messagesServer = locator<MessagesService>();

  List<Message> get messages => _messagesServer.messages;

  @override
  List<ReactiveServiceMixin> get reactiveServices => [_messagesServer];

  initialise() async {
    await _messagesServer.getMessages();
  }
}
