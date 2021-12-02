import 'dart:io';
import 'dart:ui';
import 'package:chappers/const/colors.dart';
import 'package:chappers/screens/main_screen.dart';
import 'package:chappers/screens/registration_screen.dart';
import 'package:chappers/widgets/custom_button.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:pinput/pin_put/pin_put.dart';

import '../../../widgets/responsive_widget.dart';


class OTPSignup extends StatefulWidget {
  const OTPSignup({
    Key? key,
    required this.phone,
    required this.email,
    required this.first,
    required this.last,
    required this.password, required this.image}) : super(key: key);
  final String phone;
  final String email;
  final String first;
  final String last;
  final String password;
  final String image;


  @override
  _OTPS createState() => _OTPS();
}
class _OTPS extends State<OTPSignup>{
  String smsCode = '';
  int c=0;
  final _pinPutController = TextEditingController();
  final _pinPutFocusNode = FocusNode();
  final BoxDecoration pinPutDecoration = BoxDecoration(
    color: const Color.fromRGBO(43, 46, 66, 1),
    borderRadius: BorderRadius.circular(10.0),
    border: Border.all(
      color: const Color.fromRGBO(126, 203, 224, 1),
    ),
  );
  FirebaseAuth _auth = FirebaseAuth.instance;
String id="";
  @override
  void initState() {
    super.initState();
    _auth.verifyPhoneNumber(
      phoneNumber: widget.phone,
      //ye code tb chalta hai jb user k moble mey code aye aur wo auto accept kr ley
      verificationCompleted: (PhoneAuthCredential credential) async {
        // navigator is liye lagaya hai tak k aghar codeSent pr jo humney dialogue bnaya hai wo show na ho
        id=credential.verificationId!;
      },
      //AuthException Replace with FirebaseAuthException class
      verificationFailed: (FirebaseAuthException exception) {
        print(exception.message);
        if (exception.code == 'invalid-phone-number') {
          print('invalid phone number');
        }
      },
      codeSent: (String verificationId, [int? forceResendingToken]) {
        id=verificationId;
      },
      codeAutoRetrievalTimeout: (String verificationId) {

      },
    );

    //loginUser(widget.phone,context);
  }
  bool account=false;
  Future<void> verificationCompleted() async {
  }
  void verify(String smsCode) async {
    PhoneAuthCredential credential = PhoneAuthProvider.credential(verificationId: id, smsCode: smsCode);
    try{
      await auth.signInWithCredential(credential).then((value) {
        if (value != null) {
          signup();
        FirebaseAuth.instance.signOut();
        Navigator.push(context,
          MaterialPageRoute(builder: (context) => const Registered()),);
        }
      });
    }on FirebaseAuthException catch(e){
      print(e.message);
    }
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

                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Column(
                          //crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: 20,
                            ),
                            Text(
                              'We have sent you an OTP to your Mobile',
                              style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20,color: Colors.black),
                              textAlign: TextAlign.center,
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Text(
                              "Please check your mobile number ${widget.phone} continue to reset your password",
                              style: TextStyle(fontSize: 15,color: Colors.black54),

                              textAlign: TextAlign.center,
                            ),
                            SizedBox(
                              height: 50,
                            ),
                            Padding(
                              padding: const EdgeInsets.all(1.0),
                              child: PinPut(
                                fieldsCount: 6,
                                withCursor: true,
                                textStyle: const TextStyle(fontSize: 25.0, color: Colors.white),
                                eachFieldWidth: 55.0,
                                eachFieldHeight: 55.0,
                                //onSubmit: (String pin) => _showSnackBar(pin),
                                focusNode: _pinPutFocusNode,
                                controller: _pinPutController,
                                submittedFieldDecoration: pinPutDecoration,
                                selectedFieldDecoration: pinPutDecoration,
                                followingFieldDecoration: pinPutDecoration,
                                pinAnimationType: PinAnimationType.fade,
                                onSubmit: (pin)async{

                                  //getUserFromCodePhone(pin, verificationID);
                                 // try{
                                    setState(() {
                                      smsCode=pin;
                                    });
                                  //
                                  // }catch(e){
                                  //   FocusScope.of(context).unfocus();
                                  // }
                                },
                              ),
                            ),
                            SizedBox(
                              height: 20,
                            ),

                            CustomButton(
                                width: width * 0.77,
                                height: height * 0.06,
                                text: 'Next',

                                onPressed: () async {
                                  verify(smsCode);
                                 // _showMyDialog(smsCode);


                                }
                            ),
                            SizedBox(height: 20),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text("Didn't Recieve? "),
                                Text(
                                  "Click Here",
                                  style: TextStyle(
                                    color: AppColor.orange,
                                    fontWeight: FontWeight.bold,
                                  ),
                                )
                              ],
                            )
                          ],
                        ),
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


  Future<void> signup() async {
    final FirebaseAuth auth=FirebaseAuth.instance;
    try {
      AuthCredential authCredential = EmailAuthProvider.credential(
          email: widget.email,
          password: widget.password);
      await auth.currentUser!
          .linkWithCredential(authCredential)
          .then((value) async {
        await FirebaseFirestore.instance
            .collection('barbers')
            .doc(_auth.currentUser!.uid)
            .set({
          'email': widget.email,
          'first_name': widget.first,
          'last_name': widget.last,
          'phone':widget.phone,
          'barberID': _auth.currentUser!.uid,
          'image': widget.image
        }).then((value) {
          if (_auth.currentUser!= null) {
            print("suceess");
            Get.snackbar(
                'Added',
                'Successfully',
                colorText: Colors.black,
                backgroundColor: Colors.white
            );
          }
        }).catchError((e) {
          print(e);
        });
      }).catchError((e) {
        print(e);
      });
      await FirebaseAuth.instance.currentUser?.updateProfile(
        displayName: widget.first + ' ' + widget.last,
      );
      Get.back();
    } on FirebaseAuthException catch (e) {
      String message="";
      if (e.code == 'weak-password') {
        message = 'The password provided is too weak.';
      } else if (e.code == 'email-already-in-use') {
        message = 'The account already exists for that email.';
      }
      // //Get.back();
      // Get.snackbar(
      //   'Error',
      //   message,
      //   colorText: Colors.black,
      // );
    } catch (e) {
      //Get.back();
      Get.snackbar(
        'Error Occurred',
        'Something went wrong. Try again',
        colorText: AppColor.orange,
      );
    }
  }

  Future<User?> getUserFromCodePhone(
      String code, String verificationID) async {
    FirebaseAuth mAuth = FirebaseAuth.instance;

    AuthCredential phoneAuthCredential = PhoneAuthProvider.credential(
        verificationId: verificationID, smsCode: code);
    try {
      UserCredential result = await mAuth.signInWithCredential(phoneAuthCredential);

      User? currentUser = await mAuth.currentUser!;
      if (currentUser != null && result.user?.uid == currentUser.uid) {
        return currentUser;
      } else {
        return null;
      }
    } on PlatformException catch (_) {}

    return null;
  }

  FirebaseAuth auth = FirebaseAuth.instance;
  _verifyPhone() async {
    await FirebaseAuth.instance.verifyPhoneNumber(
      phoneNumber: '${widget.phone}',
      verificationCompleted: (PhoneAuthCredential credential) async {
            signup();
            Navigator.push(context,
              MaterialPageRoute(builder: (context) => const Registered()),
            );
                },
 verificationFailed: (FirebaseAuthException e) {
        if (e.code == 'invalid-phone-number') {
          print('The provided phone number is not valid.');
        }
      },


      codeSent: (String verificationId, int? resendToken) async {
        PhoneAuthCredential credential = PhoneAuthProvider.credential(
            verificationId: verificationId, smsCode: smsCode);

            signup();
            Navigator.push(context,
              MaterialPageRoute(builder: (context) => const Registered()),
            );
      },

      timeout: const Duration(seconds: 60),
      codeAutoRetrievalTimeout: (String verificationId) {
        setState(() {
          smsCode=verificationId;
        });
      },




    );
  }



}

