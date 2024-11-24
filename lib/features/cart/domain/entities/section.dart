
class Section {
  final bool isActive;
  final bool isPublic;
  final int order;
  // final List<Category> categories;
  final String id;
  final String name;

  Section(
      {required this.name,
      required this.id,
      required this.isActive,
      required this.isPublic,
      required this.order});
}
