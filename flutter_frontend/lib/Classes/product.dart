class Product {
  String productId;
  String name;
  int price;
  int quantity;
  String image;

  Product(
    this.productId,
    this.name,
    this.price,
    this.quantity,
    this.image,
  );

  Map<String, dynamic> toJson() => {
        'id': productId,
        'name': name,
        'price': price,
        'quantity': quantity,
        'image': image,
      };

  Product.fromJson(Map<String, dynamic> json)
      : productId = json['id'],
        name = json['name'],
        price = json['price'],
        quantity = json['quantity'],
        image = json['image'];
}