Future<void> loginUser(String phone, BuildContext context) async {
  FirebaseAuth _auth = FirebaseAuth.instance;
  var codeController;

  _auth.verifyPhoneNumber(
    phoneNumber: phone,
    //ye code tb chalta hai jb user k moble mey code aye aur wo auto accept kr ley
    verificationCompleted: (PhoneAuthCredential credential) async {
      // navigator is liye lagaya hai tak k aghar codeSent pr jo humney dialogue bnaya hai wo show na ho
      Navigator.of(context).pop();

      //AuthResult Replace with UserCredential class
      UserCredential result = await _auth.signInWithCredential(credential);
      // FirebaseUser Replace with User class
      User? user = result.user;

      if (user != null) {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => UserScreen()),
        );
      } else {
        print('error');
      }
    },
    //AuthException Replace with FirebaseAuthException class
    verificationFailed: (FirebaseAuthException exception) {
      if (exception.code == 'invalid-phone-number') {
        print('invalid phone number');
      }
    },
    codeSent: (String verificationId, [int? forceResendingToken]) {
      showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) {
          return AlertDialog(
            title: Text('Enter the code !'),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                TextField(
                  controller: codeController,
                ),
              ],
            ),
            actions: <Widget>[
              TextButton(
                onPressed: () async {
                  final smsCode = codeController.text.trim();
                  AuthCredential credential = PhoneAuthProvider.credential(
                      verificationId: verificationId, smsCode: smsCode);
                  UserCredential result =
                  await _auth.signInWithCredential(credential);
                  User? user = result.user;
                  if (user != null) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => UserScreen()),
                    );
                  } else {
                    print('error');
                  }
                },
                child: Text('Confrim'),
              ),
            ],
          );
        },
      );
    },
    codeAutoRetrievalTimeout: (String verificationId) {

    },
  );
}
