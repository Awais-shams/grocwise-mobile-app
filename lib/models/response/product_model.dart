class ProductModel {
  ProductModel(
      {this.productId,
      this.source,
      this.productName,
      this.productDescription,
      this.productImage,
      this.productPrice,
      this.productQuantity,
      this.categoryTitle});

  ProductModel.fromJson(Map<dynamic, dynamic> json) {
    productId = json['_id'] as String?;
    source = json['source'] as String?;
    productName = json['product_title'] as String?;
    productDescription = json['product_description'] as String?;
    productImage = json['product_image'] as String?;
    productPrice = json['product_price'] as String?;
    productQuantity = json['product_quantity'] as String?;
    categoryTitle = json['category_title'] as String?;
  }
  String? source;
  String? productId;
  String? productName;
  String? productDescription;
  String? productImage;
  String? productPrice;
  String? productQuantity;
  String? categoryTitle;

  ProductModel copyWith(
          {String? productId,
          String? source,
          String? productName,
          String? productDescription,
          String? productImage,
          String? productPrice,
          String? productQuantity,
          String? categoryTitle}) =>
      ProductModel(
          productId: productId ?? this.productId,
          source: source ?? this.source,
          productName: productName ?? this.productName,
          productDescription: productDescription ?? this.productDescription,
          productImage: productImage ?? this.productImage,
          productPrice: productPrice ?? this.productPrice,
          productQuantity: productQuantity ?? this.productQuantity,
          categoryTitle: categoryTitle ?? this.categoryTitle);

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['product_id'] = productId;
    map['source'] = source;
    map['product_name'] = productName;
    map['product_description'] = productDescription;
    map['product_image'] = productImage;
    map['product_price'] = productPrice;
    map['category_title'] = categoryTitle;
    return map;
  }
}
