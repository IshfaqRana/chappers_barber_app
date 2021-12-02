
import 'dart:ui';
import 'package:chappers/screens/available_slots.dart';
import 'package:chappers/screens/booking.dart';
import 'package:chappers/screens/chat.dart';
import 'package:chappers/screens/notifications.dart';
import 'package:chappers/screens/profile_screen.dart';
import 'package:chappers/widgets/custom_button.dart';
import 'package:chappers/widgets/custom_nav_bar.dart';
import 'package:chappers/widgets/custom_text_input.dart';
import 'package:chappers/widgets/product.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

import 'add_post.dart';
TabController? _controller;

class StylistProfilesScreen extends StatefulWidget {
  static const routeName = "/stylistProfiles";

  const StylistProfilesScreen({Key? key}) : super(key: key);


  @override
  _StylistsProfile createState() => _StylistsProfile();
}
class _StylistsProfile extends State<StylistProfilesScreen> with SingleTickerProviderStateMixin{

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
                  padding: const EdgeInsets.only(top: 5,left: 15,right: 15),
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

                            TabBar(
                              unselectedLabelColor: Colors.black,
                              labelColor: Colors.red,
                              tabs: const [
                                Tab(
                                    text: 'Posts'
                                ),
                                Tab(
                                  text: 'Services',
                                )
                              ],
                              controller: _controller,
                              indicatorSize: TabBarIndicatorSize.tab,
                            ),
                            Expanded(child:TabBarView(
                              controller: _controller,
                              children: [
                                Posts(),
                                Services(),

                              ],
                            ),
                            )
                          ]
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
    );
  }


}

class Posts extends StatelessWidget{


  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    var focusnode = new FocusNode();
    return
      GestureDetector(
        onTap: () {
          FocusScope.of(context).requestFocus(focusnode);
        },
        child: Stack(
            children: [
              SingleChildScrollView(
                  child: GridView.builder(
                    shrinkWrap: true,
                    physics: const ClampingScrollPhysics(),
                    itemCount: images.length,
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 4,
                        crossAxisSpacing: 4.0,
                        mainAxisSpacing: 4.0
                    ),
                    itemBuilder: (BuildContext context, int index){
                      return Image.asset(images[index]);
                    },
                  )),
              Align(
                alignment: Alignment.bottomRight,
                child: Container(
                  height: height*0.36,
                  width: width*0.25,
                  padding: const EdgeInsets.all(16.0),
                  //color: Colors.blue,
                  child: Ink(
                    decoration: const ShapeDecoration(
                      //color: Colors.red,
                      shape: CircleBorder(

                      ),
                    ),
                    child: FittedBox(
                      child: FloatingActionButton(
                        backgroundColor: Colors.red,
                        elevation: 0.0,


                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => AddPost(id:FirebaseAuth.instance.currentUser!.uid)),
                          );
                        },
                        child: const Icon(Icons.add,size: 40,),

                      ),
                    ),
                  ),
                ),
              ),


            ]
        ),
      );

  }
  List<String> images = [
    "assets/images/asset1.png",
    "assets/images/download.png",
    "assets/images/asset1.png",
    "assets/images/download.png",
    "assets/images/asset1.png",
    "assets/images/download.png",
    "assets/images/asset1.png",
    "assets/images/download.png",
    "assets/images/asset1.png",
    "assets/images/download.png",
    "assets/images/asset1.png",
    "assets/images/download.png",
    "assets/images/asset1.png",
    "assets/images/download.png",
    "assets/images/asset1.png",
    "assets/images/download.png",
    "assets/images/asset1.png",

  ];
}
class Services extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    int index=0;
    return GestureDetector(

      child: Stack(
        children: [
          SizedBox(
            height: height,
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: 5,
              itemBuilder: (context, index) {

                return GestureDetector(

                  child: ProductItem(image:     "assets/images/hair.png",
                    price: '500Rs - 1000Rs',
                    description: '(Wash and blow, dry included)',
                    name: 'Hair Cut',
                    onPressed: () {  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => const Booking()),
                    );
                    },
                    button: 'Book Now',

                  ),
                  onTap: () {

                  },
                  onLongPress: () {

                  },
                );
              },
            ),
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: Container(
              height: height*0.36,
              width: width*0.25,
              padding: const EdgeInsets.all(16.0),
              //color: Colors.blue,
              child: Ink(
                decoration: const ShapeDecoration(
                  //color: Colors.red,
                  shape: CircleBorder(

                  ),
                ),
                child: FittedBox(
                  child: FloatingActionButton(
                    backgroundColor: Colors.red,
                    elevation: 0.0,


                    onPressed: () {},
                    child: const Icon(Icons.add,size: 40,),

                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

}