import 'dart:ui';
import 'package:chappers/screens/notifications.dart';
import 'package:chappers/widgets/custom_nav_bar.dart';
import 'package:chappers/widgets/slot_card.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:date_format/date_format.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';
import 'package:flutter/painting.dart';
import '../../../widgets/responsive_widget.dart';
import 'available_slots.dart';

class SetSlots extends StatefulWidget {
  const SetSlots({Key? key}) : super(key: key);
  static const routeName = "/slots";

  @override
  _SetSlots createState() => _SetSlots();
}
class _SetSlots extends State<SetSlots>{
  String _setTime="", _setDate="";

  String _hour="", _minute="", _time="";
  String _hours="";

  String dateTime="";

  DateTime selectedDate = DateTime.now();

  TimeOfDay selectedTime = TimeOfDay(hour: 00, minute: 00);
  int min=0;
  TextEditingController _dateController = TextEditingController();
  TextEditingController _timeController = TextEditingController();
  Future<Null> _selectTime(BuildContext context) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: selectedTime,

    );
    if (picked != null) {
      setState(() {
        selectedTime = picked;
        if(selectedTime.hour<10){
          _hour='0' + selectedTime.hour.toString();
        }
        else{
          _hour = selectedTime.hour.toString();
        }

        if(selectedTime.minute<10){
          _minute='0' + selectedTime.minute.toString();
        }
        else{
          _minute = selectedTime.minute.toString();
        }
        _time = _hour + ' : ' + _minute;
        _timeController.text = _time;
        print(_timeController.text);
        FirebaseFirestore.instance
            .collection('slots').doc()
            .set({
          'time': _timeController.text,
        });
      });
    }
  }
