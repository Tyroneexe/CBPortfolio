import 'package:cobus/themes/colors.dart';
import 'package:flutter/material.dart';

class StatBox extends StatelessWidget {
  const StatBox({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const SizedBox(
          width: 1,
        ),
        _buildContainer(
          "images/FiverrImage.png",
        ),
        _buildContainer(
          "images/NWUlogo.png",
          const Color(
            0xFF722a82,
          ),
        ),
        _buildContainer(
          "images/LinkedInLogo.png",
        ),
        const SizedBox(
          width: 1,
        ),
      ],
    );
  }

  _buildContainer(String imagePath, [Color? color]) {
    return Container(
      height: 90,
      width: 300,
      decoration: BoxDecoration(
        color: greyClr,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 5,
            offset: const Offset(
              0,
              3,
            ),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Image.asset(
          imagePath,
          color: color,
        ),
      ),
    );
  }
}
