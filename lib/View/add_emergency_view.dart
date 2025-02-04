import 'package:el72ny/core/components/custom_text_field_without_label.dart';
import 'package:el72ny/exports/widgets.dart';
import 'package:el72ny/exports/pages.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class AddEmergencyView extends StatefulWidget {
  const AddEmergencyView({super.key});

  @override
  State<AddEmergencyView> createState() => _AddEmergencyViewState();
}

class _AddEmergencyViewState extends State<AddEmergencyView> {
  AddEmergencyViewModel addEmergencyViewModel = AddEmergencyViewModel();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    Widget alert = AlertDialog(
      icon: SvgPicture.asset("assets/icons/warning.svg"),
      title: CustomText(
        text: "Warning",
        fontSize: 24,
      ),
      content: CustomText(
        text:
            "Please choose call, sms or both to make sure that the mobile phone added successfully!!",
        fontSize: 14,
      ),
      actions: [
        TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: CustomText(
              text: "ok",
              fontSize: 16,
            ))
      ],
    );

    return Scaffold(
        resizeToAvoidBottomInset: false,
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
        body: Padding(
          padding: const EdgeInsets.all(30.0),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  margin: const EdgeInsets.symmetric(vertical: 10),
                  height: MediaQuery.sizeOf(context).height * 0.5,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CustomText(
                        text:
                            'We Want you safe\nplease provide the numbers you can ask for help',
                        textAlign: TextAlign.start,
                      ),
                      CustomTextFieldWithoutLabel(
                        keyboardType: TextInputType.phone,
                        hintText: "Mobile Number",
                        controller:
                            addEmergencyViewModel.moibleNumberController,
                        validator: (value) => value!.isEmpty
                            ? 'Please enter mobile number'
                            : null,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              CustomText(
                                text: "Emergency Call",
                                fontSize: 14,
                              ),
                              Checkbox(
                                  activeColor: Colors.black,
                                  value: addEmergencyViewModel.callCheckBox,
                                  onChanged: (bool? newValue) {
                                    setState(() {
                                      addEmergencyViewModel.callCheckBox =
                                          newValue!;
                                      //userProfile.callList.append()
                                    });
                                  })
                            ],
                          ),
                          Row(
                            children: [
                              CustomText(
                                text: "Emergency SMS",
                                fontSize: 14,
                              ),
                              Checkbox(
                                  activeColor: Colors.black,
                                  value: addEmergencyViewModel.smsCheckBox,
                                  onChanged: (bool? newValue) {
                                    setState(() {
                                      addEmergencyViewModel.smsCheckBox =
                                          newValue!;
                                      //userProfile.smsList.append()
                                    });
                                  })
                            ],
                          )
                        ],
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 50,
                  width: double.infinity,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.black,
                    ),
                    onPressed: () {
                      if (_formKey.currentState!.validate() &&
                          (addEmergencyViewModel.smsCheckBox ||
                              addEmergencyViewModel.callCheckBox)) {
                        _formKey.currentState!.save();
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                              margin: EdgeInsets.all(20),
                              behavior: SnackBarBehavior.floating,
                              content:
                                  Text('Mobile Number added successfully!')),
                        );
                      } else if (addEmergencyViewModel.callCheckBox == false &&
                          addEmergencyViewModel.smsCheckBox == false) {
                        showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return alert;
                            });
                      }
                    },
                    child: const Text(
                      'Save',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
