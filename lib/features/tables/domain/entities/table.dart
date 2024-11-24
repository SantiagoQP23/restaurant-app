class TableEntity {
  final String id;
  final String name;
  final int capacity;
  final int order;
  final String description;
  final bool isAvailable;
  final bool isActive;

  TableEntity({
    required this.id,
    required this.name,
    required this.capacity,
    required this.description,
    required this.isAvailable,
    required this.isActive,
    required this.order,
  });
}
