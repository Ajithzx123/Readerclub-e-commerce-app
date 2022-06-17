// To parse this JSON data, do
//
//     final offerBanner = offerBannerFromJson(jsonString);

import 'dart:convert';

OfferBanner offerBannerFromJson(String str) => OfferBanner.fromJson(json.decode(str));

String offerBannerToJson(OfferBanner data) => json.encode(data.toJson());

class OfferBanner {
    OfferBanner({
         this.dt,
    });

    List<Dt>? dt;

    factory OfferBanner.fromJson(Map<String, dynamic> json) => OfferBanner(
        dt: List<Dt>.from(json["dt"].map((x) => Dt.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "dt": List<dynamic>.from(dt!.map((x) => x.toJson())),
    };
}

class Dt {
    Dt({
        this.id,
        this.title,
        this.description,
        this.offerDescription,
        this.offerCode,
        this.img,
        this.bg,
        this.createdAt,
        this.updatedAt,
        this.v,
        this.discount,
    });

    String? id;
    String? title;
    String? description;
    String? offerDescription;
    String? offerCode;
    String? img;
    String? bg;
    DateTime? createdAt;
    DateTime ?updatedAt;
    int? v;
    double? discount;

    factory Dt.fromJson(Map<String, dynamic> json) => Dt(
        id: json["_id"],
        title: json["title"],
        description: json["description"],
        offerDescription: json["offerDescription"],
        offerCode: json["offerCode"],
        img: json["img"],
        bg: json["bg"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        v: json["__v"],
        discount: json["discount"].toDouble(),
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "title": title,
        "description": description,
        "offerDescription": offerDescription,
        "offerCode": offerCode,
        "img": img,
        "bg": bg,
        "createdAt": createdAt!.toIso8601String(),
        "updatedAt": updatedAt!.toIso8601String(),
        "__v": v,
        "discount": discount,
    };
}
