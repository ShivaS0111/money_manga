
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:money_manga/config/environment.dart';
import 'package:money_manga/config/network_constants.dart';
import 'package:money_manga/config/resource_constants.dart';
import 'package:money_manga/config/theme_constants.dart';
import 'package:money_manga/ui/pages/model_input_page/model_number_input_page.dart';
import 'package:money_manga/ui/widgets/common/shqs_buttons.dart';
import 'package:money_manga/ui/widgets/common/shqs_text.dart';
import 'package:money_manga/ui/widgets/login_widget.dart';
import 'package:money_manga/utils/logger.dart';
import 'package:sleek_circular_slider/sleek_circular_slider.dart';
import 'package:url_launcher/url_launcher.dart';

class LoginPage extends StatefulWidget {

  static final name = '/login';

  @override
  State<StatefulWidget> createState() => _LoginState();
}

class _LoginState extends State<LoginPage> {

  LoginState _loginState = LoginState.before;

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: _body());
  }

  Widget _body() {

    if (_loginState == LoginState.before) {
      return Container(
        padding: EdgeInsets.symmetric(vertical: 30.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
                child: Center(
                    child: Hero(
                        tag: logo_path,
                        child: Image.asset(logo_path, width: 800,))
                )
            ),
            Text('Connect to the Field server', style: TextStyle(
                color: text_color_disabled,
                fontSize: 12
            ),),
            Text('Login options', style: Theme.of(context).textTheme.bodyText1),
            FittedBox(
              fit: BoxFit.contain,
              child: Container(
                margin: EdgeInsets.symmetric(vertical: 10.0),
                child: ShqsCommonButton(
                  // Legacy user
                    text: 'Non GEA Employee',
                    size: Size(200, 50),
                    onTap: () => _login(false)),
              ),
            ),
            FittedBox(
              fit: BoxFit.contain,
              child: Container(
                margin: EdgeInsets.symmetric(vertical: 10.0),
                child: ShqsCommonButton(
                  // GEA & Common user
                    text: 'Username & Password',
                    size: Size(200, 50),
                    onTap: () => _login(true)),
              ),
            ),

            Padding(
              padding: EdgeInsets.symmetric(vertical: 5.0),
              child: ClickableText(
                  prefix: 'Visit ',
                  prefixTextColor: text_color_disabled,
                  prefixTextSize: 12,
                  clickable: 'SmartHQ Service Website',
                  clickableTextColor: Colors.lightBlueAccent,
                  clickableTextSize: 14,
                  underline: true,
                  onTap: () => launch(
                    smart_hq_service_home,
                    forceSafariVC: false,
                    forceWebView: false,
                  )
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 5.0),
              child: ClickableText(
                  prefix: 'Order ',
                  prefixTextColor: text_color_disabled,
                  prefixTextSize: 12,
                  clickable: 'SmartHQ Service',
                  clickableTextColor: Colors.lightBlueAccent,
                  clickableTextSize: 14,
                  underline: true,
                  onTap: () => launch(
                    smart_hq_service_order,
                    forceSafariVC: false,
                    forceWebView: false,
                  )
              ),
            ),
          ],
        ),
      );
    } else if (_loginState == LoginState.done) {
      InviaLog.d(tag: 'Login', message: 'login success!!');
      // Login success.
      // TODO Next job and move to next page (Dashboard screen)

      return Center(
        child: SleekCircularSlider(
          appearance: CircularSliderAppearance(
              spinnerMode: true,
              size: 300.0,
              customWidths: CustomSliderWidths(progressBarWidth: 5.0),
              customColors: CustomSliderColors(
                  dotColor: Colors.transparent,
                  trackColor: Colors.transparent,
                  progressBarColors: progress_bar_colors
              )
          ),
        ),
      );
    } else {

      return LoginWidget(
          isProduction: Environment.instance.isProduction,
          isCommonUser: _loginState == LoginState.common_processing,
          callback: onAcquiredCode);
    }
  }

  void _login(bool isCommonUser) {

    setState(() {
      if (isCommonUser) {
        _loginState = LoginState.common_processing;
      } else {
        _loginState = LoginState.legacy_processing;
      }
    });
  }

  void onAcquiredCode(bool isSuccess, dynamic message) {

    setState(() {
      if (isSuccess) {
        _loginState = LoginState.done;

        InviaLog.d(tag: 'Login', message: 'success, code: $message');

        // TODO Request token with code
        Get.offNamed(ModelNumberInputPage.name);
      } else {
        _loginState = LoginState.before;

        // Failed
        InviaLog.w(tag: 'Login', message: 'failed, message: $message');
        CupertinoAlertDialog(
          content: Text(message.toString()),
        ).build(context);
      }
    });
  }
}

enum LoginState {

  before,
  legacy_processing,
  common_processing,
  done,
}