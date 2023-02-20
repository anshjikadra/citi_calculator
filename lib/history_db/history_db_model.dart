import 'dart:convert';


 List<H_data> hisstory=[];
List<H_data> s_history=[];


class H_data {

  int? id;
  String history_data;
  String stor_time;
  // String value_data;
  // String? english;


  factory H_data.fromRawJson(String str) => H_data.fromJson(json.decode(str));
  String toRawJson() => json.encode(toJson());

  factory H_data.fromJson(Map<String, dynamic> json) => H_data(

    id:json["id"],
    history_data: json["save_history"].toString(),
    stor_time: json["save_time"].toString(),

  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "save_history":history_data,
    "save_time":stor_time,

  };
  H_data({this.id,required this.history_data,required this.stor_time});

}
