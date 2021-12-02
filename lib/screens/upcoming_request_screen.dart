import 'package:chappers/widgets/cleint_history.dart';
import 'package:chappers/widgets/custom_nav_bar.dart';
import 'package:chappers/widgets/custom_tab_bar_view.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

import 'notifications.dart';
import 'sign_up_screen.dart';


class UpComScreen extends StatefulWidget {
  const UpComScreen({Key? key}) : super(key: key);

  @override
  _UpComScreenState createState() => _UpComScreenState();
}

class _UpComScreenState extends State<UpComScreen>
    with TickerProviderStateMixin
    {
  late TabController tabController;

  @override
  void initState() {
    tabController = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double height=MediaQuery.of(context).size.height;

    double width=MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 0,
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
              padding: const EdgeInsets.only(left: 20.0),
              child: Center(
                child: Text(
                  'Upcoming Request',
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 40,right: 4.0),
              child: Icon(
                Icons.settings,
                size: 40,
              ),
            ),
          ],
        ),
      ),
      body: Stack(
        children: [
          Container(
            color: Colors.red,
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
              child: CustomTabBarView(
                tabs_length: 2,
                tabs_titles_list: ["UpComing", "Live Tracking"],
                tab_children_layouts: [
                  AppointmentCard(),
                  SignUp()

                ],
                tabController: tabController,
              ),
            ),
          ),
          Positioned(
            bottom: 0.0,

            child: CustomNavBar(),
          )
        ],
      ),
      //bottomNavigationBar: CustomNavBar(),
    );
  }

  @override
  void onTabChanged(int newIndex) {
    setState(() {
      tabController.index = newIndex;
    });
  }

  @override
  void dataReceived() {

    }
  }

class AppointmentCard extends StatefulWidget{


  @override
  State<AppointmentCard> createState() => _AppState();
}

