import 'package:fast_app_base/common/common.dart';
import 'package:fast_app_base/common/dart/extension/datetime_extension.dart';
import 'package:fast_app_base/common/data/preference/app_preferences.dart';
import 'package:fast_app_base/common/data/preference/prefs.dart';
import 'package:fast_app_base/common/widget/w_big_button.dart';
import 'package:fast_app_base/screen/main/tab/stock/setting/d_number.dart';
import 'package:flutter/material.dart';

import 'w_switch_menu.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({super.key});

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: '설정'.text.make()),
      body: ListView(
        children: [
          //  switch
          Obx(
            () => SwitchMenu(
              '푸시 설정',
              Prefs.isPushOnRx.get(),
              onChanged: (isOn) {
                Prefs.isPushOnRx.set(isOn);
                /*
                get package를 활용한 RxPreferenceItem를 사용하면,
                isPushOn이 SettingScreenState의 종속적인 변수가 아니라
                전역적으로 Prefs에 따른 한가지만 존재하는 변수로 관리하기 때문에 setState가 필요없어진다.
                setState((){
                  isPushOn = isOn;
                });
                */
              },
            ),
            //  BigButton('테스트', onTap: () => Nav.push(SettingScreen())),
          ),

          //  slider
          Obx(() => Slider(
              value: Prefs.sliderPosition.get(),
              onChanged: (value) {
                Prefs.sliderPosition.set(value);
              })),

          //  date time
          Obx(
            () => BigButton(
                '날짜 ${Prefs.birthday.get() == null ? "" : Prefs.birthday.get()?.formattedDate}',
                onTap: () async {
              final date = await showDatePicker(
                  context: context,
                  initialDate: DateTime.now(),
                  firstDate: DateTime.now().subtract(90.days),
                  lastDate: DateTime.now().add(90.days));
              if (date != null) {
                Prefs.birthday.set(date);
              }
            }),
          ),

          //  number
          Obx(
            () => BigButton(
                '저장된 숫자 ${Prefs.number.get()}',
                onTap: () async {
              final number = await NumberDialog().show();
              if (number != null) {
                Prefs.number.set(number);
              }
            }),
          ),
        ],
      ),
    );
  }
}
