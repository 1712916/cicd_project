import 'dart:io';

import 'package:dbcrypt/dbcrypt.dart';
import 'package:postgres/postgres.dart';
import 'package:shelf/shelf.dart';
import 'package:shelf/shelf_io.dart';
import 'package:shelf_router/shelf_router.dart';

import 'data/mock_data/mock_data.dart';
import 'handlers/handler_center.dart';
import 'routers/router_center.dart';

const _hostname = 'localhost';
String secretKey = 'kieuPhong';
late PostgreSQLConnection connection;
void main(List<String> args) async {

  connection = PostgreSQLConnection(
    "john.db.elephantsql.com",
    5432,
    "ecsdzzeq",
    username: "ecsdzzeq",
    password: "cnbS_dQMOjQJX4eG9Yzc1PT5mhvFrGAR",

  );
  await connection.open();
  print('LOl: ${connection.databaseName}');
  // Configure routes.
  final _router = RouterCenter.router;
  HandlerCenter.registerToRouter();
  // Use any available host or container IP (usually `0.0.0.0`).
  final ip = _hostname; // InternetAddress.anyIPv4;

  // Configure a pipeline that logs requests.
  final _handler = Pipeline().addMiddleware(logRequests()).addHandler(_router);

  // For running in containers, we respect the PORT environment variable.
  final port = int.parse('1599');
  // final port = int.parse(Platform.environment['PORT'] ?? '8080');
  final server = await serve(_handler, ip, port);
  print('Server listening on port ${server.port}');
}
