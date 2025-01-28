import 'package:flutter/material.dart';

class NotificationsListViewPage extends StatefulWidget {
  const NotificationsListViewPage({super.key});

  @override
  State<NotificationsListViewPage> createState() =>
      _NotificationsListViewPageState();
}

class _NotificationsListViewPageState extends State<NotificationsListViewPage> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.white,
      body: Center(child: Text('Notifications')),
    );
  }
}
