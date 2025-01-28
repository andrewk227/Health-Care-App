import 'package:flutter/material.dart';

class GoBackArrow extends StatelessWidget {
  const GoBackArrow({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 60,
      height: 60,
      child: ElevatedButton(
        onPressed: () {
          Navigator.pop(context);
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.black,
          foregroundColor: Colors.black,
          shape: const CircleBorder(),
          padding: EdgeInsets.zero,
        ),
        child: const Center(
          child: Icon(
            Icons.arrow_back,
            size: 30,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
