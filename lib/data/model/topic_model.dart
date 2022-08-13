import 'package:flutter/cupertino.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';
part 'topic_model.freezed.dart';

part 'topic_model.g.dart';

@freezed
class Topic with _$Topic {
  const factory Topic({
    required String title,
    required String thumbnail,
    required String color,
    required String titleColor,
  }) = _Topic;
  factory Topic.fromJson(Map<String, Object?> json) => _$TopicFromJson(json);
}

extension GetColor on Topic {
  Color get bgColor => Color(int.parse(color));
  Color get textColor => Color(int.parse(titleColor));
}
