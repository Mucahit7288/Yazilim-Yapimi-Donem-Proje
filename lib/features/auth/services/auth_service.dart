import '../../../core/database/database_helper.dart';
import '../models/user_model.dart';

class AuthService {
Future<int> register(UserModel user) async{
 final db = await DatabaseHelper.instance.database;

 final existingUser = await db.query(
  'Users',
  where: 'UserName = ?',
  whereArgs : [user.userName],
   );
  if (existingUser.isNotEmpty) {
     throw Exception('Bu kullanıcı adı kayıtlı');
  }
  return await db.insert('Users', user.toMap());

}

Future<UserModel?> login(String username, String password) async {
   final db = await DatabaseHelper.instance.database;

   final result = await db.query(
    'Users',
    where : 'UserName = ? AND Password = ? ',
    whereArgs : [username, password],
   );
   if (result.isNotEmpty) {
    return UserModel.fromMap(result.first);
   } 
    return null;
}
Future<bool> resetPassword(String username, String newPassword) async {
  final db = await DatabaseHelper.instance.database;
  final count = await db.update(
    'Users',
    {'Password': newPassword},
    where: 'UserName = ?',
    whereArgs: [username],
  );
  return count > 0;
}



























}