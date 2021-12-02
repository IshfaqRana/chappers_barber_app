
import 'dart:ui';
import 'package:chappers/const/colors.dart';
import 'package:chappers/screens/available_slots.dart';
import 'package:chappers/screens/chat.dart';
import 'package:chappers/screens/profile_screen.dart';
import 'package:chappers/widgets/confirmed_app_card.dart';
import 'package:chappers/widgets/custom_button.dart';
import 'package:chappers/widgets/custom_nav_bar.dart';
import 'package:chappers/widgets/custom_text_input.dart';
import 'package:chappers/widgets/product.dart';
import 'package:chappers/widgets/text_fiels.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

import '../../../widgets/responsive_widget.dart';
import 'custom_dialog.dart';
import 'notifications.dart';
TabController? _controller;

class Booking extends StatefulWidget {
  static const routeName = "/stylistProfiles";


  const Booking({Key? key}) : super(key: key);


  @override
  _Booking createState() => _Booking();
}
class _Booking extends State<Booking> with SingleTickerProviderStateMixin{
  String time="";
  String cat="";
  Widget _TimeSlots(String title) {
    return InkWell(
      child: Container(
        height: 30,
        width: 70,
        decoration: BoxDecoration(
          color: time == title ? Colors.red : Colors.white,
          borderRadius: BorderRadius.circular(5),
        ),
        child: Center(
          child: Text(
            title,
            style: const TextStyle(fontSize: 14, color: Colors.black),
          ),
        ),
      ),
      onTap: () {
        setState(() {
          cat = title;
          time = title;
        });
      },
    );
  }
  TabController? _controller;
  List<Widget> list = [
    Tab(
      child: Container(
        height: 30.0,
        width: 100.0,
        decoration: BoxDecoration(
            color: Colors.black,
            border: Border.all(
              color: Colors.black.withOpacity(0.2),
            ),
            borderRadius: BorderRadius.circular(10)),
        child: Center(
            child: Text(
              "Posts",
              style: TextStyle(color: Colors.green),
            )),
      ),
    ),
    Tab(
      child: Container(
        height: 30.0,
        width: 100.0,
        decoration: BoxDecoration(
            color: Colors.black,
            border: Border.all(
              color: Colors.black.withOpacity(0.2),
            ),
            borderRadius: BorderRadius.circular(10)),
        child: Center(
            child: Text(
              "Services",
              style: TextStyle(color: Colors.green),
            )),
      ),
    ),
  ];
  int _selectedIndex = 0;

