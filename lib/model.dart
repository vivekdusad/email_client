import 'package:json_annotation/json_annotation.dart';

part 'model.g.dart';

@JsonSerializable()
class Data {
  final String? title;
  final String? body;
  final String? url;

  Data(this.title, this.body,this.url);
  factory Data.fromJson(Map<String, dynamic> data) => _$DataFromJson(data);
  Map<String, dynamic> toJson(Data data) => _$DataToJson(data);
}
