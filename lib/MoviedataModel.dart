class ProductDataModel {
  String? title;
  int? year;
  List<String>? cast;
  List<String>? genres;
  String? href;
  String? extract;
  String? thumbnail;

  ProductDataModel(
      {this.title,
      this.year,
      this.cast,
      this.genres,
      this.href,
      this.extract,
      this.thumbnail});

  ProductDataModel.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    year = json['year'];
    cast = json['cast'].cast<String>();
    genres = json['genres'].cast<String>();
    href = json['href'];
    extract = json['extract'];
    thumbnail = json['thumbnail'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['title'] = this.title;
    data['year'] = this.year;
    data['cast'] = this.cast;
    data['genres'] = this.genres;
    data['href'] = this.href;
    data['extract'] = this.extract;
    return data;
  }
}
