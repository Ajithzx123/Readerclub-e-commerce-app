// To parse this JSON data, do
//
//     final addressModel = addressModelFromJson(jsonString);

import 'dart:convert';

AddressModel addressModelFromJson(String str) => AddressModel.fromJson(json.decode(str));

String addressModelToJson(AddressModel data) => json.encode(data.toJson());

class AddressModel {
    AddressModel({
        this.dt,
    });

    List<AddressDetails> ?dt;

    factory AddressModel.fromJson(Map<String, dynamic> json) => AddressModel(
        dt: List<AddressDetails>.from(json["dt"].map((x) => AddressDetails.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "dt": List<dynamic>.from(dt!.map((x) => x.toJson())),
    };
}

class AddressDetails {
    AddressDetails({
        this.id,
        this.userId,
        this.fullAddress,
        this.pincode,
        this.landmark,
        this.createdAt,
        this.updatedAt,
        this.v,
    });

    String? id;
    String? userId;
    String ?fullAddress;
    int ?pincode;
    String? landmark;
    DateTime? createdAt;
    DateTime ?updatedAt;
    int ?v;

    factory AddressDetails.fromJson(Map<String, dynamic> json) => AddressDetails(
        id: json["_id"],
        userId: json["userId"],
        fullAddress: json["fullAddress"],
        pincode: json["pincode"],
        landmark: json["landmark"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        v: json["__v"],
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "userId": userId,
        "fullAddress": fullAddress,
        "pincode": pincode,
        "landmark": landmark,
        "createdAt": createdAt!.toIso8601String(),
        "updatedAt": updatedAt!.toIso8601String(),
        "__v": v,
    };
}
