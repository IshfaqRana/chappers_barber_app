import 'package:chappers/widgets/custom_nav_bar.dart';
import 'package:chappers/widgets/custom_text_input.dart';
import 'package:chappers/widgets/text_fiels.dart';
import 'package:flutter/material.dart';

import 'notifications.dart';


class ChatPage extends StatefulWidget {
  // const AvailableSlotsPage({ Key? key }) : super(key: key);
  @override
  _ChatPageState createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  double myTextFieldWidth = 0.75;
  double myTextFieldHeight = 0.15;

  Widget _chatWidget(String messageText, String timeText) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.45,
      height: MediaQuery.of(context).size.height * 0.07,
      decoration: BoxDecoration(
        color: Colors.blue[50],
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 2,
            offset: Offset(0, 2), //changes position of shadow
          ),
        ],
        borderRadius: BorderRadius.circular(60),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [Text('$messageText')],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [Text('$timeText')],
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    double width= MediaQuery.of(context).size.width;
    double height= MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.red,
      appBar: AppBar(
        elevation: 0,
        automaticallyImplyLeading: false,
        centerTitle: true,
        backgroundColor: Colors.red,
        toolbarHeight: 70,
        title: Row(
mainAxisAlignment: MainAxisAlignment.start,
          children: [
            InkWell(
              onTap: (){
                Navigator.pop(context);
              },
              child: Icon(
                Icons.arrow_back_ios_sharp,
                size: 40,
              ),
            ),
            InkWell(
              onTap: (){
                Navigator.push(context,
                  MaterialPageRoute(builder: (context)=> const NotificationScreen()),);
              },
              child: Icon(
                Icons.notifications_active_outlined,
                size: 40,
              ),
            ),

            Padding(
              padding: const EdgeInsets.only(left: 60.0),
              child: Center(
                child: Text(
                  'Chat',
                ),
              ),
            ),
          ],
        ),
        actions: <Widget>[
          Padding(
            padding: EdgeInsets.only(right: 40.0),
            child: Icon(
              Icons.settings,
              size: 40,
            ),
          ),
        ],
      ),
      body: Stack(
        children: [
          Positioned(
            top: height*0.001,
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height*0.85,
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: Offset(0, 6), //changes position of shadow
                  ),
                ],
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(25),
                  topRight: Radius.circular(25),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.only(top: 20),
                child: SingleChildScrollView(
                  child: Column(
                    children: <Widget>[
                      ListTile(
                        leading: CircleAvatar(
                          radius: 30,
                          backgroundImage: AssetImage('assets/images/asset1.png'),
                        ),
                        title: Text(
                          'Stylist Name',
                          style: TextStyle(fontSize: 18),
                        ),
                      ),
                      // uper Container for showing chat messages
                      Container(
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height * 0.6,
                        color: Colors.white,
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(bottom: 20),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    '___',
                                    style:
                                    TextStyle(fontSize: 30, color: Colors.grey),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: 35, right: 35, top: 20),
                                    child: Text(
                                      'Today',
                                      style:
                                      TextStyle(fontSize: 20, color: Colors.grey),
                                    ),
                                  ),
                                  Text(
                                    '___',
                                    style:
                                    TextStyle(fontSize: 30, color: Colors.grey),
                                  ),
                                ],
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                _chatWidget('Hi! About that Party... ', '11:03'),
                              ],
                            ),
                            SizedBox(height: 25),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                _chatWidget('what party ? ', '11:14'),
                              ],
                            ),
                            SizedBox(height: 25),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                _chatWidget('Hi! About that Party... ', '11:03'),
                              ],
                            ),
                            SizedBox(height: 25),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                _chatWidget('what party ? ', '11:14'),
                              ],
                            ),
                          ],
                        ),
                      ),
                      //buttom container for write message in text field

                    ],
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            top: height*0.83,
            child: Container(
              padding: const EdgeInsets.only(left: 15),
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * 0.075,
            color: Colors.pink[200],
            child: Row(
              children: [
                myTextFieldWidget(
                  context,
                  'write Your Message',
                  myTextFieldWidth,
                  myTextFieldHeight,
                  false,
                  TextInputType.text

                ),
                SizedBox(
                  width: 5,
                ),

              ],
            ),
          ),
          ),

          Positioned(
            bottom: height*0.018,
            right: 15,
            child: SizedBox(

              width: MediaQuery.of(context).size.width*0.15,
              height: MediaQuery.of(context).size.height *0.055,
              child: Image.asset('assets/images/tele.png',
                fit: BoxFit.fill,
              ),

            ),
          )
        ],
      ),
      //bottomNavigationBar: CustomNavBar(home: true,),
    );
  }
}