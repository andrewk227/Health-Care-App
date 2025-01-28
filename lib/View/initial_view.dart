import 'package:el72ny/exports/pages.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:el72ny/exports/widgets.dart';

class InitialViewPage extends StatefulWidget {
  const InitialViewPage({super.key});

  @override
  State<InitialViewPage> createState() => _InitialViewPageState();
}

class _InitialViewPageState extends State<InitialViewPage> {
  InitialViewModel initialViewModel = InitialViewModel();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(40.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            SvgPicture.asset(
              'assets/icons/${initialViewModel.initialLogo}',
              width: double.infinity,
              height: MediaQuery.of(context).size.height * 0.5,
              fit: BoxFit.contain,
            ),
            CustomText(
              text: initialViewModel.initialTitle,
              fontSize: 36,
              textAlign: TextAlign.left,
            ),
            Align(
              alignment: Alignment.bottomRight,
              child: GoForwardArrow(page: const PersonlaInformationViewPage()),
            )
          ],
        ),
      ),
    );
  }
}
