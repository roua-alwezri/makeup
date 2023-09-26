import 'dart:convert';

class MakeupModel {
  int id;
  String brand;
  String name;
  String price;
  String? priceSign;
  String? currency;
  String imageLink;
  String productLink;
  String websiteLink;
  String description;
  String rating;
  String? category;
  String productType;
  List<dynamic> tagList;
  String createdAt;
  String updatedAt;
  String productApiUrl;
  String apiFeaturedImage;

  MakeupModel({
    required this.id,
    required this.brand,
    required this.name,
    required this.price,
    this.priceSign,
    this.currency,
    required this.imageLink,
    required this.productLink,
    required this.websiteLink,
    required this.description,
    required this.rating,
    this.category,
    required this.productType,
    required this.tagList,
    required this.createdAt,
    required this.updatedAt,
    required this.productApiUrl,
    required this.apiFeaturedImage,
  });

  factory MakeupModel.fromRawJson(String str) =>
      MakeupModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory MakeupModel.fromJson(Map<String, dynamic> json) => MakeupModel(
        id: json["id"],
        brand: json["brand"],
        name: json["name"],
        price: json["price"],
        priceSign: json["price_sign"],
        currency: json["currency"],
        imageLink: json["image_link"],
        productLink: json["product_link"],
        websiteLink: json["website_link"],
        description: json["description"],
        rating: json["rating"].toString(),
        category: json["category"],
        productType: json["product_type"],
        tagList: List<dynamic>.from(json["tag_list"].map((x) => x)),
        createdAt: json["created_at"],
        updatedAt: json["updated_at"],
        productApiUrl: json["product_api_url"],
        apiFeaturedImage: json["api_featured_image"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "brand": brand,
        "name": name,
        "price": price,
        "price_sign": priceSign,
        "currency": currency,
        "image_link": imageLink,
        "product_link": productLink,
        "website_link": websiteLink,
        "description": description,
        "rating": rating.toString(),
        "category": category,
        "product_type": productType,
        "tag_list": List<dynamic>.from(tagList.map((x) => x)),
        "created_at": createdAt,
        "updated_at": updatedAt,
        "product_api_url": productApiUrl,
        "api_featured_image": apiFeaturedImage
      };
}
