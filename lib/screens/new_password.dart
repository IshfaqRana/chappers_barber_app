
import 'dart:ui';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:chappers/const/colors.dart';
import 'package:chappers/screens/stylist_profile.dart';
import 'package:chappers/widgets/custom_button.dart';
import 'package:chappers/widgets/custom_text_input.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

import '../../../widgets/responsive_widget.dart';


class NewPasswordScreen extends StatefulWidget {
  final String? phone;
  final String? email;
  const NewPasswordScreen({Key? key,this.phone, this.email}) : super(key: key);

  @override
  _NewPassword createState() => _NewPassword();
}
class _NewPassword extends State<NewPasswordScreen>{

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
                    top: height*0.02,
                    left: 156,

                    //right: 250,
                    child: Container(
                      width: width*0.2,

                      child: Image.asset(
                        'assets/images/asset2.png',
                        fit: BoxFit.cover,
                      ),

                    )
                ),
                Positioned(
                  top: height * .17,
                  child: ClipRRect(
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(40),
                      topRight: Radius.circular(40),
                    ),

                    child: Container(
                      color: Colors.white,
                      width: width,
                      height: height * 0.83,
                      padding: const EdgeInsets.all(30),

                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Center(
                                child: Text('New Password',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 25,
                                    color: Colors.black
                                ),)
                            ),
                            SizedBox(
                              height: height * 0.02,
                            ),
                            Center(
                                child: Text('Please enter new password',style: TextStyle(fontSize: 18,
                                    color: Colors.black54
                                ),)
                            ),
                            SizedBox(
                              height: height * 0.02,
                            ),
                            CustomTextField(
                              label: 'New Password',
                              keyboardType: TextInputType.emailAddress,
                              //controller: controller.phoneController,
                            ),
                            CustomTextField(
                              label: 'Confirm New Password',
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
                              text: 'Next',

                              onPressed: () async {

                                  Navigator.push(context,
                                    MaterialPageRoute(builder: (context)=> const StylistProfileScreen()),);


                              },
                            ),
                          ]
                      ),
                    ),
                  ),

                ),

                Positioned(
                    top: height*0.05,
                    left: 30,
                    child: InkWell(
                      onTap: (){
                        Navigator.pop(context);
                      },
                      child: SizedBox(
                        width: width*0.05,
                        height: height*0.05,
                        child: Image.asset('assets/images/back.png'),
                      ),
                    ))
              ]
          ),
        )
    );
  }


}
