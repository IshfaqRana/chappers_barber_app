import 'package:chappers/screens/booking.dart';
import 'package:chappers/screens/home_page.dart';
import 'package:chappers/screens/user_location.dart';
import 'package:chappers/widgets/custom_nav_bar.dart';
import 'package:chappers/widgets/custom_text_input.dart';
import 'package:chappers/widgets/home_card.dart';
import 'package:chappers/widgets/nav_bar.dart';
import 'package:chappers/widgets/product.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import '../../../widgets/responsive_widget.dart';
import 'notifications.dart';

class UserScreen extends StatefulWidget {
  static const routeName = "/user";

  const UserScreen({Key? key}) : super(key: key);


  @override
  _UserState createState() => _UserState();
}
class _UserState extends State<UserScreen> with SingleTickerProviderStateMixin{


 // final barber = await FirebaseFirestore.instance.collection('barbers').doc(FirebaseAuth.instance.currentUser!.uid).get();

  void asyncInitState() async {

  }

  String name="";
  String barberImage="";
@override
  void initState(){
    super.initState();
    setState(() async{

      var barber= await FirebaseFirestore.instance.collection('barbers').doc(
          FirebaseAuth.instance.currentUser!.uid).get();

      barberImage=barber.data()!['image'].toString();
      name=barber.data()!['first_name'].toString();

    });
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
                  top: height * .11,
                  child: SizedBox(
                    width: width,
                    height: height * 0.7,
                    child: StreamBuilder<QuerySnapshot>(
                      stream: FirebaseFirestore.instance
                      .collection("Posts")

                       .where('barberID',isEqualTo: FirebaseAuth.instance.currentUser!.uid)

                       .snapshots(),

                     builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                       return !snapshot.hasData
                      ? const Center(child: CircularProgressIndicator())
                           :  SizedBox(
                        child: ListView.builder(
                        shrinkWrap: true,
                         itemCount: snapshot.data!.docs.length,
                        itemBuilder: (context, index) {
                          DocumentSnapshot data = snapshot.data!.docs[index];
                          return GestureDetector(
                            onTap: () {},

                          child: SizedBox(
                            height: MediaQuery.of(context).size.height*0.63,

                            child: HomeCard(
                            documentSnapshot: data,
                            name: name,
                            likes: 2/*data['total_likes']*/,
                            comment: 4/*data['total_comments']*/,
                            image: data['post_image'],
                            city: data['address'],
                            about: data['description'],
                            time:data['timestamp'], bookmark: false, like: false,
                              barberImage: barberImage,
                        ),
                          ),
                          );
                          },
                        ),
                        );

                        },

                        ),
                        //       const HomeCard(name: 'Amir', about: 'hair cutting...', time: '10 Minutes ago',
                      //         likes: '2K', comment: '2', like: true, follow: false, city: 'Lahore', bookmark: true,));
                      //

                  )
                ),

                // Positioned(
                //     top: height*0.09,
                //     right: width*0.33,
                //     child: SizedBox(
                //       width: width*0.35,
                //       height: height*0.06,
                //       child: const Text('Mobi Style',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20,
                //           color: Colors.white,            fontFamily: 'MetroPolis'
                //       ),
                //       maxLines: 1,
                //       )
                //     )
                // ),

                Positioned(
                    top: height*0.035,
                    right: 30,
                   child: SizedBox(
                     width: width*0.11,
                     height: height*0.05,
                     child: const Icon(
                       Icons.settings,
                       size: 40,
                       color: Colors.white,
                     ),
                   )
                ),
                Positioned(
                    top: height*0.035,
                    right: 90,
                    child: InkWell(
                      onTap: (){
                        Navigator.push(context, 
                        MaterialPageRoute(builder: (context)=>const UserLocationScreen()));
                      },
                      child: const SizedBox(


                          child: Icon(Icons.location_on_sharp,size: 40,color: Colors.white,)

                      ),
                    )
                ),
                Positioned(
                    top: height*0.035,
                    left: 30,
                    child: InkWell(
                      onTap: (){
                        Navigator.push(context,
                          MaterialPageRoute(builder: (context)=> const NotificationScreen()),);
                      },
                      child: Container(


                          child: const Icon(Icons.notifications_active_outlined,size: 45,color: Colors.white,)

                      ),
                    )
                ),
                Positioned(
                    top: height*0.035,
                    left: 80,
                    child: Container(
                        child: const Icon(Icons.search,size: 45,color: Colors.white,)
                    )
                ),
                // Positioned(
                //     bottom: 0,
                //     left: 0,
                //     child: CustomNavBar(
                //       home: true,
                //     )),

              ]
          ),
          bottomNavigationBar: NavBar(home: true,),
        )
    );
  }


}
