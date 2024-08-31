




import 'package:weather_app/Domain/entities.dart';

class HeadlineModel extends HeadlineEntity {
  HeadlineModel({
    required super.effectiveDate,
    required super.severity,
    required super.text,
    required super.mobileLink,
    required super.link,
  });

  // Creates a HeadlineModel from a JSON object.
  factory HeadlineModel.fromJson(Map<String, dynamic> json) {
    return HeadlineModel(
      effectiveDate: json['EffectiveDate'],
      severity: json['Severity'],
      text: json['Text'],
      mobileLink: json['MobileLink'],
      link: json['Link'],
    );
  }

  // Converts a HeadlineModel to a HeadlineEntity.
  HeadlineEntity toEntity() {
    return HeadlineEntity(
      effectiveDate: effectiveDate,
      severity: severity,
      text: text,
      mobileLink: mobileLink,
      link: link,
    );
  }
}

// Represents the temperature detail in the data layer.
class TemperatureDetailModel extends TemperatureDetailEntity {
  TemperatureDetailModel({
    required super.value,
    required super.unit,
    required super.unitType,
  });

  // Creates a TemperatureDetailModel from a JSON object.
  factory TemperatureDetailModel.fromJson(Map<String, dynamic> json) {
    return TemperatureDetailModel(
      value: json['Value'].toDouble(),
      unit: json['Unit'],
      unitType: json['UnitType'],
    );
  }

  // Converts a TemperatureDetailModel to a TemperatureDetailEntity.
  TemperatureDetailEntity toEntity() {
    return TemperatureDetailEntity(
      value: value,
      unit: unit,
      unitType: unitType,
    );
  }
}

// Represents the temperature information in the data layer.
class TemperatureModel extends TemperatureEntity {
  TemperatureModel({
    required TemperatureDetailModel minimum,
    required TemperatureDetailModel maximum,
  }) : super(
    minimum: minimum.toEntity(),
    maximum: maximum.toEntity(),
  );

  // Creates a TemperatureModel from a JSON object.
  factory TemperatureModel.fromJson(Map<String, dynamic> json) {
    return TemperatureModel(
      minimum: TemperatureDetailModel.fromJson(json['Minimum']),
      maximum: TemperatureDetailModel.fromJson(json['Maximum']),
    );
  }

  // Converts a TemperatureModel to a TemperatureEntity.
  TemperatureEntity toEntity() {
    return TemperatureEntity(
      minimum: minimum,
      maximum: maximum,
    );
  }
}

// Represents the day weather conditions in the data layer.
class DayModel extends DayEntity {
  DayModel({
    required super.icon,
    required super.iconPhrase,
    required super.hasPrecipitation,
  });

  // Creates a DayModel from a JSON object.
  factory DayModel.fromJson(Map<String, dynamic> json) {
    return DayModel(
      icon: json['Icon'],
      iconPhrase: json['IconPhrase'],
      hasPrecipitation: json['HasPrecipitation'],
    );
  }

  // Converts a DayModel to a DayEntity.
  DayEntity toEntity() {
    return DayEntity(
      icon: icon,
      iconPhrase: iconPhrase,
      hasPrecipitation: hasPrecipitation,
    );
  }
}

// Represents the night weather conditions in the data layer.
class NightModel extends NightEntity {
  NightModel({
    required super.icon,
    required super.iconPhrase,
    required super.hasPrecipitation,
  });

  // Creates a NightModel from a JSON object.
  factory NightModel.fromJson(Map<String, dynamic> json) {
    return NightModel(
      icon: json['Icon'],
      iconPhrase: json['IconPhrase'],
      hasPrecipitation: json['HasPrecipitation'],
    );
  }

  // Converts a NightModel to a NightEntity.
  NightEntity toEntity() {
    return NightEntity(
      icon: icon,
      iconPhrase: iconPhrase,
      hasPrecipitation: hasPrecipitation,
    );
  }
}

// Represents the daily weather forecast in the data layer.
class DailyForecastModel extends DailyForecastEntity {
  DailyForecastModel({
    required super.date,
    required TemperatureModel temperature,
    required DayModel day,
    required NightModel night,
    required super.link,
  }) : super(
    temperature: temperature.toEntity(),
    day: day.toEntity(),
    night: night.toEntity(),
  );

  // Creates a DailyForecastModel from a JSON object.
  factory DailyForecastModel.fromJson(Map<String, dynamic> json) {
    return DailyForecastModel(
      date: json['Date'],
      temperature: TemperatureModel.fromJson(json['Temperature']),
      day: DayModel.fromJson(json['Day']),
      night: NightModel.fromJson(json['Night']),
      link: json['Link'],
    );
  }

  // Converts a DailyForecastModel to a DailyForecastEntity.
  DailyForecastEntity toEntity() {
    return DailyForecastEntity(
      date: date,
      temperature: temperature,
      day: day,
      night: night,
      link: link,
    );
  }
}

// Represents the weather response in the data layer.
class WeatherResponseModel extends WeatherResponseEntity {
  WeatherResponseModel({
    required HeadlineModel headline,
    required List<DailyForecastModel> dailyForecasts,
  }) : super(
    headline: headline.toEntity(),
    dailyForecasts: dailyForecasts.map((model) => model.toEntity()).toList(),
  );

  // Creates a WeatherResponseModel from a JSON object.
  factory WeatherResponseModel.fromJson(Map<String, dynamic> json) {
    return WeatherResponseModel(
      headline: HeadlineModel.fromJson(json['Headline']),
      dailyForecasts: (json['DailyForecasts'] as List)
          .map((i) => DailyForecastModel.fromJson(i))
          .toList(),
    );
  }

  // Converts a WeatherResponseModel to a WeatherResponseEntity.
  WeatherResponseEntity toEntity() {
    return WeatherResponseEntity(
      headline: headline,
      dailyForecasts: dailyForecasts.map((model) => model).toList(),
    );
  }
}
