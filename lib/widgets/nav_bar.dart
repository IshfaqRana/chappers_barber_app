import 'package:chappers/const/helper.dart';
import 'package:chappers/screens/available_slots.dart';
import 'package:chappers/screens/chat.dart';
import 'package:chappers/screens/main_screen.dart';
import 'package:chappers/screens/notifications.dart';
import 'package:chappers/screens/profile.dart';
import 'package:chappers/screens/stylist_profile.dart';
import 'package:chappers/screens/user_location.dart';
import 'package:clip_shadow/clip_shadow.dart';
import 'package:flutter/material.dart';

import '../const/colors.dart';

class NavBar extends StatelessWidget {
  final bool home;
  final bool menu;
  final bool offer;
  final bool profile;
  final bool more;

  const NavBar(
      {Key? key,
        this.home = false,
        this.menu = false,
        this.offer = false,
        this.profile = false,
        this.more = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Container(
      height: 120,
      color: Colors.white,
      width: Helper.getScreenWidth(context),
      child: Stack(
        children: [
          Align(
            alignment: Alignment.bottomCenter,
            child: ClipShadow(
              boxShadow: [
                BoxShadow(
                  color: AppColor.placeholder,
                  offset: Offset(
                    0,
                    -5,
                  ),
                  blurRadius: 10,
                ),
              ],
              clipper: CustomNavBarClipper(),
              child: Container(
                height: 80,
                width: Helper.getScreenWidth(context),
                padding: const EdgeInsets.symmetric(horizontal: 20),
                color: Colors.redAccent,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () {
                        if (!menu) {

                          Navigator.push(context,
                            MaterialPageRoute(builder: (context)=> ChatPage()),);

                        }
                      },
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          menu
                              ?  SizedBox(
                            width: width*0.11,
                            height: height*0.05,

                              child:Icon(Icons.chat_rounded,size: 40,color: Colors.black,)

                          )
                              : SizedBox(
                            width: width*0.1,
                            height: height*0.04,

                            child:Icon(Icons.chat_rounded,size: 40,color: Colors.black,)

                          )

                        ],
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        if (!offer) {
                          Navigator.of(context)
                              .pushReplacementNamed(SlotsScreen.routeName);
                        }
                      },
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          offer
                              ? SizedBox(
                              width: width*0.11,
                              height: height*0.05,

                              child: Icon(
                                Icons.calendar_today,size: 35,
                              )

                          )
                              : SizedBox(
                              width: width*0.11,
                              height: height*0.06,

                              child: Icon(
                                Icons.calendar_today_outlined,size: 35,
                              )

                          )

                        ],
                      ),
                    ),
                    SizedBox(
                      width: width*0.3,
                    ),

                    GestureDetector(
                      onTap: () { if (!more) {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context)=>UserLocationScreen()));
                      }
                      },
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          more
                              ? SizedBox(
                            width: width*0.11,
                            height: height*0.04,

                            child: Icon(Icons.location_on_outlined,size: 40,color: Colors.black,)

                          )
                              : SizedBox(
                            width: width*0.11,
                            height: height*0.05,

                            child: Icon(Icons.location_on_sharp,size: 40,color: Colors.black,)

                          )

                        ],
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        if (!profile) {

                          Navigator.push(context,
                            MaterialPageRoute(builder: (context)=> EditProfileScreen()),);

                        }
                      },
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          profile
                              ? SizedBox(
                              width: width*0.11,
                              height: height*0.05,

                              child: Icon(Icons.person_sharp,size: 45,)

                          )
                              : SizedBox(
                              width: width*0.11,
                              height: height*0.05,

                              child: Icon(Icons.person_outline_outlined,size: 45,)

                          )

                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.topCenter,
            child: SizedBox(
              height: 70,
              width: 70,
              child: FloatingActionButton(
                elevation: 0,
                backgroundColor: home ? Colors.red : AppColor.placeholder,
                onPressed: () async{
                  Navigator.push(context,
                    MaterialPageRoute(builder: (context)=> const UserScreen()),);
                },
                child: Image.asset(
                    Helper.getAssetName("home_white.png", "virtual")),
              ),
            ),
          )
        ],
      ),
    );
  }
}

class CustomNavBarClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.moveTo(0, 0);
    path.lineTo(size.width * 0.3, 0);
    path.quadraticBezierTo(
      size.width * 0.375,
      0,
      size.width * 0.375,
      size.height * 0.1,
    );
    path.cubicTo(
      size.width * 0.4,
      size.height * 0.9,
      size.width * 0.6,
      size.height * 0.9,
      size.width * 0.625,
      size.height * 0.1,
    );
    path.quadraticBezierTo(
      size.width * 0.625,
      0,
      size.width * 0.7,
      0.1,
    );
    path.lineTo(size.width, 0);
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    path.lineTo(0, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return true;
  }
}
