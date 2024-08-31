

import 'package:weather_app/Domain/city_entities.dart';

class CityModel extends CityEntity {
  CityModel({
    super.version,
    super.key,
    super.type,
    super.rank,
    super.localizedName,
    super.englishName,
    super.primaryPostalCode,
    super.region,
    super.country,
    super.administrativeArea,
    super.timeZone,
    super.geoPosition,
    super.isAlias,
    super.supplementalAdminAreas,
    super.dataSets,
  });

  factory CityModel.fromJson(Map<String, dynamic> json) {
    return CityModel(
      version: json['Version'] as int?,
      key: json['Key'] as String?,
      type: json['Type'] as String?,
      rank: json['Rank'] as int?,
      localizedName: json['LocalizedName'] as String?,
      englishName: json['EnglishName'] as String?,
      primaryPostalCode: json['PrimaryPostalCode'] as String?,
      region: json['Region'] != null
          ? RegionModel.fromJson(json['Region'] as Map<String, dynamic>)
          : null,
      country: json['Country'] != null
          ? CountryModel.fromJson(json['Country'] as Map<String, dynamic>)
          : null,
      administrativeArea: json['AdministrativeArea'] != null
          ? AdministrativeAreaModel.fromJson(
        json['AdministrativeArea'] as Map<String, dynamic>,
      )
          : null,
      timeZone: json['TimeZone'] != null
          ? TimeZoneModel.fromJson(json['TimeZone'] as Map<String, dynamic>)
          : null,
      geoPosition: json['GeoPosition'] != null
          ? GeoPositionModel.fromJson(json['GeoPosition'] as Map<String, dynamic>)
          : null,
      isAlias: json['IsAlias'] as bool?,
      supplementalAdminAreas: json['SupplementalAdminAreas'] != null
          ? (json['SupplementalAdminAreas'] as List)
          .map((e) =>
          SupplementalAdminAreaModel.fromJson(e as Map<String, dynamic>))
          .toList()
          : null,
      dataSets: json['DataSets'] != null
          ? List<String>.from(json['DataSets'])
          : null,
    );
  }
}

class RegionModel extends RegionEntity {
  RegionModel({
    super.id,
    super.localizedName,
    super.englishName,
  });

  factory RegionModel.fromJson(Map<String, dynamic> json) {
    return RegionModel(
      id: json['ID'] as String?,
      localizedName: json['LocalizedName'] as String?,
      englishName: json['EnglishName'] as String?,
    );
  }
}

class CountryModel extends CountryEntity {
  CountryModel({
    super.id,
    super.localizedName,
    super.englishName,
  });

  factory CountryModel.fromJson(Map<String, dynamic> json) {
    return CountryModel(
      id: json['ID'] as String?,
      localizedName: json['LocalizedName'] as String?,
      englishName: json['EnglishName'] as String?,
    );
  }
}

class AdministrativeAreaModel extends AdministrativeAreaEntity {
  AdministrativeAreaModel({
    super.id,
    super.localizedName,
    super.englishName,
    super.level,
    super.localizedType,
    super.englishType,
    super.countryId,
  });

  factory AdministrativeAreaModel.fromJson(Map<String, dynamic> json) {
    return AdministrativeAreaModel(
      id: json['ID'] as String?,
      localizedName: json['LocalizedName'] as String?,
      englishName: json['EnglishName'] as String?,
      level: json['Level'] as int?,
      localizedType: json['LocalizedType'] as String?,
      englishType: json['EnglishType'] as String?,
      countryId: json['CountryID'] as String?,
    );
  }
}

class TimeZoneModel extends TimeZoneEntity {
  TimeZoneModel({
    super.code,
    super.name,
    super.gmtOffset,
    super.isDaylightSaving,
    super.nextOffsetChange,
  });

  factory TimeZoneModel.fromJson(Map<String, dynamic> json) {
    return TimeZoneModel(
      code: json['Code'] as String?,
      name: json['Name'] as String?,
      gmtOffset: json['GmtOffset'] as double?,
      isDaylightSaving: json['IsDaylightSaving'] as bool?,
      nextOffsetChange: json['NextOffsetChange'] as String?,
    );
  }
}

class GeoPositionModel extends GeoPositionEntity {
  GeoPositionModel({
    super.latitude,
    super.longitude,
    super.elevation,
  });

  factory GeoPositionModel.fromJson(Map<String, dynamic> json) {
    return GeoPositionModel(
      latitude: json['Latitude'] as double?,
      longitude: json['Longitude'] as double?,
      elevation: json['Elevation'] != null
          ? ElevationModel.fromJson(json['Elevation'] as Map<String, dynamic>)
          : null,
    );
  }
}

class ElevationModel extends ElevationEntity {
  ElevationModel({
    super.metric,
    super.imperial,
  });

  factory ElevationModel.fromJson(Map<String, dynamic> json) {
    return ElevationModel(
      metric: json['Metric'] != null
          ? MetricModel.fromJson(json['Metric'] as Map<String, dynamic>)
          : null,
      imperial: json['Imperial'] != null
          ? ImperialModel.fromJson(json['Imperial'] as Map<String, dynamic>)
          : null,
    );
  }
}

class MetricModel extends MetricEntity {
  MetricModel({
    super.value,
    super.unit,
    super.unitType,
  });

  factory MetricModel.fromJson(Map<String, dynamic> json) {
    return MetricModel(
      value: json['Value'] as double?,
      unit: json['Unit'] as String?,
      unitType: json['UnitType'] as int?,
    );
  }
}

class ImperialModel extends ImperialEntity {
  ImperialModel({
    super.value,
    super.unit,
    super.unitType,
  });

  factory ImperialModel.fromJson(Map<String, dynamic> json) {
    return ImperialModel(
      value: json['Value'] as double?,
      unit: json['Unit'] as String?,
      unitType: json['UnitType'] as int?,
    );
  }
}

class SupplementalAdminAreaModel extends SupplementalAdminAreaEntity {
  SupplementalAdminAreaModel({
    super.level,
    super.localizedName,
    super.englishName,
  });

  factory SupplementalAdminAreaModel.fromJson(Map<String, dynamic> json) {
    return SupplementalAdminAreaModel(
      level: json['Level'] as int?,
      localizedName: json['LocalizedName'] as String?,
      englishName: json['EnglishName'] as String?,
    );
  }
}
