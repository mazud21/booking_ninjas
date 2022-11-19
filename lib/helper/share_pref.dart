
import 'package:shared_preferences/shared_preferences.dart';

class SharePref{

  static final BASE_URL = '';

  static Future<void> setBaseUrl(String baseUrl) async {
    final sharePref = await SharedPreferences.getInstance();
    sharePref.setString(BASE_URL, baseUrl);
  }

  Future<String> getBaseUrl() async{
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(BASE_URL);
  }


}