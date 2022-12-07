// To parse this JSON data, do
//
//     final statusDetails = statusDetailsFromJson(jsonString);

import 'dart:convert';

StatusDetails statusDetailsFromJson(String str) => StatusDetails.fromJson(json.decode(str));

String statusDetailsToJson(StatusDetails data) => json.encode(data.toJson());

class StatusDetails {
    StatusDetails({
        this.image,
        this.name,
        this.updateAt,
        this.isStatus,
    });

    String?image;
    String? name;
    String? updateAt;
    bool? isStatus;

    factory StatusDetails.fromJson(Map<String, dynamic> json) => StatusDetails(
        image: json["image"],
        name: json["name"],
        updateAt: json["updateAt"],
        isStatus: json["IsStatus"],
    );

    Map<String, dynamic> toJson() => {
        "image": image,
        "name": name,
        "updateAt": updateAt,
        "IsStatus": isStatus,
    };
}
