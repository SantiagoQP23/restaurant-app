import 'package:restaurant_app/features/cart/domain/entities/section.dart';

abstract class SectionsRepository {
  Future<List<Section>> getSections();
}
