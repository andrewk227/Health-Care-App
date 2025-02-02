import 'package:el72ny/exports/widgets.dart';
import 'package:el72ny/exports/pages.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ProfileViewPage extends StatefulWidget {
  const ProfileViewPage({super.key});

  @override
  State<ProfileViewPage> createState() => _ProfileViewPageState();
}

class _ProfileViewPageState extends State<ProfileViewPage> {
  ProfileViewModel profileViewModel = ProfileViewModel();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(30.0),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Center(
                  child: GestureDetector(
                      onTap: () {},
                      child: CircleAvatar(
                        radius: 50,
                        backgroundColor: Colors.grey[100],
                        child: SvgPicture.asset('assets/icons/profile.svg',
                            width: 50, height: 50, fit: BoxFit.contain),
                      )),
                ),
                Container(
                  margin: const EdgeInsets.symmetric(vertical: 10),
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CustomTextField(
                          label: 'First Name',
                          hintText: 'Edit your first name',
                          controller: profileViewModel.firstNameController,
                          validator: (value) => value!.isEmpty
                              ? 'Please enter your first name'
                              : null,
                          onSaved: (value) =>
                              profileViewModel.userProfile.firstName = value!,
                        ),
                        CustomTextField(
                          label: 'Last Name',
                          hintText: 'Edit your last name',
                          controller: profileViewModel.lastNameController,
                          validator: (value) => value!.isEmpty
                              ? 'Please enter your last name'
                              : null,
                          onSaved: (value) =>
                              profileViewModel.userProfile.lastName = value!,
                        ),
                        CustomTextField(
                          label: 'Age',
                          hintText: 'Edit your age',
                          controller: profileViewModel.ageController,
                          validator: (value) =>
                              value!.isEmpty ? 'Please enter your age' : null,
                          onSaved: (value) => profileViewModel.userProfile.age =
                              int.parse(value!),
                          keyboardType: TextInputType.number,
                        ),
                        CustomTextField(
                          label: 'Blood type',
                          hintText: 'Edit your blood type',
                          controller: profileViewModel.bloodTypeController,
                          validator: (value) => value!.isEmpty
                              ? 'Please enter your blood type'
                              : null,
                          onSaved: (value) =>
                              profileViewModel.userProfile.bloodType = value!,
                        ),
                        CustomTextField(
                          label: 'BPM',
                          hintText: 'Edit your BPM',
                          controller: profileViewModel.bulsePerMinuteController,
                          validator: (value) =>
                              value!.isEmpty ? 'Please enter your BPM' : null,
                          onSaved: (value) => profileViewModel.userProfile.bpm =
                              int.parse(value!),
                          keyboardType: TextInputType.number,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              width: MediaQuery.sizeOf(context).width * 0.4,
                              height: 50,
                              margin: const EdgeInsets.only(top: 20),
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.black,
                                ),
                                onPressed: () {
                                  if (_formKey.currentState!.validate()) {
                                    _formKey.currentState!.save();
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      const SnackBar(
                                          margin: EdgeInsets.all(20),
                                          behavior: SnackBarBehavior.floating,
                                          content: Text(
                                              'Profile updated successfully!')),
                                    );
                                  }
                                },
                                child: const Text(
                                  'Save',
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                            ),
                            Container(
                              width: MediaQuery.sizeOf(context).width * 0.4,
                              height: 50,
                              margin: const EdgeInsets.only(top: 20),
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor:
                                      const Color.fromARGB(255, 173, 0, 0),
                                ),
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            const DashboardViewPage(),
                                      ));
                                },
                                child: const Text(
                                  'Cancel',
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ]),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
