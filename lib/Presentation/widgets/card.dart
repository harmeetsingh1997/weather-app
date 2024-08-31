import 'package:flutter/material.dart';

class ForecastCard extends StatelessWidget {
  final String date;
  final double minTemp;
  final double maxTemp;
  final String dayIconPhrase;
  final String nightIconPhrase;
  final String link;

  const ForecastCard({super.key,
    required this.date,
    required this.minTemp,
    required this.maxTemp,
    required this.dayIconPhrase,
    required this.nightIconPhrase,
    required this.link,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
      child: ListTile(
        contentPadding: const EdgeInsets.all(16.0),
        title: Text(date),
        subtitle: Text(
          'Day: $dayIconPhrase, High: $maxTemp°F\nNight: $nightIconPhrase, Low: $minTemp°F',
        ),
        trailing: const Icon(Icons.arrow_forward),
        onTap: () {

        },
      ),
    );
  }
}
