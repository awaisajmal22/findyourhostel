import 'package:findyourhostel/repositories/storage/storage_repo.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PrefStorageRepo implements StorageRepo{
  static const _email ='_email';
  static const _password = '_password';
  static const _uid = '_uid';
  @override
  Future<String> getEmail() async{
    SharedPreferences pref = await SharedPreferences.getInstance();
    String email = pref.getString(_email) ?? '';
   return email;
  }
  @override
  Future<String> getUid() async{
    SharedPreferences pref = await SharedPreferences.getInstance();
    String uid = pref.getString(_uid) ?? '';
   return uid;
  }

  @override
  Future<String> getPassword()async {
        SharedPreferences pref = await SharedPreferences.getInstance();
        String password = pref.getString(_password) ?? '';
return password;
  }

  @override
  Future setEmail(String email)async {
           SharedPreferences pref = await SharedPreferences.getInstance();
           pref.setString(_email, email);
  }
  @override
  Future setUid(String uid)async {
           SharedPreferences pref = await SharedPreferences.getInstance();
           pref.setString(_uid, uid);
  }

  @override
  Future setPassword(String password)async {
              SharedPreferences pref = await SharedPreferences.getInstance();
              pref.setString(_password, password);
  }
  
  @override
  Future clearSession()async {
                  SharedPreferences pref = await SharedPreferences.getInstance();
                  pref.setString(_email, '');
                  pref.setString(_password, '');
  }
}