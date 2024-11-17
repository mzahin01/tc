import 'package:freezed_annotation/freezed_annotation.dart';

import 'seat_counts.dart';

part 'seat_type.freezed.dart';
part 'seat_type.g.dart';

@freezed
class SeatType with _$SeatType {
  factory SeatType({
    int? key,
    String? type,
    @JsonKey(name: 'trip_id') int? tripId,
    @JsonKey(name: 'trip_route_id') int? tripRouteId,
    @JsonKey(name: 'route_id') int? routeId,
    String? fare,
    @JsonKey(name: 'vat_percent') int? vatPercent,
    @JsonKey(name: 'vat_amount') int? vatAmount,
    @JsonKey(name: 'seat_counts') SeatCounts? seatCounts,
  }) = _SeatType;

  factory SeatType.fromJson(Map<String, dynamic> json) =>
      _$SeatTypeFromJson(json);
}
