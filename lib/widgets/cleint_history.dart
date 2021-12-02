import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';

class ClientHisCard extends StatefulWidget{
  const ClientHisCard({Key? key,}) : super(key: key);
  @override
  State<ClientHisCard> createState() => _ClientHisCardState();
}

class _ClientHisCardState extends State<ClientHisCard> {
  String t="Paid";

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return Center(
        child: Container(
            height: height*0.45,
            width: width,
            decoration: BoxDecoration(
              color: Colors.grey,
              border: Border.all(
                color: Colors.grey,
                width: 20,
              ),
              borderRadius: BorderRadius.circular(12),

            ),
            child: Column(
              // mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Align(
                  alignment: Alignment.topCenter,
                  child: CircleAvatar(
                    radius: 30,
                    //backgroundColor: textColor,
                    backgroundImage: AssetImage('assets/images/asset2.png'),
                  ),

                ),
                SizedBox(height: height*0.005,),

                SizedBox(


                  child: Text('Stylish Name',style: TextStyle(fontWeight: FontWeight.bold,
                      color: Colors.black,
                      fontSize: 12
                  ),
                    //maxLines: 2,
                    //textAlign: TextAlign.center,
                  ),
                ),
                SizedBox(height: height*0.03,),

                Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    color: Colors.white,
                    elevation: 5,
                    child: Container(

                      padding: const EdgeInsets.all(5),
                      child: Column(
                        children: [

                          Container(
                            height: height * 0.07,
                            width: MediaQuery.of(context).size.width,
                            child: Row(
                              //crossAxisAlignment: CrossAxisAlignment.start,
                              //mainAxisAlignment: MainAxisAlignment.start,
                              children: <Widget>[
                                Container(
                                  height: height * 0.06,
                                  width: height * 0.06,

                                  child:Image.asset('assets/images/hair.png',fit: BoxFit.fill),

                                  alignment: Alignment.centerRight,
                                  decoration: BoxDecoration(
                                      color: Color(0xFF222222),

                                      borderRadius: BorderRadius.circular(10)),

                                ),
                                Container(
                                  padding:  EdgeInsets.only(left: width*0.02,top: width*0.02),


                                  child: Column(
                                    //mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment: CrossAxisAlignment.start,

                                    children: <Widget>[

                                      Row(
                                        //crossAxisAlignment: CrossAxisAlignment.start,
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        children: [
                                          Text(

                                            'Hair Cut',

                                            overflow: TextOverflow.ellipsis,

                                            style: TextStyle(
                                                color: Colors.black,

                                                fontWeight: FontWeight.bold,
                                                fontSize:
                                                MediaQuery.of(context).size.width *
                                                    0.03),
                                          ),
                                          SizedBox(width: 5,),
                                          Text(

                                            'RS500-RS1500',

                                            overflow: TextOverflow.ellipsis,
                                            style: TextStyle(
                                              color: Colors.black,
                                              //fontFamily: "Poppins-Medium",
                                              //fontWeight: FontWeight.bold,
                                              fontSize:MediaQuery.of(context).size.width *
                                                  0.025,

                                            ),
                                          ),

                                        ],
                                      ),
                                      SizedBox(height: 10,),
                                      Text(
                                        'Wash and blow dry Included',
                                        style: TextStyle(
                                          color: Colors.black,
                                          //fontWeight: FontWeight.bold,
                                          //fontFamily: "Poppins-Semibold",
                                          fontSize: MediaQuery.of(context).size.width *
                                              0.025,

                                        ),
                                        maxLines: 1,
                                        overflow: TextOverflow.fade,
                                      ),
                                    ],
                                  ),

                                ),
                                Container(
                                  padding:  EdgeInsets.only(left: width*0.18,top: width*0.02,right: 5),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: <Widget>[

                                      Text(

                                        'Wed, 02 Feb',

                                        overflow: TextOverflow.ellipsis,

                                        style: TextStyle(
                                            color: Colors.black,

                                            fontWeight: FontWeight.bold,
                                            fontSize:
                                            MediaQuery.of(context).size.width *
                                                0.03),
                                      ),
                                      SizedBox(height: 10,),
                                      Text(

                                        '08:00 AM',

                                        overflow: TextOverflow.ellipsis,

                                        style: TextStyle(
                                            color: Colors.black,

                                            fontWeight: FontWeight.bold,
                                            fontSize:
                                            MediaQuery.of(context).size.width *
                                                0.03),
                                      ),
                                    ],
                                  ),

                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: width*0.008,),
                          Card(
                            child:Container(
                              width: width * 0.65,
                              height: height * 0.06,
                              decoration: BoxDecoration(
                                //boxShadow: Colors.grey,
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Row(
                                children: [
                                  SizedBox(
                                    width: width*0.12,
                                    //height: height*0.04,

                                    child: Icon(
                                      Icons.location_on_sharp,
                                      color: Colors.red,
                                      size: 40,
                                    ),
                                  ),
                                  SizedBox(width: 3,),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: const [

                                      Text('Appointment Location',style: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black

                                      ),
                                        overflow: TextOverflow.ellipsis,
                                        textAlign: TextAlign.start,
                                        maxLines: 1,

                                      ),
                                      SizedBox(
                                        height: 4,
                                      ),
                                      Text('M13, Military Accounts, Johar Town',style: TextStyle(
                                          fontSize: 10,
                                          color: Colors.black
                                      ),
                                        overflow: TextOverflow.ellipsis,
                                        textAlign: TextAlign.start,
                                        maxLines: 1,

                                      )
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    )
                ),
                SizedBox(height: height*0.03,),
                SizedBox(
                  width: width * 0.7,
                  height: height * 0.05,
                  child: const Text(
                    'Service has been provided',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                      fontSize: 20,

                    ),
                    maxLines: 1,
                  ),
                ),


              ],
            )
        )
    );
  }
}