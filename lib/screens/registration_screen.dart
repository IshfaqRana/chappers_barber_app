import 'package:chappers/screens/sign_up_screen.dart';
import 'package:chappers/widgets/custom_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Registered extends StatefulWidget{
  const Registered({Key? key}) : super(key: key);

  @override
  State<Registered> createState() =>  _Registered();
}
class _Registered extends State<Registered>{
  @override
  Widget build(BuildContext context) {
    double h=MediaQuery.of(context).size.height;
    double w=MediaQuery.of(context).size.width;
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            SizedBox(height: h*0.33,),
            SizedBox(
                height: w*0.12,
                width: w*0.12,
                child: Image.asset('assets/images/reg.png')),
            SizedBox(height: w*0.08,),

            const Text('Registration Successfully!',style: TextStyle(
              fontSize: 20,
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontFamily: 'MetroPolis'
            ),),
            SizedBox(height: w*0.04,),

            const Text('You have successfully registered your account.',style: TextStyle(
                fontSize: 16,
                color: Colors.black87,
                fontFamily: 'MetroPolis'
            ),),
            SizedBox(height: w*0.11,),

            CustomButton(
              width: w * 0.6,
              height: h * 0.06,
              text: 'Proceed to Login',
              onPressed: () async {
                Navigator.push(context, MaterialPageRoute(builder: (context)=>const SignUpScreen(index: 0)));

              },
            ),
          ],
        )
      ),
    );
  }



}