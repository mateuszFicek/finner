import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:injectable/injectable.dart';

part 'app_settings_state.dart';

@singleton
class AppSettingsCubit extends HydratedCubit<AppSettingsState> {
  AppSettingsCubit() : super(InitialAppSettingsState());

  void setIntroductionAsDisplayed() {
    emit(DisplayedIntroductionState());
  }

  @override
  AppSettingsState fromJson(Map<String, dynamic> json) {
    if (json["didDisplayIntroduction"]) {
      return DisplayedIntroductionState();
    } else {
      return InitialAppSettingsState();
    }
  }

  @override
  Map<String, dynamic> toJson(AppSettingsState state) {
    return <String, dynamic>{
      'didDisplayIntroduction': state.didDisplayIntroduction
    };
  }
}
