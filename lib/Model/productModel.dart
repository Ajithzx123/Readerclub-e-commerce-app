// To parse this JSON data, do
//
//     final productsModel = productsModelFromJson(jsonString);

import 'dart:convert';

ProductsModel productsModelFromJson(String str) => ProductsModel.fromJson(json.decode(str));

String productsModelToJson(ProductsModel data) => json.encode(data.toJson());

class ProductsModel {
    ProductsModel({
        this.dt,
    });

    List<Details>? dt;

    factory ProductsModel.fromJson(Map<String, dynamic> json) => ProductsModel(
        dt: List<Details>.from(json["dt"].map((x) => Details.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "dt": List<dynamic>.from(dt!.map((x) => x.toJson())),
    };
}

class Details {
    Details({
        this.id,
        this.title,
        this.description,
        this.author,
        this.publisher,
        this.publishedAt,
        this.img,
        this.categories,
        this.chapters,
        this.price,
        this.offers,
        this.inStock,
        this.createdAt,
        this.updatedAt,
        this.v,
    });

    String? id;
    String? title;
    String? description;
    String? author;
    String? publisher;
    DateTime? publishedAt;
    String? img;
    List<String>? categories;
    List<String> ?chapters;
    int? price;
    String? offers;
    bool ?inStock;
    DateTime? createdAt;
    DateTime ?updatedAt;
    int ?v;

    factory Details.fromJson(Map<String, dynamic> json) => Details(
        id: json["_id"],
        title: json["title"],
        description: json["description"],
        author: json["author"],
        publisher: json["publisher"],
        publishedAt: DateTime.parse(json["publishedAt"]),
        img: json["img"],
        categories: List<String>.from(json["categories"].map((x) => x)),
        chapters: List<String>.from(json["chapters"].map((x) => x)),
        price: json["price"],
        offers: json["offers"],
        inStock: json["inStock"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        v: json["__v"],
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "title": title,
        "description": description,
        "author": author,
        "publisher": publisher,
        "publishedAt": publishedAt!.toIso8601String(),
        "img": img,
        "categories": List<dynamic>.from(categories!.map((x) => x)),
        "chapters": List<dynamic>.from(chapters!.map((x) => x)),
        "price": price,
        "offers": offers,
        "inStock": inStock,
        "createdAt": createdAt!.toIso8601String(),
        "updatedAt": updatedAt!.toIso8601String(),
        "__v": v,
    };
}
