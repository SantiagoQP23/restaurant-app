import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:restaurant_app/features/tables/domain/domain.dart';

part 'table_model.freezed.dart';
part 'table_model.g.dart';

@freezed
class TableModel with _$TableModel {
  const TableModel._();
  const factory TableModel(
      {required String id,
      required String name,
      @JsonKey(name: 'chairs') required int capacity,
      @Default(false) bool isAvailable,
      required int order,
      required String description,
      @Default(true) bool isActive}) = _TableModel;

  factory TableModel.fromJson(Map<String, dynamic> json) =>
      _$TableModelFromJson(json);

  TableEntity toEntity() => TableEntity(
        id: id,
        name: name,
        capacity: capacity,
        isAvailable: isAvailable,
        order: order,
        description: description,
        isActive: isActive,
      );
}
