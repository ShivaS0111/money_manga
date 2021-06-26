
import 'package:flutter/material.dart';

import './device_login.dart'
if (dart.library.html) './web_login.dart' as login_action;

/// Build URL and call [Login.login]
///
/// Don't call [web_login] or [device_login] methods directly.
class GeaOauth2 {

  final String oauthEnd;
  final String clientId;
  final String clientSecret;
  final String responseType;
  final String redirectUri;
  final String scope;
  late Map<String, dynamic> params;
  final Function(bool isSuccess, dynamic message) callback;

  GeaOauth2({
    required this.oauthEnd,
    required this.clientId,
    required this.clientSecret,
    required this.responseType,
    required this.redirectUri,
    required this.scope,
    Map<String, dynamic> params = const {},
    required this.callback,
  }) {
    this.params = params;

    var sb = StringBuffer()
      ..write(oauthEnd)
      ..write('?client_id=$clientId')
      ..write('&response_type=$responseType')
      ..write('&redirect_uri=$redirectUri')
      ..write('&scope=$scope');

    for (var entry in params.entries) {
      sb.write('&${entry.key}=${entry.value}');
    }

    _url = sb.toString();

    _login = login_action.Login(
        url: _url,
        callback: callback
    );
  }

  late String _url;
  String get url => _url;

  late login_action.Login _login;

  Future<Widget> login() async {
    return await _login.login();
  }
}