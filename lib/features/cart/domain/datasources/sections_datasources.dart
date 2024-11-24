import 'package:restaurant_app/features/cart/domain/entities/section.dart';

abstract class SectionsDatasource {
  Future<List<Section>> getSections();
} 