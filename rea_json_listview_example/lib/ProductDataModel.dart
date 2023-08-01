class ProductDataModel {
  int? id;
  String? name;
  String? category;
  String? imageUrl;
  String? oldPrice;

  ProductDataModel({
    this.id,
    this.name,
    this.imageUrl,
    this.category,
    this.oldPrice,
  });

  ProductDataModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    imageUrl = json['imageUrl'];
    category = json['category'];
    oldPrice = json['oldPrice'];
  }
}
