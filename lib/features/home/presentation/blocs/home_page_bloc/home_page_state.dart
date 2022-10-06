part of 'home_page_bloc.dart';

@freezed
class HomePageState with _$HomePageState {
  const factory HomePageState.initial() = _Initial;
  const factory HomePageState.loading(HomePageViewModel model) = _Loading;
  const factory HomePageState.loaded(HomePageViewModel model) = _Loaded;
}
