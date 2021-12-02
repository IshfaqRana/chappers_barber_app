import 'package:chappers/screens/otp_screen.dart';
import 'package:chappers/screens/sign_up_screen.dart';
import 'package:chappers/widgets/custom_button.dart';
import 'package:chappers/widgets/custom_text_input.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ForgotScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _ForgotScreen();
  }
}

class _ForgotScreen extends State<ForgotScreen> {
  String phone = "";
  TextEditingController passwordController=TextEditingController();
  var _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    double height=MediaQuery.of(context).size.height;

    double width=MediaQuery.of(context).size.width;
    // TODO: implement build
    return Scaffold(

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

    child: Padding(
    padding: const EdgeInsets.symmetric(horizontal: 20),

    child: Center(

              child: Column(
                children: [
                  SizedBox(height: 10,),
                  Text(
                    'Recovery Account',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
                    textAlign: TextAlign.right,
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 50,),
                    child: Form(
                      key: _formKey,
                      child: Column(
                        children: <Widget>[
                          //
                          // Theme(
                          //   data: ThemeData(),
                          //   child: Padding(
                          //     padding: EdgeInsets.only(top: 30),
                          //     child: TextFormField(
                          //       validator: (value) {
                          //         if (value!.isEmpty) {
                          //           return "Please enter Mobile number";
                          //         } else {
                          //           phone = value;
                          //         }
                          //         return null;
                          //       },
                          //       decoration: InputDecoration(
                          //         labelText: "Please enter mobile number",
                          //         border: OutlineInputBorder(
                          //             borderRadius: BorderRadius.circular(15),
                          //             borderSide:
                          //                 BorderSide(color: Colors.black, width: 1)),
                          //         disabledBorder: OutlineInputBorder(
                          //             borderRadius: BorderRadius.circular(15),
                          //             borderSide:
                          //                 BorderSide(color: Colors.black, width: 1)),
                          //         enabledBorder: OutlineInputBorder(
                          //             borderRadius: BorderRadius.circular(15),
                          //             borderSide:
                          //                 BorderSide(color: Colors.black, width: 1)),
                          //         focusedBorder: OutlineInputBorder(
                          //             borderRadius: BorderRadius.circular(15),
                          //             borderSide:
                          //                 BorderSide(color: Colors.black, width: 1)),
                          //       ),
                          //     ),
                          //   ),
                          // ),

                          CustomTextField(
                            label: '+923--------',

                            keyboardType: TextInputType.text,
                            controller: passwordController,
                          ),
                          Padding(
                              padding: EdgeInsets.only(top: 30, left: 10, right: 10),
                              child: CustomButton(
                                width: width ,
                                height: height * 0.065,
                                text: 'Next',
                                onPressed: () {
                                  if (_formKey.currentState!.validate()) {
                                    FirebaseAuth.instance
                                        .sendPasswordResetEmail(email: passwordController.text);
                                    Navigator.pushReplacement(
                                        context,
                                        MaterialPageRoute(
                                            builder: (BuildContext context) =>
                                                OTPScreen(phone: passwordController.text)));
                                    Get.snackbar(
                                      'Check your Mobile Phone',
                                      'OTP Message sent successfully',
                                      //fontWeight: FontWeight.bold,
                                      colorText: Colors.black,
                                      backgroundColor: Colors.white,
                                    );
                                  }
                                },
                              ))
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
              ),
    ),
    ),
          Positioned(
              top: height*0.02,
              left: width*0.05,
              child: InkWell(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>SignUpScreen(index: 00)));
                },
                child: SizedBox(
                  width: width*0.05,
                  height: height*0.05,
                  child: Image.asset('assets/images/back.png'),
                ),
              )),

          Positioned(
              top: height*0.02,
              right: width*0.3,

              //right: 250,
              child: Container(


                  child: const Text('Forget Password',style: TextStyle(
                      fontSize: 25,

                      color: Colors.white
                  ),)

              )
          ),

        ],
      ),
    );
  }
}