  @override
  void initState() {
    //getUserId();

    // TODO: implement initState
    super.initState();
    // Create TabController for getting the index of current tab
    _controller = TabController(length: list.length, vsync: this);

    _controller?.addListener(() {
      setState(() {
        _selectedIndex = _controller!.index;
      });
      print("Selected Index: " + _controller!.index.toString());
    });
  }
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
              padding: const EdgeInsets.only(left: 40.0),
              child: Center(
                child: Text(
                  'Stylist Profile',
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
                  padding: const EdgeInsets.only(top: 5),
                  child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children:[
                            SizedBox(height: height*0.03,),

                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              //crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  padding: const EdgeInsets.only(left: 10),
                                  child: Padding(
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
                                ),
                                Container(
                                  width: width*0.6,
                                  padding: EdgeInsets.only(right: 5),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,

                                    children: [
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children:  [
                                          Center(
                                            child: SizedBox(

                                              width: width*0.25,
                                              height: height*0.05,
                                              child: const Text('100 \n Posts',style: TextStyle(fontWeight: FontWeight.bold,
                                                  color: Colors.black,
                                                  fontSize: 15
                                              ),
                                                maxLines: 2,
                                                textAlign: TextAlign.center,
                                              ),
                                            ),
                                          ),

                                          Center(
                                            child: SizedBox(
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
                                            ),
                                          )
                                        ],
                                      ),
                                      SizedBox(
                                        height: height*0.01,
                                      ),
                                      Row(
                                        //crossAxisAlignment: CrossAxisAlignment.start,
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          SizedBox(
                                            width: width*0.28,
                                            height: height*0.03,
                                            child: RaisedButton(
                                              onPressed: () {
                                                Navigator.push(context,
                                                  MaterialPageRoute(builder: (context) => ChatPage()),
                                                );
                                              },
                                              shape: RoundedRectangleBorder(
                                                borderRadius: BorderRadius.circular(5),

                                              ),
                                              color: Colors.red,
                                              child: Text(
                                                'Message',
                                                style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 12,

                                                ),
                                              ),

                                            ),
                                          ),
                                          SizedBox(
                                            width: width*0.28,
                                            height: height*0.03,
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
                                                'Follow',
                                                style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 12,

                                                ),
                                              ),

                                            ),
                                          ),

                                        ],
                                      ),
                                      SizedBox(
                                        height: height*0.01,
                                      ),
                                      SizedBox(
                                        width: width*0.6,
                                        height: height*0.03,
                                        child: RaisedButton(
                                          onPressed: () {
                                            Navigator.push(context,
                                              MaterialPageRoute(builder: (context) => const SlotsScreen()),
                                            );
                                          },
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(5),

                                          ),
                                          color: Colors.red,
                                          child: Text(
                                            'Available Slots',
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 12,

                                            ),
                                          ),

                                        ),
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                            const SizedBox(
                              height: 20,
                            ),

                            Container(
                              padding: const EdgeInsets.only(left: 15),
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
                            Container(
                              padding: const EdgeInsets.only(left: 15),
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
                            Container(
                              padding: const EdgeInsets.only(left: 15),
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
                            Container(
                              padding: const EdgeInsets.only(left: 15),
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

                              padding: const EdgeInsets.only(left: 15),
                              child: Image.asset('assets/images/virtual/star.png'),
                            ),

                            TabBar(
                              unselectedLabelColor: Colors.black,
                              labelColor: Colors.red,
                              tabs: const [
                                Tab(
                                    text: 'Book Appointment'
                                ),
                                Tab(
                                  text: 'Confirm Appointment',
                                )
                              ],
                              controller: _controller,
                              indicatorSize: TabBarIndicatorSize.tab,
                            ),
                            Expanded(child:TabBarView(
                              controller: _controller,
                              children: [
                                Book(),
                                Confirmed(),

                              ],
                            ),
                            )
                          ]
                      ),
                    ),
                  ),

                ),
            Positioned(
              bottom: height*0.0,
              child: CustomNavBar(),
            )
              ]
          ),
          //bottomNavigationBar: const CustomNavBar(),


    );
  }


}

class Book extends StatefulWidget{


  @override
  State<Book> createState() => _BookState();
}

