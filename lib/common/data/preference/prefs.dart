import 'package:fast_app_base/common/theme/custom_theme.dart';

import 'item/nullable_preference_item.dart';
import 'item/preference_item.dart';
import 'item/rx_preference_item.dart';
import 'item/rxn_preference_item.dart';

class Prefs {
  static final appTheme = NullablePreferenceItem<CustomTheme>('appTheme');
  static final isPushOn = PreferenceItem<bool>('isPushOn', false);

  static final settingNumber = PreferenceItem<int>('settingNumber', 10);
  static final settingDouble = PreferenceItem<double>('settingDouble', 22.55);
  static final settingString = PreferenceItem<String>('settingString', 'value');
  static final settingNullableString = NullablePreferenceItem<String>('settingNullableString');

  static final isPushOnRx = RxPreferenceItem<bool, RxBool>('isPushOnRx', false);
  static final sliderPosition = RxPreferenceItem<double, RxDouble>('sliderPosition', 0.0);
  static final birthday = RxnPreferenceItem<DateTime, Rxn<DateTime>>('birthday');
  static final number = RxPreferenceItem<int, RxInt>('number', 0);
}
