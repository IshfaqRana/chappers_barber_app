import 'package:chappers/const/colors.dart';
import 'package:chappers/const/helper.dart';
import 'package:chappers/widgets/custom_button.dart';
import 'package:chappers/widgets/custom_nav_bar.dart';
import 'package:chappers/widgets/nav_bar.dart';
import 'package:flutter/material.dart';

import 'notifications.dart';



class EditProfileScreen extends StatelessWidget {
  static const routeName = "/editProfileScreen";

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
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
                  'Profile',
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

            padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Profile",
                                style: Helper.getTheme(context).headline5,
                              ),

                            ],
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          ClipOval(
                            child: Stack(
                              children: [
                                Container(
                                  height: 80,
                                  width: 80,
                                  child: Image.asset(
                                    'assets/images/asset1.png',
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                Positioned(
                                  bottom: 0,
                                  child: Container(
                                    height: 20,
                                    width: 80,
                                    color: Colors.black.withOpacity(0.3),
                                    child: Image.asset(Helper.getAssetName(
                                        "camera.png", "virtual")),
                                  ),
                                )
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset(
                                Helper.getAssetName("edit_filled.png", "virtual"),
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Text(
                                "Edit Profile",
                                style: TextStyle(color: AppColor.orange),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            "Hi there Emilia!",
                            style: Helper.getTheme(context).headline4?.copyWith(
                              color: AppColor.primary,
                            ),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text("Sign Out"),
                          SizedBox(
                            height: 40,
                          ),
                          CustomFormImput(
                            label: "Name",
                            value: "Emilia Clarke",
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          CustomFormImput(
                            label: "Email",
                            value: "emiliaclarke@email.com",
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          CustomFormImput(
                            label: "Mobile No",
                            value: "emiliaclarke@email.com",
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          CustomFormImput(
                            label: "Address",
                            value: "No 23, 6th Lane, Colombo 03",
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          CustomFormImput(
                            label: "Password",
                            value: "Emilia Clarke",
                            isPassword: true,
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          CustomFormImput(
                            label: "Confirm Password",
                            value: "Emilia Clarke",
                            isPassword: true,
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          CustomButton(
                            height: height*0.05,
                            width: width*0.73,
                            text: 'Save',
                            onPressed: (){},
                          ),
                          SizedBox(
                            height: height*0.15,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),

        ],
      ),
      bottomNavigationBar: NavBar(profile: true,),
    );
  }
}

class CustomFormImput extends StatelessWidget {
  const CustomFormImput({
    Key? key,
    String? label,
    String? value,
    bool isPassword = false,
  })  : _label = label,
        _value = value,
        _isPassword = isPassword,
        super(key: key);

  final String? _label;
  final String? _value;
  final bool _isPassword;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Container(
          width: double.infinity,
          height: 50,
          //padding: const EdgeInsets.only(left: 40),
          decoration: ShapeDecoration(
            shape: StadiumBorder(),
            color: AppColor.placeholderBg,
          ),
          child: TextFormField(
            decoration: InputDecoration(
              border: InputBorder.none,
              fillColor: Colors.white,
              filled: true,
              labelText: _label,
            ),
            obscureText: _isPassword,
            initialValue: _value,
            style: TextStyle(
              fontSize: 14,
            ),
          ),

      ),
    );
  }
}