String date1="";
  String _selectedDate = '';
  void _onSelectionChanged(DateRangePickerSelectionChangedArgs args) {
    setState(() {
     if (args.value is DateTime) {
      date1= args.value.toString();

         _selectedDate = date1.substring(0,10);

      }
    });
  }
  String _typeSelected="";
  bool isSelected=false;
  List<String> types=[];
  Widget _buildConstructorType(String title ,int index) {
    return InkWell(
      child: Container(
        height: 40,
        width: 90,
        decoration: BoxDecoration(
          // ignore: unrelated_type_equality_checks
          // gradient: const LinearGradient(
          //     begin: Alignment.topRight,
          //     end: Alignment.bottomLeft,
          //     colors: [
          //       Colors.grey,
          //       Colors.white,
          //
          //     ]),
          color: isSelected && (types.contains(title)) ? Colors.blue : const Color(0xFFE6E6FA),
          borderRadius: BorderRadius.only(
          topLeft: Radius.circular(10),
          topRight: Radius.circular(10),
          bottomLeft: Radius.circular(10),
          bottomRight: Radius.circular(10)
          ),
        ),
        child: Center(
          child: Text(
            title,
            style: TextStyle(fontSize: 14, color: Colors.black),
          ),
        ),
      ),

      onTap: () {
        setState(() {
          if(types.contains(title)){
            _typeSelected ="";

            types.remove(title);
          }
          else{
            isSelected=true;
            types.add(title);}
        });
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return
         Scaffold(
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
                   padding: EdgeInsets.only(left: 35.0),
                   child: Center(
                     child: Text(
                       'Set Availability',
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
               bottom: height*0.001,
             top: height*0.001,
             child: Container(
               width: MediaQuery.of(context).size.width,
               height: MediaQuery.of(context).size.height*0.75,
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
               child: Center(

                            child:SingleChildScrollView(
                              child: Column(
                                children: <Widget>[
                                  SizedBox(
                                    height: height*0.06,
                                    width: width,
                                    child: const Center(child: Text('Set Available Date',style: TextStyle(fontSize: 25,color: Colors.black26,fontWeight: FontWeight.bold)))
                                  ),
                                  Divider(
                                    color: Colors.grey.shade600,
                                  ),
                                  SizedBox(
                                    height: height*0.42,
                                    width: width,
                                    child: SfDateRangePicker(
                                      onSelectionChanged: _onSelectionChanged,
                                      selectionMode: DateRangePickerSelectionMode.single,
                                      initialSelectedDate: DateTime.now(),
                                    ),
                                  ),
                                  SizedBox(
                                      height: height*0.05,
                                      width: width,
                                      child: const Center(child: Text('Select Slots',style: TextStyle(fontSize: 25,color: Colors.black26,fontWeight: FontWeight.bold)))
                                  ),
                                  Divider(
                                    color: Colors.grey.shade600,
                                  ),
                                  Row(
                                    children: [
                                      SizedBox(
                                        height: height*0.1,
                                        width: width*0.75,

                                        child: StreamBuilder<QuerySnapshot>(
                                          stream: FirebaseFirestore.instance
                                              .collection("slots")
                                              .snapshots(),
                                          builder: (context, snapshot) {
                                            return !snapshot.hasData
                                                ? Center(child: CircularProgressIndicator())
                                                : Container(
                                              height: height*0.2,
                                              //padding: EdgeInsets.only(right: width*0.25),
                                              child: ListView.builder(


                                                scrollDirection: Axis.horizontal,
                                                shrinkWrap: true,
                                                itemCount: snapshot.data?.docs.length,
                                                itemBuilder: (context, index) {
                                                  DocumentSnapshot data =
                                                  snapshot.data!.docs[index];
                                                  return GestureDetector(
                                                    onTap: () {


                                                    },
                                                    onLongPress: () {
                                                      // deleteData( snapshot.data.docs[index].id);
                                                      //Fluttertoast.showToast(msg: "Deleted");
                                                    },
                                                    child: Row(
                                                      //mainAxisAlignment: MainAxisAlignment.start,
                                                        crossAxisAlignment: CrossAxisAlignment.start,
                                                        children:[
                                                          _buildConstructorType(data['time'],index),
                                                          SizedBox(width: 10,)
                                                        ]
                                                    ),
                                                  );
                                                },

                                              ),

                                            );

                                          },
                                        ),
                                      ),
                                      Container(
                                        height: height*0.1,
                                        width: width*0.2,
                                        padding: EdgeInsets.only(right: width*0.02,bottom: width*0.025,left: width*0.03),
                                        child: FloatingActionButton(
                                          //elevation: 500.0,
                                          backgroundColor: Colors.red,
                                          child: Icon(Icons.add,color: Colors.white,),
                                          onPressed: (){
                                            _selectTime(context);
                                            Container(

                                              alignment: Alignment.center,
                                              decoration: BoxDecoration(color: Colors.grey[200]),
                                              child: TextFormField(
                                                style: TextStyle(fontSize: 40),
                                                textAlign: TextAlign.center,
                                                onSaved: (String? val) {
                                                  _setTime = val!;
                                                },
                                                enabled: false,
                                                keyboardType: TextInputType.text,
                                                controller: _timeController,
                                                decoration: InputDecoration(
                                                    disabledBorder:
                                                    UnderlineInputBorder(borderSide: BorderSide.none),
                                                    // labelText: 'Time',
                                                    contentPadding: EdgeInsets.all(5)),
                                              ),
                                            );
                                            // );
                                          },

                                        ),
                                      ),
                                    ],
                                  ),
                                  Divider(
                                    color: Colors.grey.shade600,
                                  ),
                              SizedBox(

                                height: height * 0.002,
                              ),
                                  SizedBox(
                                    width: width * 0.65,
                                    height: height * 0.06,
                                    child: RaisedButton(
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(40),
                                      ),
                                      color: Colors.red,
                                      onPressed: () {
                                       Navigator.push(context, MaterialPageRoute(builder: (context)=>SlotsScreen()));
                                        try{
                                          String ty="";
                                                                                if(types.isNotEmpty){
                                              int leng=types.length;
                                              int i=0;
                                              // ignore: unnecessary_statements
                                              for(i;i<leng;i++){
                                                ty=ty+types[i]+" | ";
                                                print('For:  '+ty);
                                              }
                                              print('For Loop:'+ty);
                                            // ignore: unnecessary_statements
                                            // for(i;i<leng;i++){
                                            //   ty=ty+types[i]+" | ";
                                            // }
                                          }
                                          print('List'+ty);
                                          print(_selectedDate);
                                          FirebaseFirestore.instance
                                              .collection('Available Slots')
                                              .doc()
                                              .set({
                                            'slots': ty,
                                            'date':_selectedDate,
                                              });
                                        }catch(e){
                                          Get.back();
                                          Get.snackbar(
                                            'Error Occurred',
                                            'Something went wrong. Try again',
                                            colorText: Colors.black,
                                          );
                                        }
                                      },
                                      child: const Text(
                                        'Save',
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white,
                                          fontSize: 20,

                                        ),
                                        maxLines: 1,
                                      ),

                                    ),
                                  ),
                                  SizedBox(

                                    height: height * 0.3,
                                  ),
                                ],
                              ),
                            ),
                          ),

                        ),

                      ),
               const Positioned(
                 bottom: 0.0,
                 child: CustomNavBar(),),
             ]
           ),
         );
  }
}
