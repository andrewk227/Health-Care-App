import 'package:el72ny/exports/pages.dart';
import 'package:flutter/material.dart';

class DashboardViewModel {
  int pageIndex = 1;

  TextEditingController dateController = TextEditingController();
  TextEditingController timeController = TextEditingController();
  TextEditingController valueController = TextEditingController();

  List pages = [
    const NotificationsListViewPage(),
    const HomeViewPage(),
    const ProfileViewPage(),
  ];
}
