import 'package:el72ny/exports/widgets.dart';
import 'package:el72ny/exports/pages.dart';
import 'package:flutter/material.dart';

class PersonlaInformationViewPage extends StatefulWidget {
  const PersonlaInformationViewPage({super.key});

  @override
  State<PersonlaInformationViewPage> createState() =>
      _PersonlaInformationViewPageState();
}

class _PersonlaInformationViewPageState
    extends State<PersonlaInformationViewPage> {
  PersonalInformationsViewModel personalInformationsViewModel =
      PersonalInformationsViewModel();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            CustomText(
              text: personalInformationsViewModel.title,
            ),
            SizedBox(
              height: MediaQuery.sizeOf(context).height * 0.55,
              child: Column(
                children: [
                  CustomTextField(
                    label: 'First Name',
                    hintText: 'Enter your first name',
                    controller:
                        personalInformationsViewModel.firstNameController,
                  ),
                  CustomTextField(
                    label: 'Last Name',
                    hintText: 'Enter your last name',
                    controller:
                        personalInformationsViewModel.lastNameController,
                  ),
                  CustomTextField(
                    label: 'Age',
                    hintText: 'Enter your age',
                    controller: personalInformationsViewModel.ageController,
                  ),
                  CustomTextField(
                    label: 'Blood Type',
                    hintText: 'Enter your blood type',
                    controller:
                        personalInformationsViewModel.blodTypeController,
                  ),
                  CustomTextField(
                    label: 'BPM',
                    hintText: 'Enter BPM',
                    controller:
                        personalInformationsViewModel.bulsePerMinuteController,
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(vertical: 4),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'Please let us know your accessibility needs.\nDo you use a wheelchair?',
                          style: TextStyle(
                              fontFamily: "DM sans",
                              fontSize: 13,
                              fontWeight: FontWeight.w500),
                        ),
                        Checkbox(
                            activeColor: Colors.black,
                            value: personalInformationsViewModel.wheelChair,
                            onChanged: (bool? newValue) {
                              setState(() {
                                personalInformationsViewModel.wheelChair =
                                    newValue;
                              });
                            })
                      ],
                    ),
                  )
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Align(
                    alignment: Alignment.bottomRight, child: GoBackArrow()),
                Align(
                  alignment: Alignment.bottomLeft,
                  child:
                      GoForwardArrow(page: const HealthInformationsViewPage()),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
