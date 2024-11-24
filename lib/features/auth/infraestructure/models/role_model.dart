
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:restaurant_app/features/auth/domain/entities/role.dart';
import 'package:restaurant_app/features/auth/domain/entities/user.dart';

part 'role_model.freezed.dart';
part 'role_model.g.dart';

@freezed
class RoleModel with _$RoleModel {
  const RoleModel._();
  const factory RoleModel({
    required int id,
    required String name,
    @Default('')
    String description,
  }) = _RoleModel;

  factory RoleModel.fromJson(Map<String, dynamic> json) =>
      _$RoleModelFromJson(json);

  Role toEntity() => Role(
    id: id,
    name: name == 'admin' ? Roles.admin : name == 'mesero' ? Roles.waiter : Roles.cook,
    description: description,
  );
}