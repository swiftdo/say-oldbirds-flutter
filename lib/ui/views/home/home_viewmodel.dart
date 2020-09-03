import 'package:say_oldbirds_flutter/app/locator.dart';
import 'package:say_oldbirds_flutter/datamodels/message.dart';
import 'package:say_oldbirds_flutter/datamodels/response.dart';
import 'package:say_oldbirds_flutter/services/messages_service.dart';
import 'package:stacked/stacked.dart';

class HomeViewModel extends FutureViewModel<Response<Messages>> {
  final _messagesServer = locator<MessagesService>();

  @override
  Future<Response<Messages>> futureToRun() {
    return _messagesServer.getMessages();
  }
}
