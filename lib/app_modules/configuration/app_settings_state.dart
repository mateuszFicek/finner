part of 'app_settings_cubit.dart';

abstract class AppSettingsState {
  final bool didDisplayIntroduction;

  AppSettingsState(this.didDisplayIntroduction);
}

class InitialAppSettingsState extends AppSettingsState {
  InitialAppSettingsState() : super(false);
}

class DisplayedIntroductionState extends AppSettingsState {
  DisplayedIntroductionState() : super(true);
}
