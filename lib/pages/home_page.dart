// ignore: avoid_web_libraries_in_flutter
import 'dart:html';
import 'package:cobus/themes/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

/*
icons at the top of the screen get bigger when hover
add more opacity to the big container
make second half of screen other color
*/

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundClr,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 25, left: 50),
                child: GestureDetector(
                  onTap: () {
                    Get.to(() => const HomePage());
                  },
                  child: const Icon(
                    Icons.person,
                    size: 48,
                    color: primaryClr,
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 35, right: 40),
                    child: GestureDetector(
                      onTap: () {
                        downloadFile("images/CV.pdf");
                      },
                      child: const Icon(
                        Icons.download,
                        size: 48,
                        color: primaryClr,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 25, right: 50),
                    child: GestureDetector(
                      onTap: () => _launchUrl(),
                      child: Image.asset(
                        "images/LinkedIn.png",
                        color: primaryClr,
                        width: 44,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
          Center(
            child: Image.asset(
              "images/Person.png",
            ),
          ),
          Center(
            child: Container(
              width: MediaQuery.of(context).size.width - 800,
              height: 170,
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.4),
                    spreadRadius: 2,
                    blurRadius: 4,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: 1,
                  ),
                  StatContainer(
                    label: "Logistics",
                  ),
                  StatContainer(
                    label: "BCom",
                  ),
                  StatContainer(
                    label: "Supply Chain",
                  ),
                  SizedBox(
                    width: 1,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  final Uri _url =
      Uri.parse('https://www.linkedin.com/in/cobus-bothma-335a482a0/');

  Future<void> _launchUrl() async {
    // ignore: deprecated_member_use
    if (await canLaunch(_url.toString())) {
      // ignore: deprecated_member_use
      await launch(_url.toString());
    } else {
      throw Exception('Could not launch $_url');
    }
  }

  void downloadFile(url) {
    AnchorElement anchorElement = AnchorElement(href: url);
    anchorElement.download = "Cobus Bothma Resume";
    anchorElement.click();
  }
}

class StatContainer extends StatelessWidget {
  const StatContainer({super.key, required this.label});

  final String label;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 250,
      height: 100,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(
          Radius.circular(
            10,
          ),
        ),
        color: secondaryClr,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Text(
              label,
              style: TextStyle(
                fontFamily: GoogleFonts.roboto().fontFamily,
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
