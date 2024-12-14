import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:restaurant_app/features/customers/domain/entities/customer.dart';
import 'package:restaurant_app/features/shared/infraestructure/models/person_model.dart';

part 'customer_model.freezed.dart';
part 'customer_model.g.dart';

@freezed
class CustomerModel with _$CustomerModel {
  const CustomerModel._();
  const factory CustomerModel({
    required String id,
    required PersonModel person,
    required String address,
    required bool isActive,
  }) = _CustomerModel;

  factory CustomerModel.fromJson(Map<String, dynamic> json) =>
      _$CustomerModelFromJson(json);

  Customer toEntity() {
    return Customer(
      id: id,
      person: person.toEntity(),
      address: address,
      isActive: isActive,
    );
  }
}