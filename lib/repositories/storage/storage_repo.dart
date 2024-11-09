abstract class StorageRepo{
  Future setEmail(String email);
  Future setPassword(String password);
  Future<String> getEmail();
  Future<String> getPassword();
  Future clearSession();
  Future<String> getUid();
  Future setUid(String uid);
  Future setGender(int gender);
  Future<int> getGender();
}