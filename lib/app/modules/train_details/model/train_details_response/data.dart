import 'package:freezed_annotation/freezed_annotation.dart';

import 'train.dart';

part 'data.freezed.dart';
part 'data.g.dart';

@freezed
class Data with _$Data {
  factory Data({
    List<Train>? trains,
    @JsonKey(name: 'selected_seat_class') String? selectedSeatClass,
  }) = _Data;

  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);
}
