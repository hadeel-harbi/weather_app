class Weather {
  Location? location;
  Current? current;
  Error? error;

  Weather({this.location, this.current, this.error});

  Weather.fromJson(Map<String, dynamic> json) {
    location =
        json['location'] != null ? Location.fromJson(json['location']) : null;
    current =
        json['current'] != null ? Current.fromJson(json['current']) : null;
    error = json['error'] != null ? Error.fromJson(json['error']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (location != null) {
      data['location'] = location!.toJson();
    }
    if (current != null) {
      data['current'] = current!.toJson();
    }
    if (error != null) {
      data['error'] = error!.toJson();
    }
    return data;
  }
}

class Location {
  String? name;
  String? localtime;

  Location({this.name, this.localtime});

  Location.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    localtime = json['localtime'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['localtime'] = localtime;
    return data;
  }
}

class Current {
  double? tempC;
  int? isDay;
  Condition? condition;
  double? windKph;
  int? humidity;
  double? precipIn;

  Current(
      {this.tempC,
      this.isDay,
      this.condition,
      this.windKph,
      this.humidity,
      this.precipIn});

  Current.fromJson(Map<String, dynamic> json) {
    tempC = json['temp_c'];
    isDay = json['is_day'];
    condition = json['condition'] != null
        ? Condition.fromJson(json['condition'])
        : null;
    windKph = json['wind_kph'];
    humidity = json['humidity'];
    precipIn = json['precip_in'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['temp_c'] = tempC;
    data['is_day'] = isDay;
    if (condition != null) {
      data['condition'] = condition!.toJson();
    }
    data['wind_kph'] = windKph;
    data['humidity'] = humidity;
    data['precip_in'] = precipIn;

    return data;
  }
}

class Condition {
  String? text;
  int? code;

  Condition({this.text, this.code});

  Condition.fromJson(Map<String, dynamic> json) {
    text = json['text'];
    code = json['code'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['text'] = text;
    data['code'] = code;
    return data;
  }
}

class Error {
  int? code;

  Error({this.code});

  Error.fromJson(Map<String, dynamic> json) {
    code = json['code'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['code'] = code;
    return data;
  }
}
