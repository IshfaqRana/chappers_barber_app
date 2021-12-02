import 'dart:io';
import 'dart:ui';
import 'package:chappers/screens/home_page.dart';
import 'package:country_code_picker/country_code_picker.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:chappers/authentication/forget_password.dart';
import 'package:chappers/const/colors.dart';
import 'package:chappers/screens/main_screen.dart';
import 'package:chappers/screens/stylist_profile.dart';
import 'package:chappers/widgets/custom_button.dart';
import 'package:chappers/widgets/custom_text_input.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

import '../../../widgets/responsive_widget.dart';
import 'otp_signup.dart';
TabController? _controller;

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key, required this.index}) : super(key: key);
  final int index;
  @override
  _Signup createState() => _Signup();
}
class _Signup extends State<SignUpScreen> with SingleTickerProviderStateMixin{
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
              "Login",
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
              "Signup",
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
        resizeToAvoidBottomInset: false,
        //resizeToAvoidBottomPadding: false,

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
                children:[
                  TabBar(
                    unselectedLabelColor: Colors.black,
                    labelColor: Colors.red,
                    tabs: [
                      Tab(
                        text: 'Login'
                      ),
                      Tab(
                        text: 'SignUp',
                      )
                    ],
                    controller: _controller,
                    indicatorSize: TabBarIndicatorSize.tab,

                  ),
              Expanded(child:TabBarView(
                 controller: _controller,

                 children: [
               Login(),
               SignUp()

                 ],
               ),
              )
                ]
              ),
              ),
              ),
),

            Positioned(
                top: height*0.05,
                left: 30,
                child: Container(
                  width: width*0.05,
                  height: height*0.05,
                  child: Image.asset('assets/images/back.png'),
                ))
          ]
      ),
      )
    );
  }


}

class SignUp extends StatefulWidget{
  static const routeName = "/signUp";

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  TextEditingController firstNameController= TextEditingController();

  TextEditingController lastNameController= TextEditingController();

  TextEditingController emailController= TextEditingController();

  TextEditingController passwordController= TextEditingController();

  TextEditingController confirmPasswordController= TextEditingController();

  TextEditingController confirmEmailController= TextEditingController();

  TextEditingController phoneController= TextEditingController();

  File? _pickedImage;
  final picker = ImagePicker();

  dynamic _pickImageError;

  void _pickImageCamera() async {
    try {
      final pickedImage = await picker.pickImage(source: ImageSource.camera);
      final pickedImageFile = File(pickedImage!.path);
      setState(() {
        _pickedImage = pickedImageFile;
      });
    }catch (e) {
      setState(() {
        _pickImageError = e;
      });
    }
  }

  void _pickImageGallery() async {
    try {
      final pickedImage = await picker.pickImage(source: ImageSource.gallery);
      final pickedImageFile = File(pickedImage!.path);
      setState(() {
        _pickedImage = pickedImageFile;
      });
    }
    catch (e) {
      setState(() {
        _pickImageError = e;
      });
    }
  }
  String? _retrieveDataError;
  Future<void> retrieveLostData() async {
    final LostDataResponse response = await picker.retrieveLostData();
    if (response.isEmpty) {
      return;
    }
    if (response.file != null) {
        setState(() {
          _pickedImage = response.file as File?;

        });

    } else {
      _retrieveDataError = response.exception!.code;
    }
  }

