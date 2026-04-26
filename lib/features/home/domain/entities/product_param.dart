class ProductParams {
  final int limit;
  final int offset;
  final String fields;
  final String reginId;
  final String? query;

  const ProductParams({
    required this.limit,
    required this.offset,
    required this.fields,
    required this.reginId, required this.query,
  });
}