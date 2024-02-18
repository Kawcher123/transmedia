import '../../data/models/product_model.dart';
import '../../domain/entities/product_entity.dart';

extension ProductModelExtension on ProductModel {
  ProductEntity toEntity() {
    return ProductEntity(
      id: id,
      title: title,
      content: content,
      image: image,
      thumbnail: thumbnail,
      status: status,
      category: category,
    );
  }
}