import 'package:shared_preferences/shared_preferences.dart';

class Cache {
  late SharedPreferences prefs;
  late String userToken;

  _() {
    SharedPreferences.getInstance().then((val) {
      prefs = val;
      userToken = prefs.getString("USER_TOKEN")!;
    });
  }

  static Cache? _instance;
  static Cache get instance => _instance!;
  factory Cache() => _instance = Cache()._();

  saveUserToken(String userToken) async {
    prefs.setString("USER_TOKEN", userToken);
    userToken = userToken;
  }

}
