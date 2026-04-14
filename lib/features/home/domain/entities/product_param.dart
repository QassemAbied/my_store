class ProductParams {
  final int limit;
  final int offset;
  final String fields;
  final String reginId;

  const ProductParams({
    required this.limit,
    required this.offset,
    required this.fields,
    required this.reginId,
  });
}