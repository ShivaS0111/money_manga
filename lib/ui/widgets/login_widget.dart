
import 'package:flutter/cupertino.dart';
import 'package:money_manga/config/network_constants.dart';
import 'package:money_manga/ui/pages/login/action/gea_oauth2.dart';

import 'common/shqs_progress.dart';

class LoginWidget extends StatelessWidget {

  final Function(bool isSuccess, dynamic message) callback;
  final bool isCommonUser;
  final bool isProduction;

  LoginWidget({
    Key? key,
    this.isProduction = false,
    required this.isCommonUser,
    required this.callback,
  }): super(key: key);

  @override
  Widget build(BuildContext context) {


    // Future<Widget> loginWidget = GeaOauth2(
    //     oauthEnd: oauthEnd(isProduction: isProduction),
    //     clientId: clientId(isProduction: isProduction),
    //     clientSecret: clientSecret(isProduction: isProduction),
    //     responseType: 'code',
    //     redirectUri: redirectUri(isProduction: isProduction),
    //     scope: 'openid',
    //     params: _buildParams(),
    //     callback: callback).login();

    return FutureBuilder(
        future: GeaOauth2(
            oauthEnd: oauthEnd(isProduction: isProduction),
            clientId: clientId(isProduction: isProduction),
            clientSecret: clientSecret(isProduction: isProduction),
            responseType: 'code',
            redirectUri: redirectUri(isProduction: isProduction),
            scope: 'openid',
            params: _buildParams(),
            callback: callback).login(),
        initialData: ShqsCircularProgress(),
        builder: (_, snapshot) {
          if (snapshot.data != null) {
            return snapshot.data as Widget;
          }

          return ShqsCircularProgress();
        });

    // return Center(
    //   child: SleekCircularSlider(
    //     appearance: CircularSliderAppearance(
    //         spinnerMode: true,
    //         size: 300.0,
    //         customWidths: CustomSliderWidths(progressBarWidth: 5.0),
    //         customColors: CustomSliderColors(
    //             dotColor: Colors.transparent,
    //             trackColor: Colors.transparent,
    //             progressBarColors: progress_bar_colors
    //         )
    //     ),
    //   ),
    // );
  }

  Map<String, dynamic> _buildParams() {

    final params = <String, dynamic>{};
    params.putIfAbsent('sso', () => isCommonUser.toString());
    if (!isProduction) {
      params.putIfAbsent('state', () => 'test');
    }

    return params;
  }
}