import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:restaurant_app/features/cart/domain/entities/section.dart';

part 'section_model.freezed.dart';
part 'section_model.g.dart';

@freezed
class SectionModel with _$SectionModel {
  const SectionModel._();

  const factory SectionModel({
    required String id,
    required String name,
    // required List<CategoryModel> categories,
    required int order,
    required bool isPublic,
    required bool isActive,
  }) = _SectionModel;

  factory SectionModel.fromJson(Map<String, dynamic> json) =>
      _$SectionModelFromJson(json);
  
  Section toEntity() => Section(
        id: id,
        name: name,
        order: order,
        isPublic: isPublic,
        isActive: isActive,
      );
}
