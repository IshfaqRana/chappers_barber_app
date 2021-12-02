import 'package:chappers/const/colors.dart';
import 'package:country_code_picker/country_code_picker.dart';
import 'package:country_code_picker/country_localizations.dart';
import 'package:flutter/material.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';


class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController phoneController = new TextEditingController();
  String phoneNumber = "";

  void _onCountryChange(CountryCode countryCode) {
    this.phoneNumber =  countryCode.toString();
    print("New Country selected: " + countryCode.toString());
  }

  void check(){
    print("Full Text: "+ this.phoneNumber + phoneController.text);
  }
  final TextEditingController nameController = TextEditingController();
  final TextEditingController controller = TextEditingController();

  String initialCountry = 'NG';
  PhoneNumber number = PhoneNumber(isoCode: 'NG');
  bool _viewpassword=false;
  @override
  Widget build(BuildContext context) {
    Widget _password() {
      return Center(
        child: Padding(
          padding: EdgeInsets.only(left: 0, right: 0),
          child: Container(
            height: 55,
            child: TextField(
              style: TextStyle(color: Colors.white),
              obscureText: _viewpassword,
              decoration: InputDecoration(
                fillColor: Colors.white,
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(25.0),
                  borderSide: BorderSide(
                    color: Colors.white,
                    width: 0.5,
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                    borderRadius: new BorderRadius.circular(25.0),
                    borderSide: BorderSide(color: Colors.white)),
                border: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.black),
                ),
                labelText: 'Your App Password',
                hintStyle: TextStyle(color: Colors.white),
                // prefixIcon: Padding(
                //   padding: const EdgeInsets.only(top: 1, bottom: 1),
                //   child: Container(
                //     height: 58,
                //     width: 60,
                //     decoration: const BoxDecoration(
                //         image: DecorationImage(
                //             image: AssetImage("assets/images/password.png"),
                //             fit: BoxFit.cover)),
                //   ),
                // ),
                suffixIcon: GestureDetector(
                  child: _viewpassword
                      ? Icon(Icons.visibility_outlined)
                      : Icon(Icons.visibility_off),
                  onTap: () {
                    if (_viewpassword == false) {
                      setState(() {
                        _viewpassword = true;
                      });
                    } else {
                      setState(() {
                        _viewpassword = false;
                      });
                    }
                  },
                ),
                labelStyle: TextStyle(
                  color: Color.fromRGBO(0, 50, 78, 10),
                ),
                hintText: 'Your App Password',
              ),
            ),
          ),
        ),
      );
    }
    Widget _name() {
      return Center(
        child: Padding(
          padding: EdgeInsets.only(left: 0, right: 0),
          child: Container(
            height: 55,
            child: TextField(
              style: TextStyle(color: Colors.white),
              decoration: InputDecoration(
                fillColor: Colors.white,
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(25.0),
                  borderSide: BorderSide(
                    color: Colors.white,
                    width: 0.5,
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                    borderRadius: new BorderRadius.circular(25.0),
                    borderSide: BorderSide(color: Colors.white)),
                border: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.black),
                ),
                labelText: 'First Name',
                hintStyle: TextStyle(color: Colors.white),
                // prefixIcon: Padding(
                //   padding: const EdgeInsets.only(top: 1, bottom: 1),
                //   child: Container(
                //     height: 58,
                //     width: 60,
                //     decoration: const BoxDecoration(
                //         image: DecorationImage(
                //             image: AssetImage("assets/images/aa.png"),
                //             fit: BoxFit.cover)),
                //   ),
                // ),

                labelStyle: TextStyle(
                  color: Color.fromRGBO(0, 50, 78, 10),
                ),
                hintText: 'First Name',
              ),
            ),
          ),
        ),
      );
    }
    Widget _phone() {
      return Center(
        child: Padding(
          padding: EdgeInsets.only(left: 0, right: 0),
          child: Container(
            height: 55,
            child: TextField(
              style: TextStyle(color: Colors.white),
              decoration: InputDecoration(
                fillColor: Colors.white,
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(25.0),
                  borderSide: BorderSide(
                    color: Colors.white,
                    width: 0.5,
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                    borderRadius: new BorderRadius.circular(25.0),
                    borderSide: BorderSide(color: Colors.white)),
                border: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.black),
                ),
                labelText: 'Enter Valid Mobile Number',
                hintStyle: TextStyle(color: Colors.white),
                // prefixIcon: Padding(
                //   padding: const EdgeInsets.only(top: 1, bottom: 1),
                //   child: Container(
                //     height: 58,
                //     width: 60,
                //     decoration: const BoxDecoration(
                //         image: DecorationImage(
                //             image: AssetImage("assets/images/aa.png"),
                //             fit: BoxFit.cover)),
                //   ),
                // ),

                labelStyle: TextStyle(
                  color: Color.fromRGBO(0, 50, 78, 10),
                ),
                hintText: 'Enter valid Mobile Number',
              ),
            ),
          ),
        ),
      );
    }
    Widget _last() {
      return Center(
        child: Padding(
          padding: EdgeInsets.only(left: 0, right: 0),
          child: Container(
            height: 55,
            child: TextField(
              style: TextStyle(color: Colors.white),
              decoration: InputDecoration(
                fillColor: Colors.white,
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(25.0),
                  borderSide: BorderSide(
                    color: Colors.white,
                    width: 0.5,
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                    borderRadius: new BorderRadius.circular(25.0),
                    borderSide: BorderSide(color: Colors.white)),
                border: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.black),
                ),
                labelText: 'Last Name',
                hintStyle: TextStyle(color: Colors.white),
                // prefixIcon: Padding(
                //   padding: const EdgeInsets.only(top: 1, bottom: 1),
                //   child: Container(
                //     height: 58,
                //     width: 60,
                //     decoration: const BoxDecoration(
                //         image: DecorationImage(
                //             image: AssetImage("assets/images/aa.png"),
                //             fit: BoxFit.cover)),
                //   ),
                // ),

                labelStyle: TextStyle(
                  color: Color.fromRGBO(0, 50, 78, 10),
                ),
                hintText: 'Last Name',
              ),
            ),
          ),
        ),
      );
    }
    Widget _email() {
      return Center(
        child: Padding(
          padding: EdgeInsets.only(left: 0, right: 0),
          child: Container(
            height: 55,
            child: TextField(
              style: TextStyle(color: Colors.white),
              decoration: InputDecoration(
                fillColor: Colors.white,
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(25.0),
                  borderSide: BorderSide(
                    color: Colors.white,
                    width: 0.5,
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                    borderRadius: new BorderRadius.circular(25.0),
                    borderSide: BorderSide(color: Colors.white)),
                border: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.black),
                ),
                labelText: 'Valid Email',
                hintStyle: TextStyle(color: Colors.white),
                // prefixIcon: Padding(
                //   padding: const EdgeInsets.only(top: 1, bottom: 1),
                //   child: Container(
                //     height: 58,
                //     width: 60,
                //     decoration: const BoxDecoration(
                //         image: DecorationImage(
                //             image: AssetImage("assets/images/email.png"),
                //             fit: BoxFit.cover)),
                //   ),
                // ),

                labelStyle: TextStyle(
                  color: Color.fromRGBO(0, 50, 78, 10),
                ),
                hintText: 'Valid Email',
              ),
            ),
          ),
        ),
      );
    }
    Widget _confpassword() {
      return Center(
        child: Padding(
          padding: EdgeInsets.only(left: 0, right: 0),
          child: Container(
            height: 55,
            child: TextField(
              style: TextStyle(color: Colors.white),
              obscureText: _viewpassword,
              decoration: InputDecoration(
                fillColor: Colors.white,
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(25.0),
                  borderSide: BorderSide(
                    color: Colors.white,
                    width: 0.5,
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                    borderRadius: new BorderRadius.circular(25.0),
                    borderSide: BorderSide(color: Colors.white)),
                border: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.black),
                ),
                labelText: 'Confirm Password',
                hintStyle: TextStyle(color: Colors.white),
                // prefixIcon: Padding(
                //   padding: const EdgeInsets.only(top: 1, bottom: 1),
                //   child: Container(
                //     height: 58,
                //     width: 60,
                //     decoration: const BoxDecoration(
                //         image: DecorationImage(
                //             image: AssetImage("assets/images/password.png"),
                //             fit: BoxFit.cover)),
                //   ),
                // ),
                suffixIcon: GestureDetector(
                  child: _viewpassword
                      ? Icon(Icons.visibility_outlined)
                      : Icon(Icons.visibility_off),
                  onTap: () {
                    if (_viewpassword == false) {
                      setState(() {
                        _viewpassword = true;
                      });
                    } else {
                      setState(() {
                        _viewpassword = false;
                      });
                    }
                  },
                ),
                labelStyle: TextStyle(
                  color: Color.fromRGBO(0, 50, 78, 10),
                ),
                hintText: 'Confirm Password',
              ),
            ),
          ),
        ),
      );
    }

    return Scaffold(

      body:Container(
        width: double.infinity,
        decoration: const BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.fill,
              image: AssetImage('assets/images/splah.png'),
            )),
        child: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(begin: Alignment.bottomRight, colors: [
                Colors.black.withOpacity(0.1),
                Colors.black.withOpacity(0.1),
              ])),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 18.0,right: 10),
                child: SizedBox(
                  height: 100,
                  width: 100,
                  child: Image.asset('assets/images/logo.png'),
                ),
              ),
              Padding(
                  padding: EdgeInsets.only(left: 40.0,right: 10,top: 5),
                  child: Row(
                    children: [
                      SizedBox(
                        width: MediaQuery.of(context).size.width*0.5,
                        child:const Text('Click on the flag and select your country mobile number',style: TextStyle(fontSize: 12,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'MetroPolis',
                            color: Colors.black
                        ),
                          maxLines: 2,
                          overflow: TextOverflow.fade,
                        ),
                      ),
                      SizedBox(
                          height:60,
                          width:MediaQuery.of(context).size.width*0.3,
                          child: CountryCodePicker(
                            onChanged: print,
                            // Initial selection and favorite can be one of code ('IT') OR dial_code('+39')
                            initialSelection: 'GR',
                            favorite: [ 'FR','GR'],
                            showCountryOnly: false,
                            // optional. Shows only country name and flag when popup is closed.
                            showOnlyCountryWhenClosed: false,
                            // optional. aligns the flag and the Text left
                            alignLeft: false,    comparator: (a, b) => b.name!.compareTo(a.name!),
                            //Get the country information relevant to the initial selection
                            onInit: (code) =>
                                print("on init ${code!.name} ${code.dialCode} ${code.name}"),

                          ),
                      )
                    ],
                  )
              ),
              Padding(
                padding: const EdgeInsets.only(left: 40.0,right: 40,top: 5),
                child: _phone(),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 40,right: 40,top: 10),
                child: _name(),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 40,right: 40,top: 10),
                child: _last(),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 40,right: 40,top: 10),
                child: _email(),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 40,right: 40,top: 10),
                child: _password(),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 40,right: 40,top: 10),
                child: _confpassword(),
              ),
              Padding(
                  padding: EdgeInsets.only(left: 40,right: 40,top: 30),
                  child: CustomButton(text: 'Signup',
                    onPressed: (){},
                    width: MediaQuery.of(context).size.width,
                    height: 50,
                  )
              ),
              const Padding(
                  padding: EdgeInsets.only(left: 40.0,right: 40,top: 10),
                  child: InkWell(
                    child: Text('Login?',style: TextStyle(fontSize: 16,
                        color: Colors.white
                    ),
                      maxLines: 1,
                      overflow: TextOverflow.fade,
                    ),
                  )
              ),
              const Padding(
                  padding: EdgeInsets.only(left: 40.0,right: 40,top: 10),
                  child: InkWell(
                    child: Text('By Pressing Submit you agree to our',style: TextStyle(fontSize: 13,
                        color: Colors.white
                    ),
                      maxLines: 1,
                      overflow: TextOverflow.fade,
                    ),
                  )
              ),
              const Padding(
                  padding: EdgeInsets.only(left: 40.0,right: 40,top: 5),
                  child: InkWell(
                    child: Text('Terms & Conditions',style: TextStyle(fontSize: 13,
                        color: Colors.blue
                    ),
                      maxLines: 1,
                      overflow: TextOverflow.fade,
                    ),
                  )
              ),

            ],
          ),
        ),
      ),

    );
  }

  void getPhoneNumber(String phoneNumber) async {
    PhoneNumber number =
    await PhoneNumber.getRegionInfoFromPhoneNumber(phoneNumber, 'US');

    setState(() {
      this.number = number;
    });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}

class CustomButton extends StatelessWidget {
  final String? text;
  final VoidCallback? onPressed;
  final double? width;
  final double? height;

  CustomButton({
    this.text,
    this.onPressed,
    this.width,
    this.height,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      child: FlatButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(40),
        ),
        color: Colors.blue,
        child: Text(
          text!,
          style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.white,
              fontSize: 18,
              fontFamily: 'MetroPolis'
          ),
        ),
        onPressed: onPressed,
      ),
    );
  }
}
