import 'package:injectable/injectable.dart';
import 'package:say_oldbirds_flutter/app/locator.dart';
import 'package:say_oldbirds_flutter/datamodels/message.dart';
import 'package:say_oldbirds_flutter/datamodels/response.dart';
import 'package:stacked/stacked.dart';
import 'api.dart';
import 'package:observable_ish/observable_ish.dart';

/// 可以达到数据共享
@lazySingleton
class MessagesService with ReactiveServiceMixin {
  final _api = locator<Api>();

  RxValue<List<Message>> _messages = RxValue<List<Message>>(initial: []);
  List<Message> get messages => _messages.value;

  MessagesService() {
    listenToReactiveValues([_messages]);
  }

  getMessages() async {
    final response = await _api.getMessages();
    _messages.value = response.data.messages;
  }

  addMessage({String name, String message}) async {
    final response = await _api.addMessage(name: name, body: message);
    List<Message> mes = List.from(messages);
    mes.insert(0, response.data);
    _messages.value = mes; // 只有这样才会触发
  }
}
