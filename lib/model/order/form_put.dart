// To parse this JSON data, do
//
//     final formOrderPut = formOrderPutFromJson(jsonString);

import 'dart:convert';

FormOrderPut formOrderPutFromJson(String str) => FormOrderPut.fromJson(json.decode(str));

String formOrderPutToJson(FormOrderPut data) => json.encode(data.toJson());

class FormOrderPut {
    String status;

    FormOrderPut({
        required this.status,
    });

    factory FormOrderPut.fromJson(Map<String, dynamic> json) => FormOrderPut(
        status: json["status"],
    );

    Map<String, dynamic> toJson() => {
        "status": status,
    };
}
