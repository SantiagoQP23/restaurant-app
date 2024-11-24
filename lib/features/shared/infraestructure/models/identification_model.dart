import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:restaurant_app/features/shared/domain/entities/identification.dart';

part 'identification_model.freezed.dart';
part 'identification_model.g.dart';


@freezed
class IdentificationModel with _$IdentificationModel {
  const IdentificationModel._();
  const factory IdentificationModel({
    @JsonKey(name: 'num')
     required String number,
     required String type,
}) = _IdentificationModel;

  factory IdentificationModel.fromJson(Map<String, dynamic> json) =>
      _$IdentificationModelFromJson(json);
  
  Identification toEntity() => Identification(
    number: number,
    type: type.toLowerCase(), 
  );
}
