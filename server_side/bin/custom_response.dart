import 'dart:convert';

import 'package:shelf/shelf.dart';

class CustomResponse<T> extends Response {
  CustomResponse({required int statusCode, this.message, this.data})
      : super(
          statusCode,
          body: jsonEncode({'message': message, 'data': data}),
          headers: {'content-type': 'application/json; charset=utf-8'},
        );
  final String? message;
  final T? data;
}