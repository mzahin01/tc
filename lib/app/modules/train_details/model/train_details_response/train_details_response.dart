import 'package:freezed_annotation/freezed_annotation.dart';

import 'data.dart';
import 'extra.dart';

part 'train_details_response.freezed.dart';
part 'train_details_response.g.dart';

@freezed
class TrainDetailsResponse with _$TrainDetailsResponse {
  factory TrainDetailsResponse({
    Data? data,
    Extra? extra,
  }) = _TrainDetailsResponse;

  factory TrainDetailsResponse.fromJson(Map<String, dynamic> json) =>
      _$TrainDetailsResponseFromJson(json);
}
