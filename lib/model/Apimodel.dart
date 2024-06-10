class usermodeldata {
  int? id;
  String? title;
  double? price;
  String? description;
  String? category;
  String? image;
  Rating? rating;

  usermodeldata(
      {this.id,
      this.title,
      this.price,
      this.description,
      this.category,
      this.image,
      this.rating});

  usermodeldata.fromJson(Map<String, dynamic> json)
      : id = (json['id'] ?? 0).toInt(),
        title = json['title'] ?? "",
        price = (json['price'] ?? 0.0).toDouble(),
        description = json['description'] ?? "",
        category = json['category'] ?? "",
        image = json['image'] ?? "",
        rating = Rating.fromJson(json['rating'] ?? {});
}

class Rating {
  double? rate;
  int? count;

  Rating({this.rate, this.count});

  Rating.fromJson(Map<String, dynamic> json)
      : rate = (json['rate'] ?? 0.0).toDouble(),
        count = (json['count'] ?? 0).toInt();
}
