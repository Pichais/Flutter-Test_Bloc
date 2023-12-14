import 'package:equatable/equatable.dart';

// ignore: must_be_immutable
class Category extends Equatable {
  final int id;
  final String productName;
  final double price;
  final int quantity;
  final String imageUrl;

  const Category({
    required this.id,
    required this.productName,
    required this.price,
    required this.quantity,
    required this.imageUrl,
  });

  Category copyWith({
    int? id,
    String? productName,
    double? price,
    int? quantity,
    String? imageUrl,
  }) {
    return Category(
      id: id ?? this.id,
      productName: productName ?? this.productName,
      price: price ?? this.price,
      quantity: quantity ?? this.quantity,
      imageUrl: imageUrl ?? this.imageUrl,
    );
  }

  @override
  List<Object> get props => [id, productName, price, quantity, imageUrl];
}
