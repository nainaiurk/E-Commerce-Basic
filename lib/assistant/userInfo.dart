// ignore_for_file: file_names, unnecessary_this
import 'package:shared_preferences/shared_preferences.dart';

class UserInfo{
  final String userName = 'username';
  final String email ='email';

  Future<void> saveLoginDataToSharedPreference(String userName,String email)async{
    final SharedPreferences preference = await SharedPreferences.getInstance();
    preference.setString(this.email, email);
    preference.setString(this.userName, userName);
  }

  Future<void> saveEmailToSharedPreference(String email)async{
    final SharedPreferences preference = await SharedPreferences.getInstance();
    preference.setString(this.email, email);
  }

  Future<void> deleteLoginDataToSharedPreference()async{
    final SharedPreferences preference = await SharedPreferences.getInstance();
    preference.clear();
  }

  Future<String?> getName()async{
    final SharedPreferences pref = await SharedPreferences.getInstance();
    return pref.getString(this.userName);
  }
  Future<String?> getEmail()async{
    final SharedPreferences pref = await SharedPreferences.getInstance();
    String? userEmail;
    userEmail = pref.getString(this.email);
    return userEmail;
  }
}