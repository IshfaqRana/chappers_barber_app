import 'package:chappers/screens/home_page.dart';
import 'package:chappers/screens/pop_up_image.dart';
import 'package:chappers/widgets/text_fiels.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';

class HomeCard extends StatefulWidget{
  final String name;
  final String city;
  final String about;
  final String time;
  final bool like;
  final bool bookmark;
  final String image;
  final int likes;
  final int comment;
  final String barberImage;
  final DocumentSnapshot documentSnapshot;

  const HomeCard({Key? key, required this.name,
    required this.city,
    required this.about,
    required this.time,
    required this.bookmark,
    required this.image,
    required this.like,
    required this.likes,
    required this.comment,required this.documentSnapshot,
    required this.barberImage}
    ) : super(key: key);

  @override
  State<HomeCard> createState() => _HomeCardState();
}

class _HomeCardState extends State<HomeCard> {
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Center(
      child: Container(
        height: height*0.61,
      width: width,
          decoration: BoxDecoration(
color: Colors.white,
            border: Border.all(
              color: Colors.white,
              width: 2,
            ),
            borderRadius: BorderRadius.circular(12),

          ),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        color: Colors.white,
        elevation: 1,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 10.0,right: 10,top: 5,bottom: 5),
              child: SizedBox(
                height: height*0.08,
                //color: Colors.green,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      //mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        InkWell(
                          onTap: () {
                            Navigator.push(context,
                              MaterialPageRoute(builder: (context) => const HomeScreen()),
                            );
                          },
                          child: CircleAvatar(
                            radius: 30,
                            //backgroundColor: textColor,
                            backgroundImage: NetworkImage(widget.barberImage)
                            //AssetImage('assets/images/asset1.png'),
                          ),
                        ),
                        SizedBox(width: width*0.02,),
                        Column(
                          //mainAxisAlignment: MainAxisAlignment.start,
                         crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(height: width*0.014,),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [

                                Text(widget.name,style: const TextStyle(color:Colors.black,
                                fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'MetroPolis'
                                ),),
                                SizedBox(width: width*0.03,),
                              ],
                            ),
                            SizedBox(height: width*0.02,),
                            Text(widget.city,style: TextStyle(color:Colors.black,
                                fontSize: 14,

                            ),),
                          ],
                        ),
                      ],
                    ),
                    Align(
                      alignment: Alignment.bottomRight,

                      child:
                      PopupMenuButton<String>(
                        iconSize: 30,
                        onSelected: choiceAction,
                        itemBuilder: (BuildContext context){
                          return Constants.choices.map((String choice){
                            return PopupMenuItem<String>(
                              value: choice,
                              child: Text(choice),
                            );
                          }).toList();
                        },
                      )
                      // IconButton( icon: const Icon(Icons.more_vert_sharp,size: 30,),
                      //   onPressed: () {  },),
                    )
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10.0),
              child: Text(widget.about,style: TextStyle(color: Colors.black,
                  fontSize: 14,

              ),),
            ),

            InkWell(
              onTap: (){
                Navigator.of(context).push(MaterialPageRoute(builder: (context) =>
                 SliderShowFullmages(current: 1,image: widget.image,)));
              },
              child: SizedBox(
                  width: width,
                  height: height*0.35,
                  child: Image.network(widget.image,fit: BoxFit.fill,),
            )
            ),
            SizedBox(height: width*0.014,),
            Padding(
              padding: const EdgeInsets.only(left: 10.0,right: 10,),
              child: Row(
                children: [
                  widget.like==true?
                  Icon(Icons.local_fire_department,size: 30,color: Colors.deepOrangeAccent,):
                  Icon(Icons.local_fire_department,size: 30,color: Colors.black,),
                  SizedBox(width: width*0.03,),
                  SizedBox(
                    width: width*0.065,
                    height: height*0.03,
                    child: Image.asset(
                      'assets/images/comment.png',
                      fit: BoxFit.fill,
                    ),
                  ),
                  SizedBox(width: width*0.03,),
                  myTextFieldWidget(
                    context,
                    'Write your comment',
                    0.6,
                    0.03,
                    false,
                    TextInputType.text
                  ),
                  SizedBox(width: width*0.015,),
                  widget.bookmark==false?
                  const Icon(Icons.bookmark_border,size: 30,):
                  const Icon(Icons.bookmark,size: 30,),
                ],
              ),
            ),
            SizedBox(height: width*0.014,),
            Padding(
              padding: const EdgeInsets.only(left: 10.0,right: 10,),
              child: Row(
                children: [
                  Text('${widget.likes}',style: const TextStyle(color: Colors.black,fontSize: 12,fontWeight: FontWeight.bold),),
                  SizedBox(width: width*0.01,),
                  const Text('Likes',style: TextStyle(color: Colors.black,fontSize: 12,fontWeight: FontWeight.bold),),

                  SizedBox(width: width*0.03,),
                  Text('${widget.comment}',style: const TextStyle(color: Colors.black,fontSize: 12,fontWeight: FontWeight.bold),),
                  SizedBox(width: width*0.01,),

                  const Text('Comments',style: TextStyle(color: Colors.black,fontSize: 12,fontWeight: FontWeight.bold),),

                ],
              ),
            ),
            SizedBox(height: width*0.014,),
            Padding(
              padding: const EdgeInsets.only(left: 10.0,),
              child: Text(widget.time,style: TextStyle(color: Colors.black54,fontSize: 12,),),
            ),

          ],
        )

      )
      )
    );
  }
  void choiceAction(String choice){
    if(choice == Constants.Not_Interested){
      print('Not Interested');
    }else if(choice == Constants.Report){
      print('Report');
    }else if(choice == Constants.Save){
      print('Save');
    }
  }
}
class Constants{
  static const String Not_Interested = 'Not Interested';
  static const String Report = 'Report';
  static const String Save = 'Save';

  static const List<String> choices = <String>[
    Not_Interested,
    Report,
    Save
  ];
}