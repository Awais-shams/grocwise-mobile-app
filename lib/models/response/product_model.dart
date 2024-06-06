class ProductModel {
  ProductModel(
      {this.productId,
      this.productName,
      this.productDescription,
      this.productImage,
      this.productPrice,
      this.productQuantity,
      this.categoryTitle});

  ProductModel.fromJson(dynamic json) {
    productId = json['_id'];
    productName = json['product_title'];
    productDescription = json['product_description'];
    productImage = json['product_image'];
    productPrice = json['product_price'];
    productQuantity = json['product_quantity'];
    categoryTitle = json['category_title'];
  }

  int? productId;
  String? productName;
  String? productDescription;
  String? productImage;
  String? productPrice;
  String? productQuantity;
  String? categoryTitle;

  ProductModel copyWith(
          {int? productId,
          String? productName,
          String? productDescription,
          String? productImage,
          String? productPrice,
          String? productQuantity,
          String? categoryTitle}) =>
      ProductModel(
          productId: productId ?? this.productId,
          productName: productName ?? this.productName,
          productDescription: productDescription ?? this.productDescription,
          productImage: productImage ?? this.productImage,
          productPrice: productPrice ?? this.productPrice,
          productQuantity: productQuantity ?? this.productQuantity,
          categoryTitle: categoryTitle ?? this.categoryTitle);

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['product_id'] = productId;
    map['product_name'] = productName;
    map['product_description'] = productDescription;
    map['product_image'] = productImage;
    map['product_price'] = productPrice;
    map['category_title'] = categoryTitle;
    return map;
  }
}
