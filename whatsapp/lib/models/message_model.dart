// To parse this JSON data, do
//
//     final messages = messagesFromJson(jsonString);

import 'dart:convert';

Messages messagesFromJson(String str) => Messages.fromJson(json.decode(str));

String messagesToJson(Messages data) => json.encode(data.toJson());

class Messages {
    Messages({
        this.isSend,
        this.isReaded,
        this.message,
        this.sendAt,
    });

    bool? isSend;
    bool? isReaded;
    String? message;
    String? sendAt;

    factory Messages.fromJson(Map<String, dynamic> json) => Messages(
        isSend: json["isSend"],
        isReaded: json["isReaded"],
        message: json["message"],
        sendAt: json["sendAt"],
    );

    Map<String, dynamic> toJson() => {
        "isSend": isSend,
        "isReaded": isReaded,
        "message": message,
        "sendAt": sendAt,
    };
}
