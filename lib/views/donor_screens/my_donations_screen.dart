import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:zad/controllers/providers/theme_controller.dart';


class MyDonationsScreen extends StatefulWidget {
  const MyDonationsScreen({super.key});

  @override
  State<MyDonationsScreen> createState() => _MyDonationsScreenState();
}

class _MyDonationsScreenState extends State<MyDonationsScreen> {


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
      // TODO: Add list of user past donations
      body: Center(
        child: Text("My Donations"),
      )

    );
  }
}
