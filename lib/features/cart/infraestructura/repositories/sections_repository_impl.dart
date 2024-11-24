import 'package:restaurant_app/features/cart/domain/datasources/sections_datasources.dart';
import 'package:restaurant_app/features/cart/domain/entities/section.dart';
import 'package:restaurant_app/features/cart/domain/repositories/sections_repository.dart';

class SectionsRepositoryImpl implements SectionsRepository {
  final SectionsDatasource sectionsDatasource;

  SectionsRepositoryImpl({required this.sectionsDatasource});

  @override
  Future<List<Section>> getSections() async {
    return await sectionsDatasource.getSections();
  }
}