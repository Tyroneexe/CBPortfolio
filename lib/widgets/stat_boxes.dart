import 'package:cobus/themes/colors.dart';
import 'package:flutter/material.dart';

class StatBox extends StatefulWidget {
  const StatBox({
    Key? key,
  }) : super(key: key);

  @override
  _StatBoxState createState() => _StatBoxState();
}

class _StatBoxState extends State<StatBox> {
  bool isHovered1 = false;
  bool isHovered2 = false;
  bool isHovered3 = false;

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
          isHovered1,
          (value) {
            setState(() {
              isHovered1 = value;
            });
          },
        ),
        _buildContainer(
          "images/NWUlogo.png",
          isHovered2,
          (value) {
            setState(() {
              isHovered2 = value;
            });
          },
        ),
        _buildContainer(
          "images/LinkedInLogo.png",
          isHovered3,
          (value) {
            setState(() {
              isHovered3 = value;
            });
          },
        ),
        const SizedBox(
          width: 1,
        ),
      ],
    );
  }

  Widget _buildContainer(
      String imagePath, bool isHovered, ValueChanged<bool> onChanged) {
    return MouseRegion(
      onEnter: (_) => onChanged(true),
      onExit: (_) => onChanged(false),
      child: TweenAnimationBuilder<double>(
        duration: const Duration(milliseconds: 300),
        tween: Tween<double>(begin: 1.0, end: isHovered ? 1.1 : 1.0),
        builder: (_, scale, __) {
          return Transform.scale(
            scale: scale,
            child: Container(
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
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
