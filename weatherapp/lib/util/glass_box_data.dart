import 'package:flutter/material.dart';

class GlassBoxData extends StatelessWidget {
  final String day;
  final IconData weatherIcon;
  final String temperature;
  final String weatherComment;
  GlassBoxData({
    super.key,
    required this.day,
    required this.weatherIcon,
    required this.temperature,
    required this.weatherComment,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // DAY AND WEATHER SYMBOL
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 5.0,
                vertical: 5.0,
              ),
              child: Text(
                day,
                style: TextStyle(fontSize: 10.0),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 5.0),
              child: Icon(
                weatherIcon,
                size: 12.0,
              ),
            ),
          ],
        ),

        // TEMPERATURE AND COMMENT
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 5.0),
          child: Text(
            temperature,
            style: TextStyle(
              fontSize: 12.0,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 5.0),
          child: Text(
            weatherComment,
            style: TextStyle(
              fontSize: 10.0,
            ),
          ),
        ),
      ],
    );
  }
}