class _BookState extends State<Book> {
  String time="";
  String cat="";
  Widget _TimeSlots(String title) {
    return InkWell(
      child: Card(

        child: Container(
          height: 30,
          width: 50,
          decoration: BoxDecoration(
            //boxShadow: Colors.grey,
            color: time == title ? Colors.red : Colors.white,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Center(
            child: Text(
              title,
              style: const TextStyle(fontSize: 12, color: Colors.black),
            ),
          ),
        ),
      ),
      onTap: () {
        setState(() {
          cat = title;
          time = title;
        });
      },
    );
  }
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    final TextInputType typ=TextInputType.text;
    final TextInputType number=TextInputType.text;

    var focusnode = new FocusNode();
    return

    SizedBox(
        width: width,
        height: height*0.9,
        child:
        SingleChildScrollView(
          child: Column(
            children: [
              Row(
                children: [
                  Container(
                    padding: const EdgeInsets.only(left: 5),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: height * 0.01,
                        ),
                        myTextFieldWidget(
                          context,
                          'First Name',
                          0.425,
                          0.04,
                          false,

                          typ,
                        ),
                        myTextFieldWidget(
                          context,
                          'Email',
                          0.425,
                          0.04,
                          false,

                          number,
                        ),
                        myTextFieldWidget(
                          context,
                          'Country',
                          0.425,
                          0.04,
                          false,

                          typ,
                        ),
                        myTextFieldWidget(
                          context,
                          'City',
                          0.425,
                          0.04,
                          false,

                          typ,
                        ),
                        SizedBox(height: 10,),
                        SizedBox(
                            width:width*0.45,
                            height:height*0.03,
                            child: Text('   Appointment Date',style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                              fontSize: 13,
                            ),
                              maxLines: 1,
                              overflow: TextOverflow.fade,
                            )
                        ),

                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            _TimeSlots('17'),


                            _TimeSlots('11'),


                            _TimeSlots('2021'),
                            //SizedBox(width: 5,),
                          ],
                        ),
                        SizedBox(
                          height: height * 0.02,
                        ),
                        Card(
                          child:Container(
                          width: width * 0.425,
                          height: height * 0.04,
                            decoration: BoxDecoration(
                              //boxShadow: Colors.grey,
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Row(
                              children: [
                                SizedBox(
                                  width: width*0.1,
                                  height: height*0.03,
                                  child: Icon(
                                    Icons.location_on_sharp,
                                    color: Colors.red,
                                    size: 20,
                                  ),
                                ),
                                SizedBox(width: 3,),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: const [
                                    SizedBox(
                                      height: 8,
                                    ),
                                    Text('Drop Off your Location',style: TextStyle(
                                        fontSize: 8,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black

                                    ),
                                    overflow: TextOverflow.ellipsis,
                                    textAlign: TextAlign.start,
                                    maxLines: 1,

                                    ),

                                    Text('M13, Military Accounts, Johar Town',style: TextStyle(
                                        fontSize: 6,
                                        color: Colors.black
                                    ),
                                      overflow: TextOverflow.ellipsis,
                                      textAlign: TextAlign.start,
                                      maxLines: 1,

                                    )
                                  ],
                                ),
                              ],
                            ),
                        ),
                        ),
                        SizedBox(
                          height: height * 0.1,
                        ),

                      ],
                    ),
                  ),
                  SizedBox(
                   width: 3,
                  ),
                  Container(
                   // padding: const EdgeInsets.only(right: 5),

                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: height * 0.01,
                        ),
                        myTextFieldWidget(
                          context,
                          'Second Name',
                          0.425,
                          0.04,
                          false,

                          typ,
                        ),
                        myTextFieldWidget(
                          context,
                          'Number',
                          0.425,
                          0.04,
                          false,

                          number,
                        ),
                        myTextFieldWidget(
                          context,
                          'State',
                          0.425,
                          0.04,
                          false,

                          typ,
                        ),
                        myTextFieldWidget(
                          context,
                          'Address',
                          0.425,
                          0.04,
                          false,

                          typ,
                        ),
                        SizedBox(height: 10,),
                        SizedBox(
                          width:width*0.45,
                          height:height*0.03,
                          child: Text('   Appointment Time',style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                            fontSize: 13,
                          ),
                          maxLines: 1,
                            overflow: TextOverflow.fade,
                          )
                        ),

                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            _TimeSlots('08'),
                            //SizedBox(width: 10,),

                            _TimeSlots('00'),
                            //SizedBox(width: 10,),

                            _TimeSlots('PM'),
                            //SizedBox(width: 10,),
                          ],
                        ),
                        SizedBox(
                          height: height * 0.02,
                        ),
                        SizedBox(
                          width: width * 0.3,
                          height: height * 0.05,
                          child: RaisedButton(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(40),
                            ),
                            color: AppColor.orange,
                            onPressed: () => BottomDialog().showBottomDialog(context),
                            child: Text(
                              'Send Request',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                                fontSize: 10,

                              ),
                              maxLines: 1,
                            ),

                          ),
                        ),
                        SizedBox(
                          height: height * 0.1,
                        ),

                      ],
                    ),
                  ),

                ],
              ),
              SizedBox(height: height*0.13,)
            ],
          ),
        )
    );
  }
}
class Confirmed extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    int index=0;
    return SizedBox(
      height: MediaQuery
          .of(context)
          .size
          .height,
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: 5,
        itemBuilder: (context, index) {

          return GestureDetector(

            child: SizedBox(
                width: width,
                height: height*0.37,
                child: ConfirmedAppointmentCard(name: 'Paid',)),
            onTap: () {

            },
            onLongPress: () {

            },
          );
        },
      ),
    );
  }

}