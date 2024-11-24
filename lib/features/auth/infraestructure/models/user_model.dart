import 'package:restaurant_app/features/auth/domain/entities/user.dart';
import 'package:restaurant_app/features/auth/infraestructure/models/role_model.dart';
import 'package:restaurant_app/features/shared/infraestructure/models/person_model.dart';

import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_model.freezed.dart';
part 'user_model.g.dart';

@freezed
class UserModel with _$UserModel {
  const UserModel._();
  const factory UserModel({
    required String id,
    required String username,
    required PersonModel person,
    @Default(false)
    bool online,
    required RoleModel role,
  }) = _UserModel;

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);

  User toEntity() => User(
      id: id,
      username: username,
      person: person.toEntity(),
      online: online,
      role: role.toEntity(),
    );
}
