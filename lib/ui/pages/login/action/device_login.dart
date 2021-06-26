import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:money_manga/config/environment.dart';
import 'package:money_manga/config/network_constants.dart';
import 'package:money_manga/utils/logger.dart';
import 'package:webview_flutter/webview_flutter.dart';


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

  Future<Widget> login() async {

    InviaLog.i(tag: 'Login', message: '> platform: $defaultTargetPlatform');
    switch (defaultTargetPlatform) {
      case TargetPlatform.iOS:
      case TargetPlatform.android:
      // TODO Mobile devices Use Webview

        return WebView(
          initialUrl: url,
          javascriptMode: JavascriptMode.unrestricted,
          onProgress: (value) {
            InviaLog.d(tag: 'Login', message: 'WebView onProgress: $value');
          },
          onPageFinished: (address) {
            InviaLog.d(tag: 'Login', message: 'WebView onPageFinished: $address');

            if (address.startsWith(redirectUri(isProduction: Environment.instance.isProduction))) {
              final params = Uri.parse(address).queryParameters;

              if (params['code'] == null) {
                InviaLog.w(tag: 'Login', message: 'code: null - error');
                callback(false, 'error');
              } else {
                InviaLog.d(tag: 'Login', message: "code: ${params['code']}");
                callback(true, params['code']);
              }
            } else {
              // TODO Need to figure out error page
            }
          },
        );
        break;
      case TargetPlatform.windows:
      case TargetPlatform.macOS:
      // TODO Desktop devices. Use MethodChannel.
      // No Official Webview for Desktop.
        break;
      default:
        InviaLog.w(tag: 'Login', message: 'Not supported platform - $defaultTargetPlatform');
    }

    return Container();
  }
}