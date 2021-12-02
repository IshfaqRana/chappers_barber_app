
import 'dart:ui';
import 'package:chappers/widgets/custom_button.dart';
import 'package:chappers/widgets/custom_text_input.dart';
import 'package:flutter/material.dart';

import '../../../widgets/responsive_widget.dart';
import 'new_password.dart';


class ResetPasswordScreen extends StatefulWidget {
  const ResetPasswordScreen({Key? key}) : super(key: key);

  @override
  _ResetPassword createState() => _ResetPassword();
}
class _ResetPassword extends State<ResetPasswordScreen>{
TextEditingController emailController=TextEditingController();
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
                    child: SizedBox(
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
                            const Center(
                              child: Text('Reset Password',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 25,
                              color: Colors.black
                              ),)
                            ),
                            Center(
                              
                                child: Container(
                                  padding: const EdgeInsets.all(25),
                                  child: const Text('Please enter your email to recieve a link to create a new password',style: TextStyle(fontSize: 18,
                                      color: Colors.black54,

                                  ),
                                  textAlign: TextAlign.center,
                                  ),
                                )
                            ),

                            CustomTextField(
                              label: 'Enter Email',
                              keyboardType: TextInputType.emailAddress,
                              controller: emailController,
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
                                  MaterialPageRoute(builder: (context)=> NewPasswordScreen(email: emailController.text,)),);

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
