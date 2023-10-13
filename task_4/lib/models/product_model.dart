class ProductModel {
  int? id;
  String? title;
  List<String>? images;

  ProductModel({this.id, this.title, this.images});

  ProductModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    images = List<String>.from(json['images']);
  }
}
