import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:weather_app/dataHelper.dart';

class ExtraWeather extends StatelessWidget {
  final Weather temp;
  const ExtraWeather(this.temp, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Column(
              children: [
                const Icon(
                  CupertinoIcons.wind,
                  color: Colors.black,
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  temp.wind.toString() + " km/h",
                  style: const TextStyle(
                      fontWeight: FontWeight.w700, fontSize: 16),
                ),
                const SizedBox(
                  height: 10,
                ),
                const Text(
                  "Rüzgar",
                  style: TextStyle(color: Colors.black54, fontSize: 16),
                )
              ],
            ),
            Column(
              children: [
                const Icon(
                  CupertinoIcons.drop,
                  color: Colors.black,
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  temp.humidity.toString() + " %",
                  style: const TextStyle(
                      fontWeight: FontWeight.w700, fontSize: 16),
                ),
                const SizedBox(
                  height: 10,
                ),
                const Text(
                  "Nem",
                  style: TextStyle(color: Colors.black54, fontSize: 16),
                )
              ],
            ),
            Column(
              children: [
                const Icon(
                  CupertinoIcons.light_max,
                  color: Colors.black,
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  temp.uvIndex.toString(),
                  style: const TextStyle(
                      fontWeight: FontWeight.w700, fontSize: 16),
                ),
                const SizedBox(
                  height: 10,
                ),
                const Text(
                  "UV",
                  style: TextStyle(color: Colors.black54, fontSize: 16),
                )
              ],
            ),
          ],
        ),
        const SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Column(
              children: [
                const Icon(
                  CupertinoIcons.info_circle,
                  color: Colors.black,
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  temp.feels_like.toString() + "\u00B0",
                  style: const TextStyle(
                      fontWeight: FontWeight.w700, fontSize: 16),
                ),
                const SizedBox(
                  height: 10,
                ),
                const Text(
                  "Hissedilen",
                  style: TextStyle(color: Colors.black54, fontSize: 16),
                )
              ],
            ),
            Column(
              children: [
                const Icon(
                  CupertinoIcons.down_arrow,
                  color: Colors.black,
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  temp.min.toString() + "\u00B0",
                  style: const TextStyle(
                      fontWeight: FontWeight.w700, fontSize: 16),
                ),
                const SizedBox(
                  height: 10,
                ),
                const Text(
                  "Min",
                  style: TextStyle(color: Colors.black54, fontSize: 16),
                )
              ],
            ),
            Column(
              children: [
                const Icon(
                  CupertinoIcons.up_arrow,
                  color: Colors.black,
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  temp.max.toString() + "\u00B0",
                  style: const TextStyle(
                      fontWeight: FontWeight.w700, fontSize: 16),
                ),
                const SizedBox(
                  height: 10,
                ),
                const Text(
                  "Max",
                  style: TextStyle(color: Colors.black54, fontSize: 16),
                )
              ],
            ),
          ],
        )
      ],
    );
  }
}
