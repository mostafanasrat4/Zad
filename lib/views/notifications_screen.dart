import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:zad/controllers/providers/theme_controller.dart';

class NotificationsScreen extends StatefulWidget {
  const NotificationsScreen({super.key});

  @override
  State<NotificationsScreen> createState() => _NotificationsScreenState();
}

class _NotificationsScreenState extends State<NotificationsScreen> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: context.watch<theme>().dark?
        CupertinoColors.darkBackgroundGray
            : CupertinoColors.extraLightBackgroundGray,
        appBar: AppBar(
          backgroundColor:
          context.watch<theme>().dark ? Colors.black : Colors.white,
          title: const Text(
            'My Donations',
          ),
          actions: [
            IconButton(
              icon: context.read<theme>().dark
                  ? const Icon(Icons.light_mode, color: Colors.yellow)
                  : const Icon(Icons.dark_mode, color: Colors.blueAccent),
              onPressed: () {
                context.read<theme>().changeTheme();
              },
            )
          ],
        ),
        // TODO: Add list of user notifications
        body: Center(
          child: Text("Notifications"),
        )

    );
  }
}
