import 'package:equatable/equatable.dart';

class Products extends Equatable {
  final String name;
  final String image;
  final double price;
  final double id;
  final String description;

  const Products({
    required this.name,
    required this.image,
    required this.price,
    required this.id,
    required this.description,
  });

  @override
  List<Object?> get props => [name, image, price, description, id];
}
