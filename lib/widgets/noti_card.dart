
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NotiCard extends StatefulWidget {
  final String time;
  final String des;


  NotiCard(
      {required this.time,
        required this.des
        // this.weight
      });

  @override
  _NotiCard createState() => _NotiCard();
}

class _NotiCard extends State<NotiCard> {

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width= MediaQuery.of(context).size.width;

    return Container(
      margin: const EdgeInsets.all(4.0),
      height: height * 0.1,
      child: Stack(
        //alignment: Alignment.center,
        children: [
          Positioned(
            // left: 60,
            child: Container(
              height: height * 0.08,
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
                    width: width*0.001,
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 8.0, horizontal: 16),


                      child: Row(

                        children: <Widget>[
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: width * 0.02),
                            child: GestureDetector(
                              onTap: () {},
                              child: const CircleAvatar(
                                radius: 40,
                                //backgroundColor: textColor,
                                backgroundImage: AssetImage('assets/images/download.png'),
                              ),
                            ),
                          ),
                          SizedBox(width: 5,),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,

                            children: <Widget>[

                              Text(

                                widget.des,

                                overflow: TextOverflow.ellipsis,

                                style: TextStyle(
                                    color: Colors.black,


                                    fontSize:
                                    MediaQuery.of(context).size.width *
                                        0.04),
                              ),
                              SizedBox(height: 10,),
                              Text(

                                widget.time,

                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                    color: Colors.black54,
                                    //fontFamily: "Poppins-Medium",
                                    //fontWeight: FontWeight.bold,
                                    fontSize:MediaQuery.of(context).size.width *
                                        0.03
                                ),
                              ),

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

        ],
      ),

    );
  }
}
