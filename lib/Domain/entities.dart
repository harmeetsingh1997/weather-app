class HeadlineEntity {
  final String effectiveDate;
  final int severity;
  final String text;
  final String mobileLink;
  final String link;

  HeadlineEntity({
    required this.effectiveDate,
    required this.severity,
    required this.text,
    required this.mobileLink,
    required this.link,
  });
}

// Represents the detailed temperature information.
class TemperatureDetailEntity {
  final double value;
  final String unit;
  final int unitType;

  TemperatureDetailEntity({
    required this.value,
    required this.unit,
    required this.unitType,
  });
}

// Represents the temperature information for a day.
class TemperatureEntity {
  final TemperatureDetailEntity minimum;
  final TemperatureDetailEntity maximum;

  TemperatureEntity({
    required this.minimum,
    required this.maximum,
  });
}

// Represents the daytime weather conditions.
class DayEntity {
  final int icon;
  final String iconPhrase;
  final bool hasPrecipitation;

  DayEntity({
    required this.icon,
    required this.iconPhrase,
    required this.hasPrecipitation,
  });
}

// Represents the nighttime weather conditions.
class NightEntity {
  final int icon;
  final String iconPhrase;
  final bool hasPrecipitation;

  NightEntity({
    required this.icon,
    required this.iconPhrase,
    required this.hasPrecipitation,
  });
}

// Represents the daily weather forecast.
class DailyForecastEntity {
  final String date;
  final TemperatureEntity temperature;
  final DayEntity day;
  final NightEntity night;
  final String link;

  DailyForecastEntity({
    required this.date,
    required this.temperature,
    required this.day,
    required this.night,
    required this.link,
  });
}

// Represents the weather response containing headlines and daily forecasts.
class WeatherResponseEntity {
  final HeadlineEntity headline;
  final List<DailyForecastEntity> dailyForecasts;

  WeatherResponseEntity({
    required this.headline,
    required this.dailyForecasts,
  });
}