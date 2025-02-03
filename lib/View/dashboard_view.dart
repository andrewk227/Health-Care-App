import 'package:el72ny/View/add_emergency_view.dart';
import 'package:el72ny/exports/pages.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class DashboardViewPage extends StatefulWidget {
  const DashboardViewPage({super.key});

  @override
  State<DashboardViewPage> createState() => _DashboardViewPageState();
}

class _DashboardViewPageState extends State<DashboardViewPage> {
  DashboardViewModel dashboardViewModel = DashboardViewModel();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        // scrolled under elevation elemenates the appbar color change
        scrolledUnderElevation: 0.0,
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: SvgPicture.asset('assets/icons/back_arrow.svg'),
        ),
      ),
      body: dashboardViewModel.pages[dashboardViewModel.pageIndex],
      bottomNavigationBar: ClipRRect(
        borderRadius: const BorderRadius.vertical(top: Radius.circular(40)),
        child: BottomNavigationBar(
            elevation: 0,
            backgroundColor: Colors.white,
            onTap: (index) {
              setState(() {
                dashboardViewModel.pageIndex = index;
              });
            },
            currentIndex: dashboardViewModel.pageIndex,
            items: [
              BottomNavigationBarItem(
                  label: '',
                  icon: dashboardViewModel.pageIndex == 0
                      ? chosenIcon(icon: 'notifications.svg')
                      : SvgPicture.asset('assets/icons/notifications.svg')),
              BottomNavigationBarItem(
                  label: '',
                  icon: dashboardViewModel.pageIndex == 1
                      ? chosenIcon(icon: 'home.svg')
                      : SvgPicture.asset(
                          'assets/icons/home.svg',
                          color: Colors.black,
                        )),
              BottomNavigationBarItem(
                  label: '',
                  icon: dashboardViewModel.pageIndex == 2
                      ? chosenIcon(icon: 'profile.svg')
                      : SvgPicture.asset('assets/icons/profile.svg')),
            ]),
      ),
      floatingActionButton: ElevatedButton(
          style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.all(0),
              backgroundColor: Colors.white,
              fixedSize: const Size(60, 60)),
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const AddEmergencyView(),
                ));
          },
          child: const Icon(Icons.add)),
    );
  }
}

class chosenIcon extends StatelessWidget {
  String icon;
  chosenIcon({super.key, required this.icon});
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 40,
      height: 40,
      decoration:
          const ShapeDecoration(shape: CircleBorder(), color: Colors.black),
      child: SvgPicture.asset(
        'assets/icons/$icon',
        width: 15,
        height: 15,
        color: Colors.white,
        fit: BoxFit.scaleDown,
      ),
    );
  }
}
