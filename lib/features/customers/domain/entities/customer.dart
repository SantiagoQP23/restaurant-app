import 'package:restaurant_app/features/shared/domain/entities/person.dart';

class Customer {
  final String id;
  final Person person;
  final String address;
  final bool isActive;

  Customer({
    required this.id,
    required this.person,
    required this.address,
    required this.isActive,
  });
}
