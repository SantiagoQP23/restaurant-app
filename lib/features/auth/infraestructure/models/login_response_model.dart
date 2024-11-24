import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:restaurant_app/features/auth/domain/domain.dart';
import 'package:restaurant_app/features/auth/infraestructure/models/user_model.dart';

part 'login_response_model.freezed.dart';
part 'login_response_model.g.dart';

@freezed
class LoginResponseModel with _$LoginResponseModel {
  const LoginResponseModel._();
  const factory LoginResponseModel({
    required String token,
    required UserModel user,
  }) = _LoginResponseModel;

  factory LoginResponseModel.fromJson(Map<String, dynamic> json) =>
      _$LoginResponseModelFromJson(json);
    
  LoginResponseDto toEntity() => LoginResponseDto(
    token: token,
    user: user.toEntity(),
  );
}