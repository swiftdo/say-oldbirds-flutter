import 'package:injectable/injectable.dart';
import 'package:say_oldbirds_flutter/app/locator.dart';
import 'package:say_oldbirds_flutter/datamodels/message.dart';
import 'api.dart';

@lazySingleton
class MessagesService {
  final _api = locator<Api>();

  Messages _messages;
  Messages get messages => _messages;

  Future<Messages> getMessages() async {
    final response = await _api.getMessages();
    _messages = response.data;
    return _messages;
  }
}
