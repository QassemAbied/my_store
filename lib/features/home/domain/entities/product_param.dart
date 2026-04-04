class ProductParams {
  final int limit;
  final int offset;
  final String fields;

  const ProductParams({
    required this.limit,
    required this.offset,
    required this.fields,
  });
}