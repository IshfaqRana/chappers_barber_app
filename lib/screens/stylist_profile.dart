
import 'dart:ui';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:chappers/const/colors.dart';
import 'package:chappers/screens/profile.dart';
import 'package:chappers/screens/profile_screen.dart';
import 'package:chappers/widgets/custom_button.dart';
import 'package:chappers/widgets/custom_nav_bar.dart';
import 'package:chappers/widgets/custom_text_input.dart';
import 'package:chappers/widgets/product.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

import '../../../widgets/responsive_widget.dart';
import 'notifications.dart';
TabController? _controller;

class StylistProfileScreen extends StatefulWidget {
  static const routeName = "/stylistProfile";

  const StylistProfileScreen({Key? key}) : super(key: key);


  @override
  _StylistProfile createState() => _StylistProfile();
}
class _StylistProfile extends State<StylistProfileScreen> with SingleTickerProviderStateMixin{

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
    return ResponsiveLayout(
        mobileBody: Scaffold(
          resizeToAvoidBottomInset: true,
          body: Stack(
              children: [
                Positioned(

                  child: Container(
                    color: Colors.red,
                    height: height,
                    width: width,

                  ),
                ),

                Positioned(
                  top: height * .09,
                  child: ClipRRect(
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(40),
                      topRight: Radius.circular(40),
                    ),

                    child: Container(
                      color: Colors.white,
                      width: width,
                      height: height * 0.91,
                      padding: const EdgeInsets.all(15),

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
                    top: height*0.02,
                    left: width*0.05,
                    child: InkWell(
                      onTap: (){
                        Navigator.pop(context);
                      },
                      child: SizedBox(
                        width: width*0.05,
                        height: height*0.05,
                        child: Image.asset('assets/images/back.png'),
                      ),
                    )),
                Positioned(
                    top: height*0.017,
                    right: width*0.01,

                    //right: 250,
                    child: Container(


                        child: const Icon(Icons.settings,size: 45,)

                    )
                ),
                Positioned(
                    top: height*0.02,
                    right: width*0.3,

                    //right: 250,
                    child: Container(


                        child: const Text('Stylist Profile',style: TextStyle(
                            fontSize: 25,

                            color: Colors.white
                        ),)

                    )
                ),
                Positioned(
                    top: height*0.015,
                    left: width*0.12,
                    child: InkWell(
                      onTap: (){
                        Navigator.push(context,
                          MaterialPageRoute(builder: (context)=> const NotificationScreen()),);
                      },
                      child: Container(


                          child: const Icon(Icons.notifications_active_outlined,size: 45,color: Colors.white,)

                      ),
                    )
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
                _controller!.index==0
                    ?Positioned(
                  bottom: height*0.24,
                  right: 16,
                  //alignment: Alignment.bottomRight,
                  child: Container(
                    height: height*0.06,
                    width: width*0.13,
                    //padding: const EdgeInsets.only(bottom: ,right: 16),
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
                          child: const Icon(Icons.chair_sharp,size: 40,),

                        ),
                      ),
                    ),
                  ),
                ):Container(

                ),


                Positioned(
                    bottom: 0,
                    left: 0,
                    child: CustomNavBar(
                      home: true,
                    )),

              ]
          ),
          //bottomNavigationBar: CustomNavBar(home: true,),
        )
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
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 4,
                    crossAxisSpacing: 4.0,
                    mainAxisSpacing: 4.0
                ),
                itemBuilder: (BuildContext context, int index){
                  return Image.asset(images[index]);
                },
              )),


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
    "assets/images/asset1.png",


  ];
}
class Services extends StatelessWidget{

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

              child: ProductItem(image:     "assets/images/download.png",
                price: '500Rs - 1000Rs',
                description: '(Wash and blow, dry included)',
                name: 'Hair Cut', button: 'Edit', onPressed: () {  },

              ),
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