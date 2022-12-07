// To parse this JSON data, do
//
//     final userDetails = userDetailsFromJson(jsonString);

import 'dart:convert';

UserDetails userDetailsFromJson(String str) => UserDetails.fromJson(json.decode(str));

String userDetailsToJson(UserDetails data) => json.encode(data.toJson());

class UserDetails {
    UserDetails({
        this.image,
        this.name,
        this.isGroup,
        this.updateAt,
        this.message,
    });

    String? image;
    String?name;
    bool? isGroup;
    String? updateAt;
    String? message;

    factory UserDetails.fromJson(Map<String, dynamic> json) => UserDetails(
        image: json["image"],
        name: json["name"],
        isGroup: json["IsGroup"],
        updateAt: json["updateAt"],
        message: json["message"],
    );

    Map<String, dynamic> toJson() => {
        "image": image,
        "name": name,
        "IsGroup": isGroup,
        "updateAt": updateAt,
        "message": message,
    };
}
