
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:money_manga/ui/widgets/common/shqs_progress.dart';
import 'dart:html' as html;

import 'package:money_manga/utils/logger.dart';

/// Login class for Devices (Not flutter-web)
///
/// Do not call this class and methods directly.
/// Use wrapper class [GeaOauth2]
class Login {

  final String url;
  final Function(bool isSuccess, dynamic message) callback;

  Login({
    required this.url,
    required this.callback,
  });

  html.WindowBase? _loginPopup;

  Future<Widget> login() async {

    InviaLog.i(tag: 'Login (Web)', message: '> login');

    html.window.onMessage.listen((event) {

      final params = Uri.parse(event.data.toString()).queryParameters;

      if (params['code'] == null) {
        InviaLog.w(tag: 'Login', message: 'code: null - error');
        callback(false, 'error');
      } else {
        InviaLog.d(tag: 'Login', message: "code: ${params['code']}");
        callback(true, params['code']);
      }

      _loginPopup?.close();
      _loginPopup = null;
    });

    WidgetsBinding.instance?.addPostFrameCallback((_) {

      // final testUri = twitchOAuthUrl();
      // _loginPopup = html.window.open(testUri, 'loginPopup', 'location=no,status=no');

      // ignore: unsafe_html
      _loginPopup = html.window.open(url.toString(), 'loginPopup', 'location=no,status=no');
      _checkPopupState();
    });

    return ShqsCircularProgress();
  }

  void _checkPopupState() {

    Timer(Duration(seconds: 1), () {

      if (_loginPopup?.closed == null ) {
        // Already sent event. Do nothing.
      } else if (_loginPopup?.closed == true) {
        // User close popup. Send false event
        callback(false, 'user close popup');
      } else {
        _checkPopupState();
      }
    });
  }
}