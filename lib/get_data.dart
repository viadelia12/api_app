import 'dart:convert';

Covid covidFromJson(String str) => Covid.fromJson(json.decode(str));

String covidToJson(Covid list_data) => json.encode(list_data.toJson());

class Covid{
  Covid({
    required this.key,
    required this.jumlah_kasus,
    required this.jumlah_sembuh,
    required this.jumlah_meninggal,
  });

  String key;
  int jumlah_kasus;
  int jumlah_sembuh;
  int jumlah_meninggal;

  factory Covid.fromJson(Map<String, dynamic> json) => Covid(
    key: json["key"],
    jumlah_kasus: json["jumlah_kasus"],
    jumlah_meninggal: json["jumlah_meninggal"],
    jumlah_sembuh: json["jumlah_sembuh"],
  );

  Map<String, dynamic> toJson() => {
    "key": key,
    "jumlah_kasus": jumlah_kasus,
    "jumlah_meninggal": jumlah_meninggal,
    "jumlah_sembuh": jumlah_sembuh,
  };
}