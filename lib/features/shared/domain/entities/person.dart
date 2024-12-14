import 'identification.dart';

class Person {
  final String id;
  final String name;
  final String lastName;
  final String? email;
  final String? phone;
  final Identification? identification;

  Person({
    required this.id,
    required this.name,
    required this.lastName,
    required this.email,
    this.phone,
    required this.identification,
  });
}