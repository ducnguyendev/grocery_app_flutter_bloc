import 'package:grocery_app/backbone/bloc_status.dart';
import 'package:grocery_app/backbone/dependency_injection.dart' as di;
import 'package:grocery_app/presentation/bloc/settings/bloc.dart';
import 'package:grocery_app/theme/text_styles.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final SettingsBloc settingsBloc = di.sl.get();

  @override
  void initState() {
    super.initState();
  }
  String? themeType;
  // final spots = [38000.0, 38567.1,37000.0,33000.0,40000.0,42000.0,39000.0]
  //     .map((x) => FlSpot(x, sin(x)))
  //     .toList();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          padding: EdgeInsets.all(16.w),
          width: 300.w,
          height: 160.h,
          decoration: BoxDecoration(
            color: Theme.of(context).primaryColor,
            borderRadius: BorderRadius.all(
              Radius.circular(16.r),
            ),
          ),
          child: BlocBuilder<SettingsBloc, SettingsState>(
            bloc: settingsBloc,
            builder: (_, SettingsState state) {
              if (BlocStatus.loaded == state.status) {
                themeType = state.themeType;
              }
              return Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  GestureDetector(
                    onTap: () {
                      if (themeType == 'night') {
                        settingsBloc
                            .add(const SettingsEvent.selectTheme('day'));
                      } else {
                        settingsBloc
                            .add(const SettingsEvent.selectTheme('night'));
                      }
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          themeType == 'night'
                              ? 'switch_to_day_mode'.tr()
                              : 'switch_to_night_mode'.tr(),
                          style: TextStyles.semiBold14
                              .copyWith(color: Theme.of(context).hintColor),
                        ),
                        Icon(
                          themeType == 'night'
                              ? CupertinoIcons.sun_max
                              : CupertinoIcons.moon,
                          color: Theme.of(context).hintColor,
                        )
                      ],
                    ),
                  ),

                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
