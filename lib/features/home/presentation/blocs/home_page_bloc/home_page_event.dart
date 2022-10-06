part of 'home_page_bloc.dart';

@freezed
class HomePageEvent with _$HomePageEvent {
  const factory HomePageEvent.started() = _Started;
  const factory HomePageEvent.load() = _Load;
  const factory HomePageEvent.setLimit(double limit) = _SetLimit;
  const factory HomePageEvent.addSpending(Spending spending) = _AddSpending;
}
