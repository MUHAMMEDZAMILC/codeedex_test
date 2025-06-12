// To parse this JSON data, do
//
//     final product = productFromJson(jsonString);

import 'dart:convert';

Product productFromJson(String str) => Product.fromJson(json.decode(str));

String productToJson(Product data) => json.encode(data.toJson());

class Product {
    String? status;
    String? message;
    List<ProductElement>? products;

    Product({
        this.status,
        this.message,
        this.products,
    });

    factory Product.fromJson(Map<String, dynamic> json) => Product(
        status: json["status"],
        message: json["message"],
        products: json["products"] == null ? [] : List<ProductElement>.from(json["products"]!.map((x) => ProductElement.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "products": products == null ? [] : List<dynamic>.from(products!.map((x) => x.toJson())),
    };
}

class ProductElement {
    int? id;
    String? title;
    String? image;
    int? price;
    String? description;
    String? brand;
    String? model;
    String? color;
    Category? category;
    int? discount;
    bool? onSale;
    bool? popular;

    ProductElement({
        this.id,
        this.title,
        this.image,
        this.price,
        this.description,
        this.brand,
        this.model,
        this.color,
        this.category,
        this.discount,
        this.onSale,
        this.popular,
    });

    factory ProductElement.fromJson(Map<String, dynamic> json) => ProductElement(
        id: json["id"],
        title: json["title"],
        image: json["image"],
        price: json["price"],
        description: json["description"],
        brand: json["brand"],
        model: json["model"],
        color: json["color"],
        category: categoryValues.map[json["category"]]!,
        discount: json["discount"],
        onSale: json["onSale"],
        popular: json["popular"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "image": image,
        "price": price,
        "description": description,
        "brand": brand,
        "model": model,
        "color": color,
        "category": categoryValues.reverse[category],
        "discount": discount,
        "onSale": onSale,
        "popular": popular,
    };
}

enum Category {
    MOBILE
}

final categoryValues = EnumValues({
    "mobile": Category.MOBILE
});

class EnumValues<T> {
    Map<String, T> map;
    late Map<T, String> reverseMap;

    EnumValues(this.map);

    Map<T, String> get reverse {
            reverseMap = map.map((k, v) => MapEntry(v, k));
            return reverseMap;
    }
}
