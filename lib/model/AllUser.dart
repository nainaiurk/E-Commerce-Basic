// To parse this JSON data, do
//
//     final allUserList = allUserListFromJson(jsonString);

// ignore_for_file: file_names, prefer_if_null_operators, unnecessary_null_comparison, constant_identifier_names, duplicate_ignore, prefer_conditional_assignment, unnecessary_new

import 'dart:convert';

List<AllUserList> allUserListFromJson(String str) => List<AllUserList>.from(json.decode(str).map((x) => AllUserList.fromJson(x)));

String allUserListToJson(List<AllUserList> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class AllUserList {
    AllUserList({
        required this.id,
        required this.name,
        required this.phone,
        required this.password,
        required this.profileimage,
        required this.email,
        required this.isActive,
        required this.isVerifide,
        required this.address,
        required this.type,
        required this.token,
    });

    int id;
    String name;
    String phone;
    String password;
    String profileimage;
    Email? email;
    int isActive;
    int isVerifide;
    String address;
    Type? type;
    String token;

    factory AllUserList.fromJson(Map<String, dynamic> json) => AllUserList(
        id: json["id"],
        name: json["name"],
        phone: json["phone"],
        password: json["password"],
        profileimage: json["profileimage"] == null ? null : json["profileimage"],
        email: json["email"] == null ? null : emailValues.map[json["email"]],
        isActive: json["is_active"],
        isVerifide: json["is_Verifide"],
        address: json["address"] == null ? null : json["address"],
        type: typeValues.map[json["type"]],
        token: json["token"] == null ? null : json["token"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "phone": phone,
        "password": password,
        "profileimage": profileimage == null ? null : profileimage,
        "email": email == null ? null : emailValues.reverse[email],
        "is_active": isActive,
        "is_Verifide": isVerifide,
        "address": address == null ? null : address,
        "type": typeValues.reverse[type],
        "token": token == null ? null : token,
    };
}

// ignore: constant_identifier_names
enum Email { EMPTY, SHORIFULISLAM234_GMAIL_COM, BA479222_GMAIL_COM }

final emailValues = EnumValues({
    "ba479222gmail.com": Email.BA479222_GMAIL_COM,
    "": Email.EMPTY,
    "shorifulislam234gmail.com": Email.SHORIFULISLAM234_GMAIL_COM
});

enum Type { USER, ADMIN }

final typeValues = EnumValues({
    "admin": Type.ADMIN,
    "user": Type.USER
});

class EnumValues<T> {
    late Map<String, T> map;
    late Map<T, String> reverseMap;

    EnumValues(this.map);

    Map<T, String> get reverse {
        if (reverseMap == null) {
            reverseMap = map.map((k, v) => new MapEntry(v, k));
        }
        return reverseMap;
    }
}
