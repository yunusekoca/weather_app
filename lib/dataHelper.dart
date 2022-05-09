import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';

class Weather {
  final int? max;
  final int? min;
  final int? current;
  final String? name;
  final String? day;
  final int? wind;
  final int? humidity;
  final int? uvIndex;
  final String? image;
  final String? time;
  final String? location;
  final int? feels_like;
  final int? pressure;

  Weather(
      {this.max,
      this.min,
      this.name,
      this.day,
      this.wind,
      this.humidity,
      this.uvIndex,
      this.image,
      this.current,
      this.time,
      this.location,
      this.feels_like,
      this.pressure});
}

String appId = "b21fd1bc575153adabc43c2ea24e4571";

Future<List> fetchData(String lat, String lon, String city) async {
  var url =
      "https://api.openweathermap.org/data/2.5/onecall?lat=$lat&lon=$lon&lang=tr&units=metric&appid=$appId";
  var response = await http.get(Uri.parse(url));
  DateTime date = DateTime.now();
  if (response.statusCode == 200) {
    var res = json.decode(response.body);
    var current = res["current"];
    var daily = res["daily"][0];
    Weather currentTemp = Weather(
        current: current["temp"]?.round() ?? 0,
        name: current["weather"][0]["main"].toString(),
        day: DateFormat("EEEE dd MMMM").format(date),
        max: daily["temp"]["max"]?.round() ?? 0,
        min: daily["temp"]["min"]?.round() ?? 0,
        wind: current["wind_speed"]?.round() ?? 0,
        humidity: current["humidity"]?.round() ?? 0,
        uvIndex: current["uvi"]?.round() ?? 0,
        pressure: current["pressure"]?.round() ?? 0,
        feels_like: current["feels_like"]?.round() ?? 0,
        location: city,
        image: findIcon(current["weather"][0]["main"].toString(), true));

    List<Weather> todayWeather = [];
    int hour = int.parse(DateFormat("hh").format(date));
    for (var i = 0; i < 4; i++) {
      var temp = res["hourly"];
      var hourly = Weather(
          current: temp[i]["temp"]?.round() ?? 0,
          image: findIcon(temp[i]["weather"][0]["main"].toString(), false),
          time: Duration(hours: hour + i + 1).toString().split(":")[0] + ":00");
      todayWeather.add(hourly);
    }

    Weather tomorrowTemp = Weather(
        max: daily["temp"]["max"]?.round() ?? 0,
        min: daily["temp"]["min"]?.round() ?? 0,
        image: findIcon(daily["weather"][0]["main"].toString(), true),
        name: daily["weather"][0]["main"].toString(),
        wind: daily["wind_speed"]?.round() ?? 0,
        humidity: daily["rain"]?.round() ?? 0,
        uvIndex: daily["uvi"]?.round() ?? 0);

    List<Weather> sevenDay = [];
    for (var i = 1; i < 8; i++) {
      String day = DateFormat("EEEE")
          .format(DateTime(date.year, date.month, date.day + i + 1))
          .substring(0, 3);
      var temp = res["daily"][i];
      var hourly = Weather(
          max: temp["temp"]["max"]?.round() ?? 0,
          min: temp["temp"]["min"]?.round() ?? 0,
          image: findIcon(temp["weather"][0]["main"].toString(), false),
          name: temp["weather"][0]["main"].toString(),
          day: day);
      sevenDay.add(hourly);
    }
    return [currentTemp, todayWeather, tomorrowTemp, sevenDay];
  }
  return [null, null, null, null];
}

class CityModel {
  final String? name;
  final String? lat;
  final String? lon;
  CityModel({this.name, this.lat, this.lon});
}

// ignore: prefer_typing_uninitialized_variables
var cityJSON;

Future<CityModel?> fetchCity(String cityName) async {
  if (cityJSON == null) {
    final String response = await rootBundle.loadString('assets/cities.json');
    cityJSON = await json.decode(response);
  }
  for (var i = 0; i < cityJSON.length; i++) {
    if (cityJSON[i]["name"].toString().toLowerCase() ==
        cityName.toLowerCase()) {
      return CityModel(
          name: cityJSON[i]["name"].toString(),
          lat: cityJSON[i]["latitude"].toString(),
          lon: cityJSON[i]["longitude"].toString());
    }
  }
  return null;
}

String setBackground(DateTime date) {
  int hours = date.hour;

  if (hours >= 1 && hours <= 16) {
    return "assets/day.jpeg";
  } else {
    return "assets/night.jpeg";
  }
}

String findIcon(String name, bool type) {
  switch (name) {
    case "Clouds":
      return "assets/cloudy.png";
    case "Rain":
      return "assets/rainy.png";
    case "Drizzle":
      return "assets/rainy.png";
    case "Thunderstorm":
      return "assets/thunder.svg";
    case "Snow":
      return "assets/snow.png";
    case "Clear":
      return "assets/sunny.png";
    default:
      return "assets/sunny.png";
  }
}
