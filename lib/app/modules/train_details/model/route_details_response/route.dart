import 'package:freezed_annotation/freezed_annotation.dart';

part 'route.freezed.dart';
part 'route.g.dart';

@freezed
class Route with _$Route {
  factory Route({
    String? city,
    @JsonKey(name: 'departure_time') String? departureTime,
    dynamic halt,
    dynamic duration,
    @JsonKey(name: 'arrival_time') dynamic arrivalTime,
  }) = _Route;

  factory Route.fromJson(Map<String, dynamic> json) => _$RouteFromJson(json);
}
