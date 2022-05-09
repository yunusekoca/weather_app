import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';
import 'package:weather_app/dataHelper.dart';

Weather? currentTemp;
List<Weather>? sevenDayWeather;
String lat = "39.9255";
String lon = "32.8662";
String city = "Ankara";

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  getData() async {
    fetchData(lat, lon, city).then((value) {
      currentTemp = value[0];
      sevenDayWeather = value[3];
      setState(() {});
    });
  }

  @override
  void initState() {
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: currentTemp == null
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : Column(
              children: [CurrentWeather(getData), const TodayWeather()],
            ),
    );
  }
}

class CurrentWeather extends StatefulWidget {
  final Function() updateData;
  const CurrentWeather(this.updateData, {Key? key}) : super(key: key);
  @override
  _CurrentWeatherState createState() => _CurrentWeatherState();
}

class _CurrentWeatherState extends State<CurrentWeather> {
  var focusNode = FocusNode();
  final cities = ["İstanbul", "Ankara", "İzmir", "Bursa", "Alaska", "Grönland"];

  @override
  Widget build(BuildContext context) {
    const String defaultLocale = "tr_TR";
    initializeDateFormatting(defaultLocale, null);
    DateTime now = DateTime.now();
    String dayOfWeek = DateFormat.EEEE(defaultLocale).format(now);
    String dayMonth = DateFormat.MMMMd(defaultLocale).format(now);
    String todayText = dayMonth + " " + dayOfWeek;
    return GestureDetector(
      child: Container(
        height: MediaQuery.of(context).size.height - 65,
        margin: const EdgeInsets.all(2),
        padding: const EdgeInsets.only(top: 50, left: 10, right: 10),
        color: Theme.of(context).colorScheme.background,
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                GestureDetector(
                  onTap: () {},
                  child: const Icon(
                    Icons.menu,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(
                  width: 35,
                ),
                Container(
                    width: 225,
                    padding:
                        const EdgeInsets.symmetric(horizontal: 25, vertical: 5),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(36),
                        border: Border.all(color: Colors.black, width: 1)),
                    child: DropdownButtonHideUnderline(
                        child: DropdownButton<String>(
                      value: city,
                      iconSize: 36,
                      borderRadius: const BorderRadius.all(Radius.circular(15)),
                      dropdownColor: Theme.of(context).colorScheme.background,
                      isExpanded: true,
                      items: cities.map(buildMenuItem).toList(),
                      onChanged: (value) async {
                        CityModel? temp = await fetchCity(value!);
                        city = temp!.name!;
                        lat = temp.lat!;
                        lon = temp.lon!;
                        setState(() {});
                        widget.updateData();
                        setState(() {});
                      },
                      focusNode: focusNode,
                    ))),
              ],
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height / 3.5,
              child: Stack(
                children: [
                  Positioned(
                    bottom: 0,
                    right: 0,
                    left: 0,
                    top: 0,
                    child: Center(
                        child: Column(
                      children: [
                        const Spacer(),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image(
                              image: AssetImage(currentTemp!.image!),
                              fit: BoxFit.fill,
                              height: 50,
                            ),
                            Text(
                              currentTemp!.current.toString(),
                              style: const TextStyle(
                                  color: Colors.black,
                                  height: 1.2,
                                  fontSize: 75,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                        Text(currentTemp!.name!,
                            style: const TextStyle(
                              color: Colors.black,
                              height: 1.5,
                              fontSize: 20,
                            )),
                        Text(todayText,
                            style: const TextStyle(
                              color: Colors.black,
                              height: 1.5,
                              fontSize: 20,
                            )),
                        const Spacer(),
                      ],
                    )),
                  )
                ],
              ),
            ),
            const Divider(
              color: Colors.black,
            ),
            const SizedBox(
              height: 10,
            ),
            //Informations here
          ],
        ),
      ),
    );
  }
}

DropdownMenuItem<String> buildMenuItem(String city) => DropdownMenuItem(
      value: city,
      child: Text(
        city,
        style: const TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 22,
          color: Colors.black,
        ),
      ),
    );

class TodayWeather extends StatelessWidget {
  const TodayWeather({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 25, right: 25, top: 10),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: () {
                  //PUSH 7 DAY WEATHER HERE
                },
                child: Row(
                  children: const [
                    Text(
                      "7 günlük hava durumu",
                      style: TextStyle(
                          fontSize: 18,
                          color: Colors.black,
                          fontWeight: FontWeight.bold),
                    ),
                    Icon(
                      Icons.arrow_forward_ios_outlined,
                      color: Colors.blueGrey,
                      size: 15,
                    )
                  ],
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
