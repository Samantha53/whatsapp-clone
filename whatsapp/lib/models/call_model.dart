// To parse this JSON data, do
//
//     final callDetails = callDetailsFromJson(jsonString);

import 'dart:convert';

CallDetails callDetailsFromJson(String str) => CallDetails.fromJson(json.decode(str));

String callDetailsToJson(CallDetails data) => json.encode(data.toJson());

class CallDetails {
    CallDetails({
        this.image,
        this.name,
        this.isIncoming,
        this.updateAt,
        this.isVoice,
        this.isGroup,
    });

    String? image;
    String? name;
    bool? isIncoming;
    String? updateAt;
    bool? isVoice;
    bool? isGroup;

    factory CallDetails.fromJson(Map<String, dynamic> json) => CallDetails(
        image: json["image"],
        name: json["name"],
        isIncoming: json["IsIncoming"],
        updateAt: json["updateAt"],
        isVoice: json["IsVoice"],
        isGroup: json["IsGroup"],
    );

    Map<String, dynamic> toJson() => {
        "image": image,
        "name": name,
        "IsIncoming": isIncoming,
        "updateAt": updateAt,
        "IsVoice": isVoice,
        "IsGroup": isGroup,
    };
}
