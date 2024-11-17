import 'package:freezed_annotation/freezed_annotation.dart';

part 'seat_counts.freezed.dart';
part 'seat_counts.g.dart';

@freezed
class SeatCounts with _$SeatCounts {
  factory SeatCounts({
    int? online,
    int? offline,
    @JsonKey(name: 'is_divided') bool? isDivided,
  }) = _SeatCounts;

  factory SeatCounts.fromJson(Map<String, dynamic> json) =>
      _$SeatCountsFromJson(json);
}
