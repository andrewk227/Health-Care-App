import 'package:el72ny/exports/pages.dart';
import 'package:el72ny/exports/widgets.dart';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class HomeViewPage extends StatefulWidget {
  const HomeViewPage({super.key});

  @override
  State<HomeViewPage> createState() => _HomeViewPageState();
}

class _HomeViewPageState extends State<HomeViewPage> {
  late HomeViewModel homeViewModel;

  @override
  void initState() {
    super.initState();
    homeViewModel = HomeViewModel();
    homeViewModel.checkHeartRate(homeViewModel.heartRate);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CustomText(
                          text: 'Hello,',
                          fontSize: 30,
                          fontWeight: FontWeight.w500),
                      IconButton(
                        onPressed: () {
                          setState(() {
                            homeViewModel.updateHeartRate();
                            homeViewModel
                                .checkHeartRate(homeViewModel.heartRate);
                          });
                        },
                        icon: SvgPicture.asset(
                          'assets/icons/refresh.svg',
                          width: 30,
                          height: 30,
                        ),
                      )
                    ]),
                CustomText(
                  text: "Andrew",
                  fontSize: 48,
                ),
              ],
            ),

            // Warning Section
            Container(
              margin: const EdgeInsets.symmetric(vertical: 10.0),
              child: Row(
                children: [
                  SvgPicture.asset(
                    'assets/icons/${homeViewModel.warningIcon}',
                    width: 20,
                    height: 20,
                  ),
                  const SizedBox(width: 10),
                  CustomText(
                    text: homeViewModel.warningText,
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    textAlign: TextAlign.left,
                  )
                ],
              ),
            ),

            // GridView Section
            Expanded(
              child: GridView.count(
                crossAxisCount: 2,
                crossAxisSpacing: 6,
                mainAxisSpacing: 6,
                children: [
                  buildVitalSignsCard(
                    title: 'Blood Glucose',
                    icon: 'temperature.svg',
                    titleColor: Colors.red,
                    signNum: homeViewModel.heartRate,
                  ),
                  buildVitalSignsCard(
                    title: 'Blood Oxygen',
                    icon: 'lungs.svg',
                    titleColor: Colors.blue,
                    signNum: homeViewModel.heartRate,
                  ),
                  buildVitalSignsCard(
                    title: 'Blood Pressure',
                    icon: 'red_heart.svg',
                    titleColor: Colors.red,
                    signNum: homeViewModel.heartRate,
                  ),
                  buildVitalSignsCard(
                    title: 'Blood Temperature',
                    icon: 'temperature.svg',
                    titleColor: Colors.red,
                    signNum: homeViewModel.heartRate,
                  ),
                  buildVitalSignsCard(
                    title: 'Heart Rate',
                    icon: 'red_heart.svg',
                    titleColor: Colors.red,
                    signNum: homeViewModel.heartRate,
                  ),
                  buildVitalSignsCard(
                    title: 'HR Variability',
                    icon: 'red_heart.svg',
                    titleColor: Colors.red,
                    signNum: homeViewModel.heartRate,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Widget buildVitalSignsCard({
  required String title,
  required String icon,
  required Color titleColor,
  required int signNum,
}) {
  return InkWell(
    onTap: () {},
    child: Container(
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: const Color.fromRGBO(240, 242, 244, 1),
        borderRadius: BorderRadius.circular(16.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              SvgPicture.asset(
                'assets/icons/$icon',
                color: titleColor,
                width: 16,
                height: 16,
              ),
              const SizedBox(width: 2),
              CustomText(
                  text: title, fontSize: 11, fontWeight: FontWeight.bold),
            ],
          ),
          Row(
            children: [
              CustomText(text: 'Latest', fontSize: 12, color: Colors.grey),
              const SizedBox(width: 5),
              CustomText(
                text: '17 Jan',
                fontSize: 12,
              ),
            ],
          ),
          CustomText(
            text: signNum.toString(),
            fontWeight: FontWeight.bold,
          ),
        ],
      ),
    ),
  );
}

class VitalSignsSheet extends StatelessWidget {
  String title;
  TextEditingController dateController;
  TextEditingController timeController;
  TextEditingController valeuController;

  VitalSignsSheet(
      {super.key,
      required this.title,
      required this.dateController,
      required this.timeController,
      required this.valeuController});

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.symmetric(vertical: 16),
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(40)),
        width: double.infinity,
        height: MediaQuery.sizeOf(context).height * 0.5,
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text('cancel',
                      style: TextStyle(
                          color: Colors.blue,
                          fontFamily: 'DM sans',
                          fontSize: 16,
                          fontWeight: FontWeight.w500)),
                ),
                CustomText(
                  text: title,
                  fontSize: 20,
                ),
                TextButton(
                  onPressed: () {},
                  child: const Text('Add',
                      style: TextStyle(
                          color: Colors.grey,
                          fontFamily: 'DM sans',
                          fontSize: 16,
                          fontWeight: FontWeight.w500)),
                )
              ],
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                children: [
                  CustomTextField(
                      label: "Date", hintText: '', controller: dateController),
                  CustomTextField(
                      label: "Time", hintText: '', controller: timeController),
                  CustomTextField(
                      label: "Value",
                      hintText: '',
                      controller: valeuController),
                ],
              ),
            ),
          ],
        ));
  }
}
