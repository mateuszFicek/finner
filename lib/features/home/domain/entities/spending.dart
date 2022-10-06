import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:finner/common/widgets/quick_action_button.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'spending.freezed.dart';
part 'spending.g.dart';

@freezed
class Spending with _$Spending {
  const Spending._();

  const factory Spending({
    required num amount,
    required String title,
    @JsonKey(fromJson: _dateFromJson, toJson: _dateToJson, name: "date")
        required DateTime date,
    required String type,
  }) = _Spending;

  SpendingType get spendingType {
    if (type == "Housing") {
      return SpendingType.HOME;
    }

    if (type == "Clothing") {
      return SpendingType.CLOTHING;
    }

    if (type == "Food") {
      return SpendingType.FOOD;
    }

    if (type == "Entertainment") {
      return SpendingType.ENTERTAINMENT;
    }

    if (type == "Transport") {
      return SpendingType.TRANSPORT;
    }

    return SpendingType.ALL;
  }

  @override
  factory Spending.fromJson(Map<String, Object?> json) =>
      _$SpendingFromJson(json);
}

DateTime _dateFromJson(Timestamp timestamp) =>
    DateTime.fromMillisecondsSinceEpoch(timestamp.millisecondsSinceEpoch);

Timestamp _dateToJson(DateTime date) => Timestamp.fromDate(date);
