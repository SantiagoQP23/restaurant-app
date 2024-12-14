class FilterCustomersDTO {
  final String? search;
  final int? page;
  final int? limit;

  FilterCustomersDTO({
    this.search,
    this.page,
    this.limit = 10,
  });

  Map<String, dynamic> toJson() {
    return {
      'search': search,
      'offset': page,
      'limit': limit,
    };
  }

  copyWith({
    String? search,
    int? page,
    int? limit,
  }) {
    return FilterCustomersDTO(
      search: search ?? this.search,
      page: page ?? this.page,
      limit: limit ?? this.limit,
    );
  }

}