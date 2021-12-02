import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SlotsCard extends StatefulWidget {
  final String date;


  SlotsCard(
      {required this.date,
        // this.weight
      });

  @override
  _SlotsCard createState() => _SlotsCard();
}

class _SlotsCard extends State<SlotsCard> {
  String time="";
  String cat="";
  Widget _TimeSlots(String title) {
    return InkWell(
      child: Container(
        height: 30,
        width: 70,
        decoration: BoxDecoration(
          color: time == title ? Colors.red : Colors.white,
          borderRadius: BorderRadius.circular(5),
        ),
        child: Center(
          child: Text(
            title,
            style: const TextStyle(fontSize: 14, color: Colors.black),
          ),
        ),
      ),
      onTap: () {
        setState(() {
          cat = title;
          time = title;
        });
      },
    );
  }
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width= MediaQuery.of(context).size.width;

    return Container(
      margin: const EdgeInsets.all(4.0),
      height: height * 0.2,
      child: Stack(
        //alignment: Alignment.center,
        children: [
          Positioned(
            // left: 60,
            child: Container(
              height: height * 0.15,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                  gradient: const LinearGradient(
                      begin: Alignment.topRight,
                      end: Alignment.bottomLeft,
                      colors: [
                        Colors.grey,
                        Colors.white,

                      ]),

                  borderRadius: BorderRadius.circular(8)),
              child: Row(
                children: <Widget>[
                  SizedBox(
                    width: width*0.17,
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 8.0, horizontal: 16),


                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,

                        children: <Widget>[

                          Text(

                            widget.date,

                            overflow: TextOverflow.ellipsis,

                            style: TextStyle(
                                color: Colors.black,

                                fontWeight: FontWeight.bold,
                                fontSize:
                                MediaQuery.of(context).size.width *
                                    0.04),
                          ),
                          SizedBox(height: 10,),
                          Text(

                            '3 Slots Available',

                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                                color: Colors.black,
                                //fontFamily: "Poppins-Medium",
                                //fontWeight: FontWeight.bold,
                                fontSize:MediaQuery.of(context).size.width *
                                    0.03
                            ),
                          ),
                          SizedBox(height: 10,),
                          Row(
                            children: [
                              _TimeSlots('08:00'),
                              SizedBox(width: 10,),

                              _TimeSlots('12:00'),
                              SizedBox(width: 10,),

                              _TimeSlots('04:00'),
                              SizedBox(width: 10,),
                            ],
                          ),
                        ],
                      ),

                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
              right: width*0.1,
              top: 11,
              child:
              Container(
                width: width*0.20,
                height: height*0.04,
                child: RaisedButton(
                  onPressed: () {  },
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5),

                  ),
                  color: Colors.red,
                  child: const Text(
                    'Edit',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 12,

                    ),
                  ),

                ),
              )
          )
        ],
      ),

    );
  }
}