class _AppState extends State<AppointmentCard> {
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return
      Container(
          width: width,
          height: height*0.99,
          color: Colors.white,
          child:ListView.builder(
            //padding: EdgeInsets.symmetric(vertical: 16.0),
            itemCount: 1,
            itemBuilder: (BuildContext context, int index) {

                return GestureDetector(
                    child: Center(
                      child: SizedBox(

                          child: _buildCarousel(context, index)),
                    )
                );

            },
          ),
      );
  }
  Widget _buildCarousel(BuildContext context, int carouselIndex) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[

        SizedBox(
          // you may want to use an aspect ratio here for tablet support
          height: MediaQuery.of(context).size.height*0.6,
          child: PageView.builder(
            itemCount: 5,
            // store this controller in a State to save the carousel scroll position
            controller: PageController(viewportFraction: 0.8),
            itemBuilder: (BuildContext context, int itemIndex) {
              return _buildCarouselItem(context, carouselIndex, itemIndex);
            },
          ),
        )
      ],
    );
  }
  bool valuefirst = false;
  Widget _buildCarouselItem(BuildContext context, int carouselIndex, int itemIndex) {

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 4.0),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.red,
          borderRadius: BorderRadius.all(Radius.circular(4.0)),
        ),
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height*0.05,
              ),
              const Text('Today Appointment',style: TextStyle(
                color: Colors.white54,
                fontSize: 18,
              ),
              maxLines: 1,
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height*0.02,
              ),
              const Text('Appointment with client name',style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 25,
              ),
              maxLines: 2,),
              SizedBox(
                height: MediaQuery.of(context).size.height*0.03,
              ),
              Row(
                children: [
                  Icon(Icons.calendar_today_outlined,size: 20,color: Colors.white,),
                  SizedBox(
                    width: MediaQuery.of(context).size.height*0.01,
                  ),
                  const Text(
                    'November 27,2021',style: TextStyle(
                    fontSize: 17,
                    color: Colors.white70,
                    fontWeight: FontWeight.bold
                  ),
                  ),
                ],
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height*0.03,
              ),
              Row(
                children: [
                  Icon(Icons.access_time_filled_sharp,size: 20,color: Colors.white,),
                  SizedBox(
                    width: MediaQuery.of(context).size.height*0.01,
                  ),
                  const Text(
                    '12:30 PM',style: TextStyle(
                      fontSize: 17,
                      color: Colors.white70,
                      fontWeight: FontWeight.bold
                  ),
                  ),
                ],
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height*0.03,
              ),
              Row(
                children: [
                  Icon(Icons.location_on_sharp,size: 20,color: Colors.white,),
                  SizedBox(
                    width: MediaQuery.of(context).size.height*0.01,
                  ),
                  const Text(
                    'Main Street 18',style: TextStyle(
                      fontSize: 17,
                      color: Colors.white70,
                      fontWeight: FontWeight.bold
                  ),
                  ),
                ],
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height*0.03,
              ),
              Row(
                children: [
                  Icon(Icons.call,size: 20,color: Colors.white,),
                  SizedBox(
                    width: MediaQuery.of(context).size.height*0.01,
                  ),
                  const Text(
                    '+92 347 3465123',style: TextStyle(
                      fontSize: 17,
                      color: Colors.white70,
                      fontWeight: FontWeight.bold
                  ),
                  ),
                ],
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height*0.06,
              ),
              Container(
                width: MediaQuery.of(context).size.width * 0.4,
                height: MediaQuery.of(context).size.height * 0.06,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.white,
                    width: 2,
                  ),
                  borderRadius: BorderRadius.circular(5),

                ),
                child: RaisedButton(
                  shape: RoundedRectangleBorder(

                    borderRadius: BorderRadius.circular(5),
                  ),
                  color: Colors.red,
                  onPressed: () {
                    showDialog(
                        context: context,
                        builder: (context) {
                          return Dialog(
                            shape: RoundedRectangleBorder(
                                borderRadius:
                                BorderRadius.circular(20.0)),
                            // title: Text('Corona (PPE) Checklist',style: TextStyle(
                            //   fontSize: 20,
                            //   color: Colors.black,
                            //   fontWeight: FontWeight.bold
                            // ),),
                            // content:
                            child: Container(
                              height: MediaQuery.of(context).size.height*0.4,

                              child: Padding(
                                padding: const EdgeInsets.only(top: 12.0,right: 25,left: 25,),
                                child: Column(
                                  children: [
                                    const Text('Corona (PPE) Checklist',style: TextStyle(
                                      fontSize: 20,
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold
                                    ),),
                                    SizedBox(height: MediaQuery.of(context).size.height*0.01,),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text('Face Mask',style: TextStyle(
                                            fontSize: 16,
                                            color: Colors.black
                                        ),),
                                        Checkbox(
                                          checkColor: Colors.greenAccent,
                                          activeColor: Colors.red,
                                          value: this.valuefirst,
                                          onChanged: (bool? newValue) {
                                            setState(() {
                                              this.valuefirst = newValue!;
                                            });
                                          },
                                        ),

                                      ],
                                    ),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text('Hand Sanitizer',style: TextStyle(
                                            fontSize: 16,
                                            color: Colors.black
                                        ),),
                                        Checkbox(
                                          checkColor: Colors.greenAccent,
                                          activeColor: Colors.red,
                                          value: this.valuefirst,
                                          onChanged: (bool? newValue) {
                                            setState(() {
                                              this.valuefirst = newValue!;
                                            });
                                          },
                                        ),

                                      ],
                                    ),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text('Hand Gloves',style: TextStyle(
                                            fontSize: 16,
                                            color: Colors.black
                                        ),),
                                        Checkbox(
                                          checkColor: Colors.greenAccent,
                                          activeColor: Colors.red,
                                          value: this.valuefirst,
                                          onChanged: (bool? newValue) {
                                            setState(() {
                                              this.valuefirst = newValue!;
                                            });
                                          },
                                        ),

                                      ],
                                    ),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text('Disinfectents',style: TextStyle(
                                            fontSize: 16,
                                            color: Colors.black
                                        ),),
                                        Checkbox(
                                          checkColor: Colors.greenAccent,
                                          activeColor: Colors.red,
                                          value: this.valuefirst,
                                          onChanged: (bool? newValue) {
                                            setState(() {
                                              this.valuefirst = newValue!;
                                            });
                                          },
                                        ),

                                      ],
                                    ),
                                    SizedBox(height: MediaQuery.of(context).size.height*0.01,),
                                    Center(
                                      child: SizedBox(
                                        width: MediaQuery.of(context).size.width * 0.5,
                                        height: MediaQuery.of(context).size.height * 0.05,
                                        child: RaisedButton(
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(40),
                                          ),
                                          color: Colors.red,
                                          onPressed: () {

                                              Navigator.pop(context);


                                          },
                                          child: const Text(
                                            'Done',
                                            style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              color: Colors.white,
                                              fontSize: 15,

                                            ),
                                            maxLines: 1,
                                          ),

                                        ),
                                      ),
                                    ),
                                  ],

                                ),
                              ),
                            ),
                          );
                        });

                  },
                  child: const Text(
                    'Go Now',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontSize: 15,

                    ),
                    maxLines: 1,
                  ),

                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
