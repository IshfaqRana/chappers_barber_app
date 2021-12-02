
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProductItem extends StatefulWidget {
  final String description;
  final String name;
  final String image;
  final String price;
  final String button;
  final VoidCallback onPressed;


  ProductItem(
      {required this.name,

        required this.image,

        required this.description, required this.price,required this.button, required this.onPressed,
        // this.weight
      });

  @override
  _ProductItemState createState() => _ProductItemState();
}

class _ProductItemState extends State<ProductItem> {


  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width= MediaQuery.of(context).size.width;

    //num price=widget.myRating;
    //String price1 = price.toStringAsFixed(2);
    //double p=double.parse(price1);
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

                          Row(
                            children: [
                              Text(

                                widget.name,

                                overflow: TextOverflow.ellipsis,

                                style: TextStyle(
                                    color: Colors.black,

                                    fontWeight: FontWeight.bold,
                                    fontSize:
                                    MediaQuery.of(context).size.width *
                                        0.04),
                              ),
                              SizedBox(width: 5,),
                              Text(

                                widget.price,

                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                    color: Colors.black,
                                    //fontFamily: "Poppins-Medium",
                                    //fontWeight: FontWeight.bold,
                                    fontSize:MediaQuery.of(context).size.width *
                                        0.03
                                ),
                              ),

                            ],
                          ),
                          SizedBox(height: 5,),
                          Text(
                            widget.description,
                            style: TextStyle(
                                color: Colors.black,
                                //fontWeight: FontWeight.bold,
                                //fontFamily: "Poppins-Semibold",
                                fontSize: MediaQuery.of(context).size.width *
                                    0.03),
                            maxLines: 1,
                            overflow: TextOverflow.fade,
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
            left: 16,
            top: 11,
            height: height * 0.06,
            width: height * 0.06,


            child: Container(


              child:Image.asset(widget.image,fit: BoxFit.cover),

              alignment: Alignment.centerRight,
              decoration: BoxDecoration(
                  color: Color(0xFF222222),

                  borderRadius: BorderRadius.circular(10)),

            ),


          ),
          Positioned(
              right: 10,
              top: 15,
              child:
          Container(
            width: width*0.23,
            height: height*0.04,
            child: FlatButton(
              onPressed: widget.onPressed,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5),

              ),
              color: Colors.red,
              child: Text(
                widget.button,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 10,

                ),
                maxLines: 1,
              ),

            ),
          )
          )
        ],
      ),

    );
  }
}
