import 'dart:ui';
import 'package:chappers/screens/notifications.dart';
import 'package:chappers/widgets/confirmed2.dart';
import 'package:chappers/widgets/custom_nav_bar.dart';
import 'package:chappers/widgets/slot_card.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:date_format/date_format.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';
import 'package:flutter/painting.dart';
import '../../../widgets/responsive_widget.dart';
import 'available_slots.dart';

class ConfAPP extends StatefulWidget {
  const ConfAPP({Key? key}) : super(key: key);
  static const routeName = "/slots";

  @override
  _ConfAPP createState() => _ConfAPP();
}
class _ConfAPP extends State<ConfAPP>{

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
                  padding: const EdgeInsets.only(left: 50.0),
                  child: Center(
                    child: Text(
                      'Confirmed',
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
            bottom: height*0.001,
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height*0.99,
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
                padding: EdgeInsets.only(top: 10),
                        child:Column(
                          children: [
                            SizedBox(height: height*0.002,),

                            SizedBox(
                                height: height*0.06,
                                width: width,
                                child: Center(child: const Text('Confirmed Requests',style: TextStyle(fontSize: 20,color: Colors.black26,fontWeight: FontWeight.bold)))
                            ),

                        SizedBox(
                          height: MediaQuery
                              .of(context)
                              .size
                              .height*0.7,
                          child: ListView.builder(
                            shrinkWrap: true,
                            itemCount: 5,
                            itemBuilder: (context, index) {

                              return GestureDetector(

                                child: SizedBox(
                                    width: width,
                                    height: height*0.47,
                                    child: ConfirmedAppointments(name: 'Paid',)),
                                onTap: () {

                                },
                                onLongPress: () {

                                },
                              );
                            },
                          ),
                        )
                          ],
                        ),
                      ),
                    ),

                  ),


                Positioned(
                    bottom: 0,
                    left: 0,
                    child: CustomNavBar()),

              ]
          ),
    );
  }


}
