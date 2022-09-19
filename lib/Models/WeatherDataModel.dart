import 'dart:convert';

WeatherDataModel weatherDataModelFromJson(String str) => WeatherDataModel.fromJson(json.decode(str));

String weatherDataModelToJson(WeatherDataModel data) => json.encode(data.toJson());


class WeatherDataModel {
  List<Data>? data;
  String? cityName;
  double? lon;
  String? timezone;
  double? lat;
  String? countryCode;
  String? stateCode;

  WeatherDataModel(
      {this.data,
        this.cityName,
        this.lon,
        this.timezone,
        this.lat,
        this.countryCode,
        this.stateCode});

   WeatherDataModel.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
    cityName = json['city_name'];
    lon = json['lon'];
    timezone = json['timezone'];
    lat = json['lat'];
    countryCode = json['country_code'];
    stateCode = json['state_code'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    data['city_name'] = this.cityName;
    data['lon'] = this.lon;
    data['timezone'] = this.timezone;
    data['lat'] = this.lat;
    data['country_code'] = this.countryCode;
    data['state_code'] = this.stateCode;
    return data;
  }
}

class Data {
  String? windCdir;
  int? rh;
  String? pod;
  String? timestampUtc;
  num? pres;
  num? solarRad;
  num? ozone;
  Weather? weather;
  num? windGustSpd;
  String? timestampLocal;
  num? snowDepth;
  num? clouds;
  num? ts;
  num? windSpd;
  num? pop;
  String? windCdirFull;
  num? slp;
  num? dni;
  num? dewpt;
  num? snow;
  num? uv;
  num? windDir;
  num? cloudsHi;
  num? precip;
  num? vis;
  num? dhi;
  num? appTemp;
  String? datetime;
  num? temp;
  num? ghi;
  num? cloudsMid;
  num? cloudsLow;

  Data(
      {this.windCdir,
        this.rh,
        this.pod,
        this.timestampUtc,
        this.pres,
        this.solarRad,
        this.ozone,
        this.weather,
        this.windGustSpd,
        this.timestampLocal,
        this.snowDepth,
        this.clouds,
        this.ts,
        this.windSpd,
        this.pop,
        this.windCdirFull,
        this.slp,
        this.dni,
        this.dewpt,
        this.snow,
        this.uv,
        this.windDir,
        this.cloudsHi,
        this.precip,
        this.vis,
        this.dhi,
        this.appTemp,
        this.datetime,
        this.temp,
        this.ghi,
        this.cloudsMid,
        this.cloudsLow});

  Data.fromJson(Map<String, dynamic> json) {
    windCdir = json['wind_cdir'];
    rh = json['rh'];
    pod = json['pod'];
    timestampUtc = json['timestamp_utc'];
    pres = json['pres'];
    solarRad = json['solar_rad'];
    ozone = json['ozone'];
    weather =
    json['weather'] != null ? new Weather.fromJson(json['weather']) : null;
    windGustSpd = json['wind_gust_spd'];
    timestampLocal = json['timestamp_local'];
    snowDepth = json['snow_depth'];
    clouds = json['clouds'];
    ts = json['ts'];
    windSpd = json['wind_spd'];
    pop = json['pop'];
    windCdirFull = json['wind_cdir_full'];
    slp = json['slp'];
    dni = json['dni'];
    dewpt = json['dewpt'];
    snow = json['snow'];
    uv = json['uv'];
    windDir = json['wind_dir'];
    cloudsHi = json['clouds_hi'];
    precip = json['precip'];
    vis = json['vis'];
    dhi = json['dhi'];
    appTemp = json['app_temp'];
    datetime = json['datetime'];
    temp = json['temp'];
    ghi = json['ghi'];
    cloudsMid = json['clouds_mid'];
    cloudsLow = json['clouds_low'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['wind_cdir'] = this.windCdir;
    data['rh'] = this.rh;
    data['pod'] = this.pod;
    data['timestamp_utc'] = this.timestampUtc;
    data['pres'] = this.pres;
    data['solar_rad'] = this.solarRad;
    data['ozone'] = this.ozone;
    if (this.weather != null) {
      data['weather'] = this.weather!.toJson();
    }
    data['wind_gust_spd'] = this.windGustSpd;
    data['timestamp_local'] = this.timestampLocal;
    data['snow_depth'] = this.snowDepth;
    data['clouds'] = this.clouds;
    data['ts'] = this.ts;
    data['wind_spd'] = this.windSpd;
    data['pop'] = this.pop;
    data['wind_cdir_full'] = this.windCdirFull;
    data['slp'] = this.slp;
    data['dni'] = this.dni;
    data['dewpt'] = this.dewpt;
    data['snow'] = this.snow;
    data['uv'] = this.uv;
    data['wind_dir'] = this.windDir;
    data['clouds_hi'] = this.cloudsHi;
    data['precip'] = this.precip;
    data['vis'] = this.vis;
    data['dhi'] = this.dhi;
    data['app_temp'] = this.appTemp;
    data['datetime'] = this.datetime;
    data['temp'] = this.temp;
    data['ghi'] = this.ghi;
    data['clouds_mid'] = this.cloudsMid;
    data['clouds_low'] = this.cloudsLow;
    return data;
  }
}

class Weather {
  String? icon;
  int? code;
  String? description;

  Weather({this.icon, this.code, this.description});

  Weather.fromJson(Map<String, dynamic> json) {
    icon = json['icon'];
    code = json['code'];
    description = json['description'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['icon'] = this.icon;
    data['code'] = this.code;
    data['description'] = this.description;
    return data;
  }
}
