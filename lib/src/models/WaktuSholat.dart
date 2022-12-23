// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);


// TODO:
// https://waktusholat.org/api/docs/this_week

import 'dart:convert';

Welcome welcomeFromJson(String str) => Welcome.fromJson(json.decode(str));

String welcomeToJson(Welcome data) => json.encode(data.toJson());

class Welcome {
  Welcome({
    required this.code,
    required this.status,
    required this.results,
  });

  final int code;
  final String status;
  final Results results;

  factory Welcome.fromJson(Map<String, dynamic> json) => Welcome(
        code: json["code"],
        status: json["status"],
        results: Results.fromJson(json["results"]),
      );

  Map<String, dynamic> toJson() => {
        "code": code,
        "status": status,
        "results": results.toJson(),
      };
}

class Results {
  Results({
    required this.datetime,
    required this.location,
    required this.settings,
  });

  final List<Datetime> datetime;
  final Location location;
  final Settings settings;

  factory Results.fromJson(Map<String, dynamic> json) => Results(
        datetime: List<Datetime>.from(
            json["datetime"].map((x) => Datetime.fromJson(x))),
        location: Location.fromJson(json["location"]),
        settings: Settings.fromJson(json["settings"]),
      );

  Map<String, dynamic> toJson() => {
        "datetime": List<dynamic>.from(datetime.map((x) => x.toJson())),
        "location": location.toJson(),
        "settings": settings.toJson(),
      };
}

class Datetime {
  Datetime({
    required this.times,
    required this.date,
  });

  final Times times;
  final Date date;

  factory Datetime.fromJson(Map<String, dynamic> json) => Datetime(
        times: Times.fromJson(json["times"]),
        date: Date.fromJson(json["date"]),
      );

  Map<String, dynamic> toJson() => {
        "times": times.toJson(),
        "date": date.toJson(),
      };
}

class Date {
  Date({
    required this.timestamp,
    required this.gregorian,
    required this.hijri,
  });

  final int timestamp;
  final DateTime gregorian;
  final DateTime hijri;

  factory Date.fromJson(Map<String, dynamic> json) => Date(
        timestamp: json["timestamp"],
        gregorian: DateTime.parse(json["gregorian"]),
        hijri: DateTime.parse(json["hijri"]),
      );

  Map<String, dynamic> toJson() => {
        "timestamp": timestamp,
        "gregorian":
            "${gregorian.year.toString().padLeft(4, '0')}-${gregorian.month.toString().padLeft(2, '0')}-${gregorian.day.toString().padLeft(2, '0')}",
        "hijri":
            "${hijri.year.toString().padLeft(4, '0')}-${hijri.month.toString().padLeft(2, '0')}-${hijri.day.toString().padLeft(2, '0')}",
      };
}

class Times {
  Times({
    required this.imsak,
    required this.sunrise,
    required this.fajr,
    required this.dhuhr,
    required this.asr,
    required this.sunset,
    required this.maghrib,
    required this.isha,
    required this.midnight,
  });

  final String imsak;
  final String sunrise;
  final String fajr;
  final String dhuhr;
  final String asr;
  final String sunset;
  final String maghrib;
  final String isha;
  final String midnight;

  factory Times.fromJson(Map<String, dynamic> json) => Times(
        imsak: json["Imsak"],
        sunrise: json["Sunrise"],
        fajr: json["Fajr"],
        dhuhr: json["Dhuhr"],
        asr: json["Asr"],
        sunset: json["Sunset"],
        maghrib: json["Maghrib"],
        isha: json["Isha"],
        midnight: json["Midnight"],
      );

  Map<String, dynamic> toJson() => {
        "Imsak": imsak,
        "Sunrise": sunrise,
        "Fajr": fajr,
        "Dhuhr": dhuhr,
        "Asr": asr,
        "Sunset": sunset,
        "Maghrib": maghrib,
        "Isha": isha,
        "Midnight": midnight,
      };
}

class Location {
  Location({
    required this.latitude,
    required this.longitude,
    required this.elevation,
    required this.city,
    required this.country,
    required this.countryCode,
    required this.timezone,
    required this.localOffset,
  });

  final double latitude;
  final double longitude;
  final int elevation;
  final String city;
  final String country;
  final String countryCode;
  final String timezone;
  final int localOffset;

  factory Location.fromJson(Map<String, dynamic> json) => Location(
        latitude: json["latitude"].toDouble(),
        longitude: json["longitude"].toDouble(),
        elevation: json["elevation"],
        city: json["city"],
        country: json["country"],
        countryCode: json["country_code"],
        timezone: json["timezone"],
        localOffset: json["local_offset"],
      );

  Map<String, dynamic> toJson() => {
        "latitude": latitude,
        "longitude": longitude,
        "elevation": elevation,
        "city": city,
        "country": country,
        "country_code": countryCode,
        "timezone": timezone,
        "local_offset": localOffset,
      };
}

class Settings {
  Settings({
    required this.timeformat,
    required this.school,
    required this.juristic,
    required this.highlat,
    required this.fajrAngle,
    required this.ishaAngle,
  });

  final String timeformat;
  final String school;
  final String juristic;
  final String highlat;
  final int fajrAngle;
  final int ishaAngle;

  factory Settings.fromJson(Map<String, dynamic> json) => Settings(
        timeformat: json["timeformat"],
        school: json["school"],
        juristic: json["juristic"],
        highlat: json["highlat"],
        fajrAngle: json["fajr_angle"],
        ishaAngle: json["isha_angle"],
      );

  Map<String, dynamic> toJson() => {
        "timeformat": timeformat,
        "school": school,
        "juristic": juristic,
        "highlat": highlat,
        "fajr_angle": fajrAngle,
        "isha_angle": ishaAngle,
      };
}
