import 'package:flutter/material.dart';
import 'package:nav/dialog/dialog.dart';
import 'package:nav/enum/enum_nav_ani.dart';

import 'vo/vo_notification.dart';
import 'w_notification_item.dart';

class NotificationDialog extends DialogWidget {
  final List<TtossNotification> notifications;

  NotificationDialog(this.notifications,
      {super.key,
      super.animation = NavAni.Bottom,
      super.barrierDismissible = false});

  @override
  DialogState<NotificationDialog> createState() => _NotificationDialogState();
}

class _NotificationDialogState extends DialogState<NotificationDialog> {
  @override
  Widget build(BuildContext context) {
    return Material(
      type: MaterialType.transparency,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          ...widget.notifications
              .map((element) => NotificationItemWidget(
                  onTap: () {
                    widget.hide();
                  },
                  notification: element))
              .toList()
        ],
      ),
    );
  }
}
