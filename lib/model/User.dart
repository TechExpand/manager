
import 'package:meta/meta.dart';

class UserField {
  static final String lastMessageTime = 'lastMessageTime';
}

class User {
  final String id;
  final String name;
  final String urlAvatar;
  final String email;


  const User({
    @required this.name,
    @required this.id,
    @required this.urlAvatar,
    @required this.email,
  });

  User.fromMap(Map snapshot,String id) :
        id = id ?? '',
        name = snapshot['name'] ?? '',
        email = snapshot['email'] ?? '',
        urlAvatar = snapshot['urlAvatar'] ?? '';


  Map<String, dynamic> toJson() => {
    'name': name,
    'email': email,
    'urlAvatar': urlAvatar,
    'id': id,
  };
        }


