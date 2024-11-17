import 'package:freezed_annotation/freezed_annotation.dart';

part 'boarding_point.freezed.dart';
part 'boarding_point.g.dart';

@freezed
class BoardingPoint with _$BoardingPoint {
  factory BoardingPoint({
    @JsonKey(name: 'trip_point_id') int? tripPointId,
    @JsonKey(name: 'location_id') int? locationId,
    @JsonKey(name: 'location_name') String? locationName,
    @JsonKey(name: 'location_time') String? locationTime,
  }) = _BoardingPoint;

  factory BoardingPoint.fromJson(Map<String, dynamic> json) =>
      _$BoardingPointFromJson(json);
}
