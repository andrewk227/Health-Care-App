import 'package:el72ny/exports/pages.dart';
import 'package:el72ny/exports/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HealthInformationsViewPage extends StatefulWidget {
  const HealthInformationsViewPage({super.key});

  @override
  State<HealthInformationsViewPage> createState() =>
      _HealthInformationsViewPageState();
}

class _HealthInformationsViewPageState
    extends State<HealthInformationsViewPage> {
  HealthInformationsViewModel healthInformationsViewModel =
      HealthInformationsViewModel();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Padding(
          padding: const EdgeInsets.all(30.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              CustomText(text: healthInformationsViewModel.title),
              Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
                _buildGenderOption('Male', 'male'),
                _buildGenderOption('Female', 'female'),
              ]),
              Align(
                alignment: Alignment.centerLeft,
                child: CustomText(
                  text: healthInformationsViewModel.heightTitle,
                  fontSize: 20,
                ),
              ),
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SvgPicture.asset(
                            'assets/icons/male.svg',
                            width: 15,
                            height: 20,
                            fit: BoxFit.scaleDown,
                          ),
                          CustomText(
                            text:
                                "${healthInformationsViewModel.heightValue.round()}cm",
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                          SvgPicture.asset(
                            'assets/icons/male.svg',
                            width: 10,
                            height: 35,
                            fit: BoxFit.scaleDown,
                          )
                        ]),
                  ),
                  SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                      thumbShape: CustomCircleThumbShape(),
                      trackHeight: 1,
                      activeTrackColor: const Color.fromRGBO(6, 20, 40, 0.15),
                      inactiveTrackColor: const Color.fromRGBO(6, 20, 40, 0.15),
                    ),
                    child: Slider(
                        label:
                            "${healthInformationsViewModel.heightValue.round()}cm",
                        value: healthInformationsViewModel.heightValue,
                        min: 50,
                        max: 500,
                        onChanged: (value) {
                          setState(() {
                            healthInformationsViewModel.heightValue = value;
                          });
                        }),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CustomText(
                            text: healthInformationsViewModel.heightMin,
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                          CustomText(
                            text: healthInformationsViewModel.heightMax,
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                        ]),
                  ),
                ],
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: CustomText(
                  text: healthInformationsViewModel.weightTitle,
                  fontSize: 20,
                ),
              ),
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SvgPicture.asset(
                            'assets/icons/male.svg',
                            width: 14,
                            height: 28,
                            fit: BoxFit.scaleDown,
                          ),
                          CustomText(
                            text:
                                "${healthInformationsViewModel.weigthValue.round()}kg",
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                          SvgPicture.asset(
                            'assets/icons/fat_male.svg',
                            width: 23,
                            height: 35,
                            fit: BoxFit.scaleDown,
                          )
                        ]),
                  ),
                  SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                      thumbShape: CustomCircleThumbShape(),
                      trackHeight: 1,
                      activeTrackColor: const Color.fromRGBO(6, 20, 40, 0.15),
                      inactiveTrackColor: const Color.fromRGBO(6, 20, 40, 0.15),
                    ),
                    child: Slider(
                        label:
                            "${healthInformationsViewModel.weigthValue.round()}cm",
                        value: healthInformationsViewModel.weigthValue,
                        min: 20,
                        max: 200,
                        onChanged: (value) {
                          setState(() {
                            healthInformationsViewModel.weigthValue = value;
                          });
                        }),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CustomText(
                            text: healthInformationsViewModel.weightMin,
                            fontWeight: FontWeight.w500,
                            fontSize: 16,
                          ),
                          CustomText(
                            text: healthInformationsViewModel.weightMax,
                            fontWeight: FontWeight.w500,
                            fontSize: 16,
                          ),
                        ]),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Align(
                    alignment: Alignment.bottomRight,
                    child: GoBackArrow(),
                  ),
                  Align(
                    alignment: Alignment.bottomLeft,
                    child: GoForwardArrow(
                      page: const DashboardViewPage(),
                    ),
                  ),
                ],
              )
            ],
          ),
        ));
  }

  Widget _buildGenderOption(String gender, String icon) {
    bool isSelected = healthInformationsViewModel.selectedGender == gender;
    return GestureDetector(
      onTap: () {
        setState(() {
          healthInformationsViewModel.selectedGender = gender;
        });
      },
      child: Column(
        children: [
          Container(
            width: 132,
            height: 132,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: isSelected
                  ? const Color.fromRGBO(240, 242, 244, 1)
                  : Colors.white,
              border: Border.all(
                color: const Color.fromRGBO(240, 242, 244, 1),
                width: 2,
              ),
            ),
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: SvgPicture.asset(
              'assets/icons/$icon.svg',
              width: 30,
              height: 70,
              fit: BoxFit.scaleDown,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            gender,
            style: const TextStyle(
              color: Colors.black,
            ),
          ),
        ],
      ),
    );
  }
}

class CustomCircleThumbShape extends SliderComponentShape {
  @override
  Size getPreferredSize(bool isEnabled, bool isDiscrete) {
    return const Size(24, 24);
  }

  @override
  @override
  void paint(
    PaintingContext context,
    Offset center, {
    required Animation<double> activationAnimation,
    required Animation<double> enableAnimation,
    required bool isDiscrete,
    required TextPainter labelPainter,
    required RenderBox parentBox,
    required SliderThemeData sliderTheme,
    required TextDirection textDirection,
    required double textScaleFactor,
    required double value,
    required Size sizeWithOverflow,
  }) {
    final Canvas canvas = context.canvas;

    // Draw outer circle (dark border)
    final Paint outerPaint = Paint()
      ..color = Colors.black
      ..style = PaintingStyle.stroke
      ..strokeWidth = 3;

    // Draw inner circle (white fill)
    final Paint innerPaint = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.fill;

    // Draw circles
    canvas.drawCircle(center, 12, outerPaint); // Outer circle
    canvas.drawCircle(center, 10, innerPaint); // Inner circle
  }
}
