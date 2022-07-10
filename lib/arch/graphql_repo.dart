import 'package:aoba/services/services.dart';
import 'package:flutter/material.dart';

class GraphqlRepo {
  final _credentials = get<Credentials>();

  @protected
  String? get accessToken => _credentials.accessToken;
}
