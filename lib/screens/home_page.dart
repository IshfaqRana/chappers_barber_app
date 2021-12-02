
import 'dart:ui';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:chappers/const/colors.dart';
import 'package:chappers/screens/available_slots.dart';
import 'package:chappers/screens/client_histoy_screen.dart';
import 'package:chappers/screens/confirm_request.dart';
import 'package:chappers/screens/payment_details.dart';
import 'package:chappers/screens/profile.dart';
import 'package:chappers/screens/profile_screen.dart';
import 'package:chappers/screens/set_date_and_slots.dart';
import 'package:chappers/screens/stylist_profile.dart';
import 'package:chappers/screens/stylist_profiles.dart';
import 'package:chappers/screens/upcoming_request_screen.dart';
import 'package:chappers/widgets/custom_button.dart';
import 'package:chappers/widgets/custom_nav_bar.dart';
import 'package:chappers/widgets/custom_text_input.dart';
import 'package:chappers/widgets/product.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

import '../../../widgets/responsive_widget.dart';
import 'cleint_request_details.dart';
import 'notifications.dart';
TabController? _controller;

class HomeScreen extends StatefulWidget {
  static const routeName = "/homeScreen";

  const HomeScreen({Key? key}) : super(key: key);


  @override
  _HomeScreen createState() => _HomeScreen();
}
class _HomeScreen extends State<HomeScreen> with SingleTickerProviderStateMixin{


  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
          resizeToAvoidBottomInset: true,
      backgroundColor: Colors.red,
      appBar: AppBar(
        elevation: 0,
        automaticallyImplyLeading: false,
        centerTitle: true,
        backgroundColor: Colors.red,
        toolbarHeight: 70,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            InkWell(
              onTap: (){
                Navigator.pop(context);
              },
              child: Icon(
                Icons.arrow_back_ios_sharp,
                size: 40,
              ),
            ),
            InkWell(
              onTap: (){
                Navigator.push(context,
                  MaterialPageRoute(builder: (context)=> const NotificationScreen()),);
              },
              child: Icon(
                Icons.notifications_active_outlined,
                size: 40,
              ),
            ),

            Padding(
              padding: const EdgeInsets.only(left: 60.0),
              child: Center(
                child: Text(
                  'Stylist',
                ),
              ),
            ),

          ],
        ),
        actions: <Widget>[
          Padding(
            padding: EdgeInsets.only(right: 40.0),
            child: Icon(
              Icons.settings,
              size: 40,
            ),
          ),
        ],
      ),
      body: Stack(
          children: [
            Positioned(
              top: height*0.001,
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height*0.85,
                decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 5,
                      blurRadius: 7,
                      offset: Offset(0, 6), //changes position of shadow
                    ),
                  ],
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(25),
                    topRight: Radius.circular(25),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(10),

                  child: SingleChildScrollView(
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children:[
                              SizedBox(height: height*0.03,),

                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                //crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: EdgeInsets.symmetric(horizontal: width * 0.02),
                                    child: GestureDetector(
                                      onTap: () {},
                                      child: CircleAvatar(
                                        radius: 40,
                                        //backgroundColor: textColor,
                                        backgroundImage: AssetImage('assets/images/asset2.png'),
                                      ),
                                    ),
                                  ),
                                  Container(
                                    width: width*0.46,
                                    padding: EdgeInsets.only(right: 20),
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.start,

                                      children: [
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children:  [
                                            SizedBox(

                                              width: width*0.15,
                                              height: height*0.05,
                                              child: const Text('100 Posts',style: TextStyle(fontWeight: FontWeight.bold,
                                                  color: Colors.black,
                                                  fontSize: 15
                                              ),
                                                maxLines: 2,
                                                textAlign: TextAlign.center,
                                              ),
                                            ),

                                            SizedBox(
                                              width: width*0.25,
                                              height: height*0.05,
                                              child: const Text('100K followers',
                                                style: TextStyle(fontWeight: FontWeight.bold,
                                                    color: Colors.black,
                                                    fontSize: 15
                                                ),
                                                maxLines: 2,
                                                textAlign: TextAlign.center,

                                                overflow: TextOverflow.ellipsis,
                                              ),
                                            )
                                          ],
                                        ),
                                        SizedBox(
                                          height: height*0.01,
                                        ),
                                        Container(
                                          width: width*0.36,
                                          height: height*0.04,
                                          child: RaisedButton(
                                            onPressed: () {
                                              Navigator.of(context)
                                                  .pushReplacementNamed(ProfileScreen.routeName);

                                            },
                                            shape: RoundedRectangleBorder(
                                              borderRadius: BorderRadius.circular(5),

                                            ),
                                            color: Colors.red,
                                            child: Text(
                                              'Edit Profile',
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 15,

                                              ),
                                            ),

                                          ),
                                        )
                                      ],
                                    ),
                                  )
                                ],
                              ),
                              const SizedBox(
                                height: 20,
                              ),

                              const SizedBox(


                                child: Text('Stylish Name',style: TextStyle(fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                    fontSize: 17
                                ),
                                  //maxLines: 2,
                                  //textAlign: TextAlign.center,
                                ),
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              const SizedBox(

                                child: Text('Hair Artist',
                                  style: TextStyle(
                                      color: Colors.black26,
                                      fontSize: 16
                                  ),
                                  // maxLines: 2,
                                  //textAlign: TextAlign.center,
                                ),
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              const SizedBox(

                                child: Text('2 Rue De Ermesinde',
                                  style: TextStyle(
                                      color: Colors.black26,
                                      fontSize: 14
                                  ),
                                  // maxLines: 2,
                                  //textAlign: TextAlign.center,
                                ),
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              const SizedBox(

                                child: Text('Frisange - Luxomborg 3KM',
                                  style: TextStyle(
                                      color: Colors.black26,
                                      fontSize: 14
                                  ),
                                  // maxLines: 2,
                                  //textAlign: TextAlign.center,
                                ),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Container(
                                height: height*0.04,

                                child: Image.asset('assets/images/virtual/star.png'),
                              ),
                          Center(
                              child: Container(
                                width: width,
                                height: height*0.42,
                                padding: new EdgeInsets.all(5.0),
                                child: Card(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(15.0),
                                  ),
                                  color: Colors.white,
                                  elevation: 10,
                                  child: Column(
                                    //mainAxisSize: MainAxisSize.min,
                                    children: <Widget>[
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          InkWell(
                                            child: Container(
                                              padding: const EdgeInsets.all(10),
                                              width: width*0.28,
                                              height: height*0.13,
                                              //color: Colors.red,
                                              child: Center(
                                                child: Text('Posts',style: TextStyle(fontSize: 17,
                                                  color: Colors.white
                                                ),),
                                              ),
                                              decoration: BoxDecoration(
                                                color: Colors.red,
                                                border: Border.all(
                                                  color: Colors.white,
                                                  width: 8,
                                                ),
                                                borderRadius: BorderRadius.circular(12),

                                              ),

                                            ),
                                            onTap: (){
                                              Navigator.push(context,
                                                MaterialPageRoute(builder: (context) => const StylistProfilesScreen()),
                                              );
                                            },
                                          ),
                                          InkWell(
                                            child: Container(
                                              padding: const EdgeInsets.all(10),
                                              width: width*0.28,
                                              height: height*0.13,
                                              //color: Colors.red,
                                              child: Center(
                                                child: Text('Services',style: TextStyle(fontSize: 15, color: Colors.white
                                                ),),
                                              ),
                                              decoration: BoxDecoration(
                                                color: Colors.red,
                                                border: Border.all(
                                                  color: Colors.white,
                                                  width: 8,
                                                ),
                                                borderRadius: BorderRadius.circular(12),

                                              ),

                                            ),
                                            onTap: (){
                                              Navigator.push(context,
                                                MaterialPageRoute(builder: (context) => const StylistProfilesScreen()),
                                              );
                                            },
                                          ),
                                          InkWell(
                                            child: Container(
                                              padding: const EdgeInsets.all(10),
                                              width: width*0.28,
                                              height: height*0.13,
                                              //color: Colors.red,
                                              child: Center(
                                                child: Text('Available Slots',
                                                  maxLines: 2,
                                                  textAlign: TextAlign.center,

                                                  overflow: TextOverflow.ellipsis,
                                                  style: TextStyle(fontSize: 13,color: Colors.white
                                                ),),
                                              ),
                                              decoration: BoxDecoration(
                                                color: Colors.red,
                                                border: Border.all(
                                                  color: Colors.white,
                                                  width: 8,
                                                ),
                                                borderRadius: BorderRadius.circular(12),

                                              ),

                                            ),
                                            onTap: (){
                                              Navigator.push(context,
                                                MaterialPageRoute(builder: (context) => const SlotsScreen()),
                                              );
                                            },
                                          ),
                                        ],
                                      ),
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          InkWell(
                                            onTap: (){
                                              Navigator.push(context,
                                                MaterialPageRoute(builder: (context) => const SetSlots()),
                                              );
                                            },
                                            child: Container(
                                              padding: const EdgeInsets.all(10),
                                              width: width*0.28,
                                              height: height*0.13,
                                              //color: Colors.red,
                                              child: Center(
                                                child: Text('Set Availability',
                                                  maxLines: 2,
                                                  textAlign: TextAlign.center,

                                                  overflow: TextOverflow.ellipsis,
                                                  style: TextStyle(fontSize: 12,color: Colors.white
                                                ),),
                                              ),
                                              decoration: BoxDecoration(
                                                color: Colors.red,
                                                border: Border.all(
                                                  color: Colors.white,
                                                  width: 8,
                                                ),
                                                borderRadius: BorderRadius.circular(12),

                                              ),

                                            ),
                                          ),
                                          InkWell(
                                            onTap: (){
                                              Navigator.push(context,
                                                MaterialPageRoute(builder: (context) => const CleintRequestDetails()),
                                              );
                                            },
                                            child: Container(
                                              padding: const EdgeInsets.all(10),
                                              width: width*0.28,
                                              height: height*0.13,
                                              //color: Colors.red,
                                              child: Center(
                                                child: Text('Requests',
                                                  maxLines: 2,
                                                  textAlign: TextAlign.center,

                                                  overflow: TextOverflow.ellipsis,
                                                  style: TextStyle(fontSize: 13,color: Colors.white
                                                ),),
                                              ),
                                              decoration: BoxDecoration(
                                                color: Colors.red,
                                                border: Border.all(
                                                  color: Colors.white,
                                                  width: 8,
                                                ),
                                                borderRadius: BorderRadius.circular(12),

                                              ),

                                            ),
                                          ),
                                          InkWell(
                                            onTap: (){
                                              Navigator.push(context,
                                                MaterialPageRoute(builder: (context) => const ConfAPP()),
                                              );
                                            },
                                            child: Container(
                                              padding: const EdgeInsets.all(10),
                                              width: width*0.28,
                                              height: height*0.13,
                                              //color: Colors.red,
                                              child: Center(
                                                child: Text('Confirmed',
                                                  maxLines: 2,
                                                  textAlign: TextAlign.center,

                                                  overflow: TextOverflow.ellipsis,
                                                  style: TextStyle(fontSize: 12,color: Colors.white
                                                ),),
                                              ),
                                              decoration: BoxDecoration(
                                                color: Colors.red,
                                                border: Border.all(
                                                  color: Colors.white,
                                                  width: 8,
                                                ),
                                                borderRadius: BorderRadius.circular(12),

                                              ),

                                            ),
                                          ),
                                        ],
                                      ),
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          InkWell(
                                            onTap: (){
                                              Navigator.push(context,
                                                MaterialPageRoute(builder: (context) => const UpComScreen()),
                                              );
                                            },
                                            child: Container(
                                              padding: const EdgeInsets.all(10),
                                              width: width*0.28,
                                              height: height*0.13,
                                              //color: Colors.red,
                                              child: Center(
                                                child: Text('UpComing',

                                                  style: TextStyle(fontSize: 13,color: Colors.white
                                                ),),
                                              ),
                                              decoration: BoxDecoration(
                                                color: Colors.red,
                                                border: Border.all(
                                                  color: Colors.white,
                                                  width: 8,
                                                ),
                                                borderRadius: BorderRadius.circular(12),

                                              ),

                                            ),
                                          ),
                                          InkWell(
                                            onTap: (){
                                              Navigator.push(context,
                                                MaterialPageRoute(builder: (context) => const ClientHistory()),
                                              );
                                            },
                                            child: Container(
                                              padding: const EdgeInsets.all(10),
                                              width: width*0.28,
                                              height: height*0.13,
                                              //color: Colors.red,
                                              child: Center(
                                                child: Text('History',

                                                  maxLines: 2,
                                                  textAlign: TextAlign.center,

                                                  overflow: TextOverflow.ellipsis,
                                                  style: TextStyle(fontSize: 12,color: Colors.white
                                                ),),
                                              ),
                                              decoration: BoxDecoration(
                                                color: Colors.red,
                                                border: Border.all(
                                                  color: Colors.white,
                                                  width: 8,
                                                ),
                                                borderRadius: BorderRadius.circular(12),

                                              ),

                                            ),
                                          ),
                                          InkWell(
                                            onTap: (){
                                              Navigator.push(context,
                                                MaterialPageRoute(builder: (context) => const PaymentDetails()),
                                              );
                                            },
                                            child: Container(
                                              padding: const EdgeInsets.all(10),
                                              width: width*0.28,
                                              height: height*0.13,
                                              //color: Colors.red,
                                              child: Center(
                                                child: Text('Payment',

                                                  maxLines: 2,
                                                  textAlign: TextAlign.center,

                                                  overflow: TextOverflow.ellipsis,
                                                  style: TextStyle(fontSize: 13,color: Colors.white
                                                ),),
                                              ),
                                              decoration: BoxDecoration(
                                                color: Colors.red,
                                                border: Border.all(
                                                  color: Colors.white,
                                                  width: 8,
                                                ),
                                                borderRadius: BorderRadius.circular(12),

                                              ),

                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                          ),
                              SizedBox(height: height*0.2,),


                            ]
                        ),
                      ),
                    ),
                  ),

                ),
                Positioned(
                    bottom: 0,
                    left: 0,
                    child: CustomNavBar(
                     
                    )),

              ]
          ),
          //bottomNavigationBar: CustomNavBar(home: true,),

    );
  }


}
