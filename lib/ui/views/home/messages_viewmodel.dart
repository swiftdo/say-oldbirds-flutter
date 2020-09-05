import 'package:say_oldbirds_flutter/app/locator.dart';
import 'package:say_oldbirds_flutter/datamodels/message.dart';
import 'package:say_oldbirds_flutter/services/messages_service.dart';
import 'package:stacked/stacked.dart';

class MessagesViewModel extends FutureViewModel<List<Message>> {
  final _messagesServer = locator<MessagesService>();

  List<Message> get messages => _messagesServer.messages;

  @override
  Future<List<Message>> futureToRun() async {
    var response = await _messagesServer.getMessages();
    return response.data.messages;
  }

  @override
  List<ReactiveServiceMixin> get reactiveServices => [_messagesServer];
}
