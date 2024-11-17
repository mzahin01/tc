import 'package:freezed_annotation/freezed_annotation.dart';

import 'boarding_point.dart';
import 'seat_type.dart';

part 'train.freezed.dart';
part 'train.g.dart';

@freezed
class Train with _$Train {
  factory Train({
    @JsonKey(name: 'trip_number') String? tripNumber,
    @JsonKey(name: 'departure_date_time') String? departureDateTime,
    @JsonKey(name: 'departure_full_date') String? departureFullDate,
    @JsonKey(name: 'departure_date_time_jd') String? departureDateTimeJd,
    @JsonKey(name: 'arrival_date_time') String? arrivalDateTime,
    @JsonKey(name: 'travel_time') String? travelTime,
    @JsonKey(name: 'origin_city_name') String? originCityName,
    @JsonKey(name: 'destination_city_name') String? destinationCityName,
    @JsonKey(name: 'seat_types') List<SeatType>? seatTypes,
    @JsonKey(name: 'train_model') String? trainModel,
    @JsonKey(name: 'is_open_for_all') bool? isOpenForAll,
    @JsonKey(name: 'is_eid_trip') int? isEidTrip,
    @JsonKey(name: 'boarding_points') List<BoardingPoint>? boardingPoints,
    @JsonKey(name: 'is_international') int? isInternational,
    @JsonKey(name: 'is_from_city_international') bool? isFromCityInternational,
  }) = _Train;

  factory Train.fromJson(Map<String, dynamic> json) => _$TrainFromJson(json);
}
