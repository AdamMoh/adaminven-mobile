// To parse this JSON data, do
//
//     final items = itemsFromJson(jsonString);

import 'dart:convert';

List<Items> itemsFromJson(String str) =>
    List<Items>.from(json.decode(str).map((x) => Items.fromJson(x)));

String itemsToJson(List<Items> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Items {
  String model;
  int pk;
  Fields fields;

  Items({
    required this.model,
    required this.pk,
    required this.fields,
  });

  factory Items.fromJson(Map<String, dynamic> json) => Items(
        model: json["model"],
        pk: json["pk"],
        fields: Fields.fromJson(json["fields"]),
      );

  Map<String, dynamic> toJson() => {
        "model": model,
        "pk": pk,
        "fields": fields.toJson(),
      };
}

class Fields {
  int user;
  String name;
  int amount;
  String price;
  String category;
  String description;
  DateTime dateAdded;

  Fields({
    required this.user,
    required this.name,
    required this.amount,
    required this.price,
    required this.category,
    required this.description,
    required this.dateAdded,
  });

  factory Fields.fromJson(Map<String, dynamic> json) => Fields(
        user: json["user"],
        name: json["name"],
        amount: json["amount"],
        price: json["price"],
        category: json["category"],
        description: json["description"],
        dateAdded: DateTime.parse(json["date_added"]),
      );

  Map<String, dynamic> toJson() => {
        "user": user,
        "name": name,
        "amount": amount,
        "price": price,
        "category": category,
        "description": description,
        "date_added": dateAdded.toIso8601String(),
      };
}
