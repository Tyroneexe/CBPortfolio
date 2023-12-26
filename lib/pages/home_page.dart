// ignore: avoid_web_libraries_in_flutter
import 'dart:html' as html;
import 'dart:ui';
import 'package:cobus/themes/colors.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

/*
*/

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    double statBoxWidth = MediaQuery.of(context).size.width - 700;
    //!!!!
    return Scaffold(
      backgroundColor: foregroundClr,
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              clipBehavior: Clip.none,
              children: [
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height / 1.35,
                  decoration: const BoxDecoration(
                    color: backgroundClr,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: 25,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          GestureDetector(
                            onTap: () {
                              refreshScreen();
                            },
                            child: const Row(
                              children: [
                                SizedBox(
                                  width: 50,
                                ),
                                Icon(
                                  Icons.person,
                                  size: 44,
                                  color: primaryClr,
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Text(
                                  "Cobus",
                                  style: TextStyle(
                                    fontFamily: "Roboto",
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                    fontSize: 35,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(
                            width: 170,
                          ),
                          const Column(
                            children: [
                              SizedBox(
                                height: 12,
                              ),
                              Row(
                                children: [
                                  Text(
                                    "Home",
                                    style: TextStyle(
                                      fontFamily: "Roboto",
                                      fontSize: 22,
                                      fontWeight: FontWeight.w500,
                                      color: primaryClr,
                                    ),
                                  ),
                                  SizedBox(
                                    width: 40,
                                  ),
                                  Text(
                                    "References",
                                    style: TextStyle(
                                      fontFamily: "Roboto",
                                      fontSize: 22,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.white54,
                                    ),
                                  ),
                                  SizedBox(
                                    width: 40,
                                  ),
                                  Text(
                                    "About",
                                    style: TextStyle(
                                      fontFamily: "Roboto",
                                      fontSize: 22,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.white54,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          const Expanded(
                            child: SizedBox(
                              width: 1,
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              downloadFile("images/CV.pdf");
                            },
                            child: const Icon(
                              Icons.sim_card_download_rounded,
                              size: 38,
                              color: Colors.white70,
                            ),
                          ),
                          const SizedBox(
                            width: 30,
                          ),
                          GestureDetector(
                            onTap: () {
                              _launchUrl();
                            },
                            child: Image.asset(
                              "images/LinkedIn.png",
                              color: Colors.white70,
                              width: 36,
                              height: 36,
                            ),
                          ),
                          const SizedBox(
                            width: 30,
                          ),
                          const Icon(
                            Icons.menu_rounded,
                            size: 42,
                            color: Colors.white70,
                          ),
                          const SizedBox(
                            width: 50,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Positioned(
                  left: (MediaQuery.of(context).size.width / 2) - (600 / 2),
                  top: 100,
                  child: Container(
                    width: 600,
                    height: 600,
                    decoration: const BoxDecoration(
                      color: darkGrey,
                      shape: BoxShape.circle,
                    ),
                    child: ClipRect(
                      child: BackdropFilter(
                        filter: ImageFilter.blur(
                          sigmaX: 5,
                          sigmaY: 5,
                        ),
                        child: Container(
                          color: Colors.transparent,
                        ),
                      ),
                    ),
                  ),
                ),
                Positioned(
                  left: (MediaQuery.of(context).size.width / 2) - (512 / 2),
                  top: 150,
                  child: Image.asset(
                    "images/Person.png",
                  ),
                ),
                Positioned(
                  left:
                      MediaQuery.of(context).size.width / 2 - statBoxWidth / 2,
                  top: 650,
                  child: Container(
                    decoration: const BoxDecoration(
                      color: lightGrey,
                    ),
                    width: statBoxWidth,
                    height: 200,
                  ),
                ),
              ],
            ),
          ],
        ),
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
    html.AnchorElement anchorElement = html.AnchorElement(href: url);
    anchorElement.download = "Cobus Bothma Resume";
    anchorElement.click();
  }

  void refreshScreen() {
    html.window.location.reload();
  }
}
