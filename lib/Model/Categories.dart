// To parse this JSON data, do
//
//     final categories = categoriesFromJson(jsonString);

import 'dart:convert';

CategoriesModel categoriesFromJson(String str) => CategoriesModel.fromJson(json.decode(str));

String categoriesToJson(CategoriesModel data) => json.encode(data.toJson());

class CategoriesModel {
    CategoriesModel({
        this.dt,
    });

    List<Dt>? dt;

    factory CategoriesModel.fromJson(Map<String, dynamic> json) => CategoriesModel(
        dt: List<Dt>.from(json["dt"].map((x) => Dt.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "dt": List<dynamic>.from(dt!.map((x) => x.toJson())),
    };
}

class Dt {
    Dt({
        this.id,
        this.category,
        this.img,
        this.v,
    });

    String? id;
    String? category;
    String? img;
    int? v;

    factory Dt.fromJson(Map<String, dynamic> json) => Dt(
        id: json["_id"],
        category: json["category"],
        img: json["img"],
        v: json["__v"],
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "category": category,
        "img": img,
        "__v": v,
    };
}
