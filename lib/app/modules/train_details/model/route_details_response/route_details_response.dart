import 'package:freezed_annotation/freezed_annotation.dart';

import 'data.dart';

part 'route_details_response.freezed.dart';
part 'route_details_response.g.dart';

@freezed
class RouteDetailsResponse with _$RouteDetailsResponse {
  factory RouteDetailsResponse({
    Data? data,
  }) = _RouteDetailsResponse;

  factory RouteDetailsResponse.fromJson(Map<String, dynamic> json) =>
      _$RouteDetailsResponseFromJson(json);
}
