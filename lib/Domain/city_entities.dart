class CityEntity {
  final int? version;
  final String? key;
  final String? type;
  final int? rank;
  final String? localizedName;
  final String? englishName;
  final String? primaryPostalCode;
  final RegionEntity? region;
  final CountryEntity? country;
  final AdministrativeAreaEntity? administrativeArea;
  final TimeZoneEntity? timeZone;
  final GeoPositionEntity? geoPosition;
  final bool? isAlias;
  final List<SupplementalAdminAreaEntity>? supplementalAdminAreas;
  final List<String>? dataSets;

  CityEntity({
    this.version,
    this.key,
    this.type,
    this.rank,
    this.localizedName,
    this.englishName,
    this.primaryPostalCode,
    this.region,
    this.country,
    this.administrativeArea,
    this.timeZone,
    this.geoPosition,
    this.isAlias,
    this.supplementalAdminAreas,
    this.dataSets,
  });
}

class RegionEntity {
  final String? id;
  final String? localizedName;
  final String? englishName;

  RegionEntity({
    this.id,
    this.localizedName,
    this.englishName,
  });
}


class CountryEntity {
  final String? id;
  final String? localizedName;
  final String? englishName;

  CountryEntity({
    this.id,
    this.localizedName,
    this.englishName,
  });
}

class AdministrativeAreaEntity {
  final String? id;
  final String? localizedName;
  final String? englishName;
  final int? level;
  final String? localizedType;
  final String? englishType;
  final String? countryId;

  AdministrativeAreaEntity({
    this.id,
    this.localizedName,
    this.englishName,
    this.level,
    this.localizedType,
    this.englishType,
    this.countryId,
  });
}

class TimeZoneEntity {
  final String? code;
  final String? name;
  final double? gmtOffset;
  final bool? isDaylightSaving;
  final String? nextOffsetChange;

  TimeZoneEntity({
    this.code,
    this.name,
    this.gmtOffset,
    this.isDaylightSaving,
    this.nextOffsetChange,
  });
}

class GeoPositionEntity {
  final double? latitude;
  final double? longitude;
  final ElevationEntity? elevation;

  GeoPositionEntity({
    this.latitude,
    this.longitude,
    this.elevation,
  });
}

class ElevationEntity {
  final MetricEntity? metric;
  final ImperialEntity? imperial;

  ElevationEntity({
    this.metric,
    this.imperial,
  });
}

class MetricEntity {
  final double? value;
  final String? unit;
  final int? unitType;

  MetricEntity({
    this.value,
    this.unit,
    this.unitType,
  });
}

class ImperialEntity {
  final double? value;
  final String? unit;
  final int? unitType;

  ImperialEntity({
    this.value,
    this.unit,
    this.unitType,
  });
}

class SupplementalAdminAreaEntity {
  final int? level;
  final String? localizedName;
  final String? englishName;

  SupplementalAdminAreaEntity({
    this.level,
    this.localizedName,
    this.englishName,
  });
}
