import 'package:restaurant_app/features/shared/domain/entities/person.dart';
import 'package:restaurant_app/features/shared/infraestructure/models/identification_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'person_model.freezed.dart';
part 'person_model.g.dart';

@freezed
class PersonModel with _$PersonModel {
  const PersonModel._();
  const factory PersonModel({
    required String id,
    required String firstName,
    required String lastName,
    required String? email,
    String? numPhone,
    required IdentificationModel? identification,
  }) = _PersonModel;

  factory PersonModel.fromJson(Map<String, dynamic> json) =>
      _$PersonModelFromJson(json);
  
  Person toEntity() => Person(
      id: id,
      name: firstName,
      lastName: lastName,
      email: email,
      phone: numPhone,
      identification: identification?.toEntity(),
    );
}
