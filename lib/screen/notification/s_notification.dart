import 'package:fast_app_base/common/dart/extension/context_extension.dart';
import 'package:fast_app_base/screen/notification/notification_dummy.dart';
import 'package:fast_app_base/screen/notification/w_notification_item.dart';
import 'package:flutter/material.dart';

import '../../common/constant/app_colors.dart';
import 'd_notification.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({super.key});

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.veryDarkGrey,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            title: Text("알림"),
            backgroundColor: context.appColors.appBarBackground,
          ),
          SliverList(
              delegate: SliverChildBuilderDelegate(
                  (context, index) => NotificationItemWidget(
                        notification: notificationDummies[index],
                        onTap: () {
                          //  NotificationDialog([notificationDummies[0], notificationDummies[1]]).show();
                          setState(() {
                            notificationDummies[index].isRead = true;
                            NotificationDialog([notificationDummies[index]]).show();
                          });
                        },
                      ),
                  childCount: notificationDummies.length)),
        ],
      ),
    );
  }
}
