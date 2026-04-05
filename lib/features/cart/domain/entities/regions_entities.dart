class RegionEntity {
  final String id;
  final String name;
  final String currencyCode;
  final List<CountryEntity> countries;

  const RegionEntity({
    required this.id,
    required this.name,
    required this.currencyCode,
    required this.countries,
  });
}
class CountryEntity {
  final String name;

  const CountryEntity({
    required this.name,
  });
}