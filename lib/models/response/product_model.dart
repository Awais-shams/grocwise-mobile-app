class ProductModel {
  ProductModel({
    this.productId,
    this.productName,
    this.productDescription,
    this.productImage,
    this.productPrice,
    this.productQuantity,
  });

  ProductModel.fromJson(dynamic json) {
    productId = json['product_id'];
    productName = json['product_name'];
    productDescription = json['product_description'];
    productImage = json['product_image'];
    productPrice = json['product_price'];
    productQuantity = json['product_quantity'];
  }

  int? productId;
  String? productName;
  String? productDescription;
  String? productImage;
  String? productPrice;
  String? productQuantity;

  ProductModel copyWith({
    int? productId,
    String? productName,
    String? productDescription,
    String? productImage,
    String? productPrice,
    String? productQuantity,
  }) =>
      ProductModel(
          productId: productId ?? this.productId,
          productName: productName ?? this.productName,
          productDescription: productDescription ?? this.productDescription,
          productImage: productImage ?? this.productImage,
          productPrice: productPrice ?? this.productPrice,
          productQuantity: productQuantity ?? this.productQuantity);

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['product_id'] = productId;
    map['product_name'] = productName;
    map['product_description'] = productDescription;
    map['product_image'] = productImage;
    map['product_price'] = productPrice;
    return map;
  }
}
