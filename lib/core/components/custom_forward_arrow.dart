import 'package:flutter/material.dart';

class GoForwardArrow extends StatelessWidget {
  dynamic page;
  GoForwardArrow({
    super.key,
    required this.page,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 60,
      height: 60,
      child: ElevatedButton(
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => page));
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.black,
          foregroundColor: Colors.black,
          shape: const CircleBorder(),
          padding: EdgeInsets.zero,
        ),
        child: const Center(
          child: Icon(
            Icons.arrow_forward,
            size: 30,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
