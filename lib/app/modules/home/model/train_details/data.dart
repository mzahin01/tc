import 'package:freezed_annotation/freezed_annotation.dart';

import 'route.dart';

part 'data.freezed.dart';
part 'data.g.dart';

@freezed
class Data with _$Data {
  factory Data({
    List<String>? days,
    List<Route>? routes,
    @JsonKey(name: 'total_duration') String? totalDuration,
    @JsonKey(name: 'train_name') String? trainName,
  }) = _Data;

  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);
}
