// To parse this JSON data, do
//
//     final membershipCategories = membershipCategoriesFromJson(jsonString);

import 'dart:convert';

MembershipCategories membershipCategoriesFromJson(String str) => MembershipCategories.fromJson(json.decode(str));

String membershipCategoriesToJson(MembershipCategories data) => json.encode(data.toJson());

class MembershipCategories {
    MembershipCategories({
        required this.id,
        required this.category,
        required this.price,
        required this.duration,
    });

    int id;
    String category;
    int price;
    int duration;

    factory MembershipCategories.fromJson(Map<String, dynamic> json) => MembershipCategories(
        id: json["id"],
        category: json["category"],
        price: json["price"],
        duration: json["duration"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "category": category,
        "price": price,
        "duration": duration,
    };
}
