import 'package:restaurant_app/features/cart/domain/entities/section.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:restaurant_app/features/auth/presentation/providers/auth_provider.dart';
import 'package:restaurant_app/features/cart/domain/repositories/sections_repository.dart';
import 'package:restaurant_app/features/cart/infraestructura/datasources/sections_datasource_impl.dart';
import 'package:restaurant_app/features/cart/infraestructura/repositories/sections_repository_impl.dart';

part 'sections_providers.g.dart';

@riverpod
SectionsRepository sectionsRepository(SectionsRepositoryRef ref) {
  final accessToken = ref.watch(authProvider).token ?? '';

  final repository = SectionsRepositoryImpl(
      sectionsDatasource: SectionsDatasourceImpl(accessToken: accessToken));
  return repository;
}

@Riverpod(keepAlive: true)
class ActiveSection extends _$ActiveSection {
  @override
  Section build() {

    return Section(
      id: '1',
      name: 'name',
      order: 1,
      isPublic: true,
      isActive: true,
    ); 
  }

  void setActiveSection(Section section) {
    state = section;
  }
}

@riverpod
// @Riverpod(keepAlive: true)
class Sections extends _$Sections {
  @override
  Future<List<Section>> build() async {
    final repository = ref.watch(sectionsRepositoryProvider);
    return repository.getSections();
  }
}