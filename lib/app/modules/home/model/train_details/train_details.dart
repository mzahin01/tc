import 'package:freezed_annotation/freezed_annotation.dart';

import 'data.dart';
import 'extra.dart';

part 'train_details.freezed.dart';
part 'train_details.g.dart';

@freezed
class TrainDetails with _$TrainDetails {
  factory TrainDetails({
    Data? data,
    Extra? extra,
  }) = _TrainDetails;

  factory TrainDetails.fromJson(Map<String, dynamic> json) =>
      _$TrainDetailsFromJson(json);
}
