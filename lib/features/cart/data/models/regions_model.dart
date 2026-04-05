class RegionResponseModel {
  final List<RegionModel> regions;

  RegionResponseModel({required this.regions});

  factory RegionResponseModel.fromJson(Map<String, dynamic> json) {
    return RegionResponseModel(
      regions: (json['regions'] as List)
          .map((e) => RegionModel.fromJson(e))
          .toList(),
    );
  }
}

class RegionModel {
  final String id;
  final String name;
  final String currencyCode;
  final List<CountryModel> countries;

  RegionModel({
    required this.id,
    required this.name,
    required this.currencyCode,
    required this.countries,
  });

  factory RegionModel.fromJson(Map<String, dynamic> json) {
    return RegionModel(
      id: json['id'] ?? "",
      name: json['name'] ?? "",
      currencyCode: json['currency_code'] ?? "",
      countries: (json['countries'] as List?)
          ?.map((e) => CountryModel.fromJson(e))
          .toList() ??
          [],
    );
  }
}

class CountryModel {
  final String iso2;
  final String displayName;

  CountryModel({
    required this.iso2,
    required this.displayName,
  });

  factory CountryModel.fromJson(Map<String, dynamic> json) {
    return CountryModel(
      iso2: json['iso_2'] ?? "",
      displayName: json['display_name'] ?? "",
    );
  }
}