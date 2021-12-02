
import 'dart:ui';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:chappers/const/colors.dart';
import 'package:chappers/screens/notifications.dart';
import 'package:chappers/screens/stylist_profile.dart';
import 'package:chappers/widgets/custom_button.dart';
import 'package:chappers/widgets/custom_nav_bar.dart';
import 'package:chappers/widgets/custom_text_input.dart';
import 'package:chappers/widgets/nav_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

import '../../../widgets/responsive_widget.dart';
TabController? _controller;

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);
  static const routeName=
      '/profileScreen';
  @override
  _Profile createState() => _Profile();
}
class _Profile extends State<ProfileScreen> with SingleTickerProviderStateMixin{
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
              "Profile Update",
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
              "Change Password",
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
              padding: const EdgeInsets.only(left: 50.0),
              child: Center(
                child: Text(
                  'Setting',
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

                  child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children:[
                            TabBar(
                              unselectedLabelColor: Colors.black,
                              labelColor: Colors.red,
                              tabs: [
                                Tab(
                                    text: 'Profile'
                                ),
                                Tab(
                                  text: 'Change Password',
                                )
                              ],
                              controller: _controller,
                              indicatorSize: TabBarIndicatorSize.tab,
                            ),
                            Expanded(child:TabBarView(
                              controller: _controller,
                              children: [
                                ProfileUpdate(),
                                ChangePassword(),

                              ],
                            ),
                            )
                          ]
                      ),
                    ),
                  ),

                ),

              ]
          ),
          bottomNavigationBar: NavBar(),

    );
  }


}

class ProfileUpdate extends StatelessWidget{


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
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(height: height*0.02,),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: width * 0.20),
                child: GestureDetector(
                  onTap: () {},
                  child: CircleAvatar(
                    radius: 40,
                    //backgroundColor: textColor,
                    backgroundImage: AssetImage('assets/images/asset2.png'),
                  ),
                ),
              ),
              SizedBox(
                height: height * 0.02,
              ),
              CustomTextField(
                label: 'First Name',
                keyboardType: TextInputType.name,
                //controller: controller.firstNameController,
              ),
              CustomTextField(
                label: 'Last Name',
                keyboardType: TextInputType.name,
                //controller: controller.lastNameController,
              ),
              CustomTextField(
                label: 'Username',
                keyboardType: TextInputType.emailAddress,
                //controller: controller.phoneController,
              ),
              CustomTextField(
                label: 'Email',
                keyboardType: TextInputType.emailAddress,
                //controller: controller.phoneController,
              ),

              CustomTextField(
                label: 'Phone Number',
                keyboardType: TextInputType.number,
                //controller: controller.passwordController,
              ),

              SizedBox(
                height: height * 0.02,
              ),
              CustomButton(
                width: width * 0.77,
                height: height * 0.06,
                text: 'Update',

                onPressed: () async {

                    Navigator.push(context,
                      MaterialPageRoute(builder: (context)=> const StylistProfileScreen()),);


                },
              ),
              SizedBox(
                height: height * 0.15,
              ),

            ],
          ),
        ),
      );

  }

}
class ChangePassword extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Container(
        width: width*0.7,
        height: height*0.6,
        child:
        SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                height: height * 0.02,
              ),

              CustomTextField(
                label: 'Enter current Password',
                keyboardType: TextInputType.visiblePassword,
                isPassword: true,
                //controller: controller.phoneController,
              ),
              CustomTextField(
                label: 'New Password',
                isPassword: true,
                keyboardType: TextInputType.visiblePassword,
                //controller: controller.passwordController,
              ),
              CustomTextField(
                label: 'Confirm Password',
                isPassword: true,
                keyboardType: TextInputType.visiblePassword,
                //controller: controller.passwordController,
              ),

              SizedBox(
                height: height * 0.02,
              ),
              CustomButton(
                width: width * 0.77,
                height: height * 0.06,
                text: 'Change Password',

                onPressed: () async {

                    Navigator.push(context,
                      MaterialPageRoute(builder: (context)=> const StylistProfileScreen()),);

                },
              ),


            ],
          ),
        ));

  }

}