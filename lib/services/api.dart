import 'dart:convert';
import 'package:injectable/injectable.dart';
import 'package:http/http.dart' as http;
import 'package:say_oldbirds_flutter/datamodels/message.dart';
import 'package:say_oldbirds_flutter/datamodels/response.dart';

@lazySingleton
class Api {
  static const endPoint = 'https://say-oldbirds.herokuapp.com/api';

  var client = http.Client();

  Future<Response<Messages>> getMessages() async {
    final response = await client.get('$endPoint/');
    Map result = json.decode(response.body);
    return Response<Messages>.fromJson(result, parse: (data) => Messages.fromJson(data));
  }

  Future<Response<Message>> uploadMessage({String name, String body}) async {
    final response = await client.post('$endPoint/create', body: {
      'name': name,
      'body': body,
    });
    Map result = json.decode(response.body);
    return Response<Message>.fromJson(result, parse: (data) => Message.fromJson(data));
  }
}
