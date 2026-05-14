
class UserModel {
  final int? userId;
  final String userName;
  final String password;


UserModel({
  this.userId,
  required this.userName,
  required this.password,
});

Map<String, dynamic> toMap(){
  return {
    'UserID': userId,
    'UserName': userName,
    'Password': password,
  };
}
factory UserModel.fromMap(Map<String, dynamic> map){
  return UserModel(
   userId: map['UserID'],
   userName: map['UserName'],
   password: map['Password']
     
       );
   }

}