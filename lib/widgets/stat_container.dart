import 'package:cobus/themes/colors.dart';
import 'package:flutter/material.dart';

class StatContainer extends StatefulWidget {
  const StatContainer({Key? key, required this.label, required this.icon})
      : super(key: key);

  final String label;
  final IconData icon;

  @override
  // ignore: library_private_types_in_public_api
  _StatContainerState createState() => _StatContainerState();
}

class _StatContainerState extends State<StatContainer>
    with SingleTickerProviderStateMixin {
  late bool isHovered;
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    isHovered = false;
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 150),
    );
    _animation = Tween<double>(begin: 1, end: 1.1).animate(_controller);
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => _onHover(true),
      onExit: (_) => _onHover(false),
      child: AnimatedBuilder(
        animation: _controller,
        builder: (context, child) {
          return Transform.scale(
            scale: _animation.value,
            child: Container(
              width: 250,
              height: 100,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: secondaryClr,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Center(
                    child: Icon(
                      widget.icon,
                      size: 35,
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Center(
                    child: Text(
                      widget.label,
                      style: const TextStyle(
                        fontFamily: 'Roboto',
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  void _onHover(bool hover) {
    setState(() {
      isHovered = hover;
      if (hover) {
        _controller.forward();
      } else {
        _controller.reverse();
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}