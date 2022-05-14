import 'package:flutter/material.dart';
import 'package:weather_app/dataHelper.dart';

class DetailScreen extends StatelessWidget {
  final List<Weather> sevenDay;
  const DetailScreen(this.sevenDay, {Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Column(
        children: [const Header(), SevenDays(sevenDay)],
      ),
    );
  }
}

class Header extends StatelessWidget {
  const Header({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).colorScheme.background,
      child: Column(
        children: [
          Padding(
            padding:
                const EdgeInsets.only(top: 50, right: 30, left: 30, bottom: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: const Icon(
                      Icons.arrow_back_ios,
                      color: Colors.black,
                    )),
                Row(
                  children: const [
                    Icon(
                      Icons.calendar_month,
                      color: Colors.black,
                    ),
                    Text(
                      " 7 günlük",
                      style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
                    )
                  ],
                ),
                const Icon(null),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class SevenDays extends StatelessWidget {
  final List<Weather> sevenDay;
  const SevenDays(this.sevenDay, {Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        color: Theme.of(context).colorScheme.background,
        child: ListView.builder(
            itemCount: sevenDay.length,
            itemBuilder: (BuildContext context, int index) {
              return Padding(
                  padding:
                      const EdgeInsets.only(left: 10, right: 10, bottom: 30),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(sevenDay[index].day!,
                          style: const TextStyle(
                              fontSize: 15, color: Colors.black)),
                      SizedBox(
                        width: 135,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Image(
                              image: AssetImage(sevenDay[index].image!),
                              width: 40,
                            ),
                            const SizedBox(width: 15),
                            Text(
                              sevenDay[index].name!,
                              style: const TextStyle(
                                  fontSize: 20, color: Colors.black),
                            )
                          ],
                        ),
                      ),
                      Row(
                        children: [
                          Text(
                            sevenDay[index].max.toString() + "\u00B0",
                            style: const TextStyle(
                                fontSize: 20, color: Colors.black),
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          const Text(
                            "/ ",
                            style:
                                TextStyle(fontSize: 20, color: Colors.black54),
                          ),
                          Text(
                            sevenDay[index].min.toString() + "\u00B0",
                            style: const TextStyle(
                                fontSize: 20, color: Colors.black),
                          ),
                        ],
                      )
                    ],
                  ));
            }),
      ),
    );
  }
}