  void _showPicker(context) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext bc) {
          return SafeArea(
            child: Container(
              child: Wrap(
                children: <Widget>[
                  ListTile(
                      leading: Icon(Icons.photo_library),
                      title: Text('Gallery'),
                      onTap: () {
                        _pickImageGallery();
                        Navigator.of(context).pop();
                      }),
                  ListTile(
                    leading: Icon(Icons.photo_camera),
                    title: const Text('Camera'),
                    onTap: () {
                      _pickImageCamera();
                      Navigator.of(context).pop();
                    },
                  ),
                ],
              ),
            ),
          );
        });
  }
  String code="";
  void _onCountryChange(CountryCode countryCode) {
    this.code =  countryCode.toString();
    print("New Country selected: " + countryCode.toString());
  }
  DatabaseReference? _ref;
  String ph="";
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    var focusnode = new FocusNode();
    return
      ResponsiveLayout(
        mobileBody: Scaffold(
          body:
        Center(
          child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(height: height*0.02,),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: width * 0.20),
                child: GestureDetector(
                  onTap: () {
                    _showPicker(context);
                    },
                  child: CircleAvatar(
                    radius: 40,
                    //backgroundColor: textColor,
                    backgroundImage: _pickedImage == null ? null : FileImage(_pickedImage!) ,
                  ),
                ),
              ),
              SizedBox(
                height: height * 0.02,
              ),
              CustomTextField(
                label: 'First Name',
                keyboardType: TextInputType.name,
                controller: firstNameController,
              ),
              CustomTextField(
                label: 'Last Name',
                keyboardType: TextInputType.name,
                controller: lastNameController,
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Container(
                  height: 50,
                  width: MediaQuery.of(context).size.width,
                  //padding: const EdgeInsets.all(18),
                  decoration: const ShapeDecoration(
                    color: AppColor.placeholderBg,
                    shape: StadiumBorder(),
                  ),
                  child: Row(
                    //crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      SizedBox(
                        height:60,
                        width:MediaQuery.of(context).size.width*0.3,
                        child: CountryCodePicker(
                          onChanged: _onCountryChange,
                          // Initial selection and favorite can be one of code ('IT') OR dial_code('+39')
                          initialSelection: 'PK',
                          favorite: [ 'FR','PK'],
                          showCountryOnly: false,
                          // optional. Shows only country name and flag when popup is closed.
                          showOnlyCountryWhenClosed: false,
                          // optional. aligns the flag and the Text left
                          alignLeft: false,    comparator: (a, b) => b.name!.compareTo(a.name!),
                          //Get the country information relevant to the initial selection
                          onInit: (code) =>
                              print("on init ${code!.name} ${code.dialCode} ${code.name}"),

                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(left:8.0),
                          child: TextField(
                            keyboardType: TextInputType.phone,
                            controller: phoneController,
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: "Phone Number",
                            ),
                            onChanged: (value) {
                              // this.phoneNo=value;
                              print(value);
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              CustomTextField(
                label: 'Email',
                keyboardType: TextInputType.emailAddress,
                controller: emailController,
              ),

              CustomTextField(
                label: 'Password',
                isPassword: true,
                keyboardType: TextInputType.visiblePassword,
                controller: passwordController,
              ),
              CustomTextField(
                label: 'Confirm Password',
                isPassword: true,
                keyboardType: TextInputType.visiblePassword,
                controller: confirmPasswordController,
              ),
              SizedBox(
                height: height * 0.02,
              ),
              CustomButton(
                  width: width * 0.77,
                  height: height * 0.06,
                  text: 'Next',

                  onPressed: () async {
                    if (!validateForm()) {
                      // Get.back();

                      Get.snackbar(
                        'Error',
                        'Please Fill the Form First',
                        colorText: Colors.black,
                      );
                    } else {
                      ph=code+phoneController.text;
                      print(ph);
                      DateTime time= DateTime.now();

                      Reference storageReference = FirebaseStorage.instance
                          .ref()
                          .child('barberProfileImages/time.png');
                      UploadTask uploadTask = storageReference.putFile(File(_pickedImage!.path));
                      final TaskSnapshot url=(await uploadTask.whenComplete(() => print('Uploaded')));
                      final String postImage=await url.ref.getDownloadURL();

                      Navigator.push(context,
                        MaterialPageRoute(builder: (context) => OTPSignup(
                            phone: ph,
                            email: emailController.text,
                            first: firstNameController.text,
                            last: lastNameController.text,
                            password: passwordController.text,
                            image:postImage
                        )),
                      );
                    }
                  }
              ),
              SizedBox(
                height: height * 0.02,
              ),
              GestureDetector(
                onTap: () {
                  _controller?.index=0;
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("Already have an Account?"),
                    TextButton(
                      onPressed: () {
                        Navigator.push(context,
                          MaterialPageRoute(builder: (context) => const SignUpScreen(index: 0,)),
                        );
                      },
                      child: Text(
                        "Login",
                        style: TextStyle(
                          color: AppColor.orange,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
    ),
        ),
        ) );

  }

  bool validateForm() {
    if (firstNameController.text.isEmpty || lastNameController.text.isEmpty) {
      return false;
    }
    if (!GetUtils.isEmail(emailController.text)) {
      return false;
    }
    if (confirmPasswordController.text != passwordController.text) {
      return false;
    }


    return true;
  }

  Future<void> signup() async {

    try {
      UserCredential? userCredential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: emailController.text,
          password: passwordController.text
      ).then((signedInUser) {
        FirebaseFirestore.instance
            .collection('users')
            .doc(signedInUser.user!.uid)
            .set({
          'email': emailController.text,
          'first_name': firstNameController.text,
          'last_name': lastNameController.text,
          'phone':phoneController.text,
          'uid': signedInUser.user!.uid,
          'followers':1
        }).then((value) {
          if (signedInUser != null) {
            print("suceess");
            Get.snackbar(
              'Added',
              'Successfully',
              colorText: AppColor.orange,
            );
          }
        }).catchError((e) {
          print(e);
        });
      }).catchError((e) {
        print(e);
      });
      await FirebaseAuth.instance.currentUser?.updateProfile(
        displayName: firstNameController.text + ' ' + lastNameController.text,
      );
      Get.back();
    } on FirebaseAuthException catch (e) {
      String message="";
      if (e.code == 'weak-password') {
        message = 'The password provided is too weak.';
      } else if (e.code == 'email-already-in-use') {
        message = 'The account already exists for that email.';
      }
      //Get.back();
      Get.snackbar(
        'Error',
        message,
        colorText: AppColor.orange,
      );
    } catch (e) {
      //Get.back();
      Get.snackbar(
        'Error Occurred',
        'Something went wrong. Try again',
        colorText: AppColor.orange,
      );
    }
  }
  @override
  void onClose() {
    firstNameController.dispose();
    lastNameController.dispose();
    emailController.dispose();
    phoneController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
  }
}
// ResponsiveLayout(
// mobileBody: Scaffold(
// body:
// Center(
// child: SingleChildScrollView(
// child: Column(
// mainAxisAlignment: MainAxisAlignment.start,
// children: [
// SizedBox(height: height*0.02,),
// Padding(
// padding: EdgeInsets.symmetric(horizontal: width * 0.20),
// child: GestureDetector(
// onTap: () {},
// child: CircleAvatar(
// radius: 40,
// //backgroundColor: textColor,
// backgroundImage: AssetImage('assets/images/asset2.png'),
class Login extends StatefulWidget{
  static const routeName = "/login";


  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController emailController= TextEditingController();

  TextEditingController passwordController= TextEditingController();

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return ResponsiveLayout(
      mobileBody: Scaffold(
          body:
        Center(
          child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                height: height * 0.02,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: width * 0.20),
                child: GestureDetector(
                  onTap: () {},
                  child: const CircleAvatar(
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
                label: 'Email',
                keyboardType: TextInputType.emailAddress,
                controller: emailController,
              ),
              CustomTextField(
                label: 'Password',
                isPassword: true,
                keyboardType: TextInputType.visiblePassword,
                controller: passwordController,
              ),
              Padding(
                  padding: EdgeInsets.only(right: 20),
                  child: Container(
                    width: double.infinity,
                    child: InkWell(
                      onTap: () {
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (BuildContext context) =>
                                    ForgotScreen()));
                      },
                      child: Text(
                        "Forgot password ?",
                        style: TextStyle(color: Colors.blue),
                        textAlign: TextAlign.right,
                      ),
                    ),
                  )),

              SizedBox(
                height: height * 0.02,
              ),
              CustomButton(
               width: width * 0.77,
                height: height * 0.06,
                text: 'Login',

                onPressed: () async {


              try {
                  UserCredential userCredential = await FirebaseAuth.instance.signInWithEmailAndPassword(
                  email: emailController.text,
                  password: passwordController.text
                  );
                 var counting= await FirebaseFirestore.instance.collection('Posts').where('barberID', isEqualTo: FirebaseAuth.instance.currentUser!.uid).get();
                  int count=counting.docs.length;
                  print(count);
                  if(count!=0){
                  Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const UserScreen()),
                  );
                  }
                  else{
                    Navigator.push(context,
                      MaterialPageRoute(builder: (context) => const HomeScreen()),
                    );
                  }
                  } on FirebaseAuthException catch (e) {
                  if (e.code == 'user-not-found') {
                  print('No user found for that email.');
                  } else if (e.code == 'wrong-password') {
                  print('Wrong password provided for that user.');
                  }
                  }


                          },
              ),
              SizedBox(
                height: height * 0.02,
              ),
              GestureDetector(
                onTap: () {
                  _controller?.index=1;
                  Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const SignUpScreen(index: 1,)),
                  );

                },
                //   Navigator.of(context)
                //       .pushReplacementNamed(LoginScreen.routeName);
                // },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Already have an Account?"),
                    Text(
                      "Signup",
                      style: TextStyle(
                        color: AppColor.orange,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
      ),
        )),
    );

  }

  @override
  void onClose() {
    emailController.dispose();
    passwordController.dispose();
  }
}