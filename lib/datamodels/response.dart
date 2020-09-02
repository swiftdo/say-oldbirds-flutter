import 'package:auto_route/auto_route.dart';

class Response<T> {
  int code;
  String message;
  T data;

  Response.fromJson(Map json, {@required T Function(dynamic) parse})
      : code = json['code'],
        message = json['message'],
        data = parse(json['data']);
}
