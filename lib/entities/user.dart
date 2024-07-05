import 'dart:convert';

User userFromJson(String str) => User.fromJson(json.decode(str));

String userToJson(User data) => json.encode(data.toJson());

class User {
  String message;
  Data data;

  User({
    required this.message,
    required this.data,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
        message: json["message"],
        data: Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "message": message,
        "data": data.toJson(),
      };
}

class Data {
  String username;
  String phoneNumber;
  String id;
  int v;

  Data({
    required this.username,
    required this.phoneNumber,
    required this.id,
    required this.v,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        username: json["username"],
        phoneNumber: json["phoneNumber"],
        id: json["_id"],
        v: json["__v"],
      );

  Map<String, dynamic> toJson() => {
        "username": username,
        "phoneNumber": phoneNumber,
        "_id": id,
        "__v": v,
      };
}
