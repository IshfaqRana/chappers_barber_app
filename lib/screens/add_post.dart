import 'dart:io';
import 'package:path/path.dart' as Path;
import 'package:chappers/screens/stylist_profiles.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:country_state_city_picker/country_state_city_picker.dart';

class AddPost extends StatefulWidget{
  final String id;

  const AddPost({Key? key,required this.id}) : super(key: key);


  @override
  _APState createState() => _APState();
}
class _APState extends State<AddPost>{
  TextEditingController desController = TextEditingController();
  File? _pickedImage;
  final picker = ImagePicker();

  dynamic _pickImageError;
  bool imag=false;
  void _pickImageCamera() async {
    try {
      final pickedImage = await picker.pickImage(source: ImageSource.camera);
      final pickedImageFile = File(pickedImage!.path);
      setState(() {
        _pickedImage = pickedImageFile;
        imag=true;
      });
    }catch (e) {
      setState(() {
        _pickImageError = e;
      });
    }
  }

  void _pickImageGallery() async {
    try {
      final pickedImage = await picker.pickImage(source: ImageSource.gallery);
      final pickedImageFile = File(pickedImage!.path);
      setState(() {
        _pickedImage = pickedImageFile;
        imag=true;
      });
    }
    catch (e) {
      setState(() {
        _pickImageError = e;
      });
    }
  }
  String? _retrieveDataError;
  Future<void> retrieveLostData() async {
    final LostDataResponse response = await picker.retrieveLostData();
    if (response.isEmpty) {
      return;
    }
    if (response.file != null) {
      setState(() {
        _pickedImage = response.file as File?;

      });

    } else {
      _retrieveDataError = response.exception!.code;
    }
  }

  void _showPicker(context) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext bc) {
          return SafeArea(
            child: Wrap(
              children: <Widget>[
                ListTile(
                    leading: const Icon(Icons.photo_library),
                    title: const Text('Gallery'),
                    onTap: () {
                      _pickImageGallery();
                      Navigator.of(context).pop();
                    }),
                ListTile(
                  leading: const Icon(Icons.photo_camera),
                  title: const Text('Camera'),
                  onTap: () {
                    _pickImageCamera();
                    Navigator.of(context).pop();
                  },
                ),
              ],
            ),
          );
        });
  }
  String countryValue="";
  String stateValue="";
  String cityValue="";
  @override
  Widget build(BuildContext context) {
    final double _w = MediaQuery.of(context).size.width;

    return Scaffold(
        appBar: AppBar(
          title: const Text("Add Post"),
          backgroundColor: Colors.red,
        ),
        body: SingleChildScrollView(
            child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: Column(
                        children: [
                          SelectState(
                            onCountryChanged: (value) {
                              setState(() {
                                countryValue = value;
                              });
                            },
                            onStateChanged:(value) {
                              setState(() {
                                stateValue = value;
                              });
                            },
                            onCityChanged:(value) {
                              setState(() {
                                cityValue = value;
                              });
                            },

                          ),
                    imag==false?
                          SizedBox(
                              width: _w,
                              height: MediaQuery.of(context).size.height*0.4,
                              child:  Center(
                                child: FloatingActionButton.extended(
                                    onPressed: (){
                                      _showPicker(context);
                                    },
                                    label: const Text('Add Photos',
                                    style:TextStyle(color: Colors.white,
                                    fontFamily: 'MetroPolis',
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold
                                    ),

                                    ),
                                  backgroundColor: Colors.red,
                                  icon: const Icon(Icons.add,size: 20,),

                                ),
                              )

                          )
                        :
                          SizedBox(
                            width: _w,
                            height: MediaQuery.of(context).size.height*0.4,
                            child: _pickedImage != null ? Image.file(_pickedImage!,fit: BoxFit.fill,) : Container()
                            //FileImage(_pickedImage!),
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                          TextField(

                              maxLines: 2,
                              controller: desController,

                              decoration:const InputDecoration(
                                labelText: "Description",
                                border: InputBorder.none,
                              )
                          ),

                          SizedBox(
                            height: 20,
                          ),
                          Column(
                              children: [
                                Container(


                                  alignment: Alignment.bottomCenter,

                                  child: FlatButton(
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    minWidth: _w * 0.9,
                                    height: 45,
                                    color: const Color(0xFFCD3424),
                                    child: const Text("Save", style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18,
                                      color: Colors.white,
                                    ),),
                                    onPressed: () async {
                                      // Reference ref = FirebaseStorage.instance.ref().child(
                                      //     "image" +
                                      //         DateTime.now().toString());//generate a unique name
                                      // await ref
                                      //     .putFile(File(_pickedImage!.path)); //you need to add path here
                                      // String post = await ref.getDownloadURL();
                                      final User? user = FirebaseAuth.instance.currentUser;
                                      final String uid = user!.uid.toString();


                                      var variable = await FirebaseFirestore.instance
                                          .collection("barbers")
                                          .doc(uid)
                                          .get();
                                      String barber = variable.data()!['image'].toString();
                                      String name = variable.data()!['first_name'].toString();
                                      String _uploadedFileURL="";
                                      int now = DateTime.now().millisecondsSinceEpoch;
                                      Reference storageReference = FirebaseStorage.instance
                                          .ref()
                                          .child('posts/$uid.png');
                                      UploadTask uploadTask = storageReference.putFile(File(_pickedImage!.path));
                                      final TaskSnapshot url=(await uploadTask.whenComplete(() => print('Uploaded')));
                                      final String postImage=await url.ref.getDownloadURL();
                                     // await uploadTask.whenComplete(() => print('File Uploaded'));
                                      //print('File Uploaded');
                                      // storageReference.getDownloadURL().then((fileURL) {
                                      //   setState(() {
                                      //     _uploadedFileURL = fileURL;
                                      //   });
                                      // });
                                      DocumentReference documentReference = await FirebaseFirestore.instance.collection('Posts').doc();
                                      // await FirebaseFirestore.instance
                                      //     .collection("Posts").doc()
                                         await documentReference.set({
                                           'timestamp':now,
                                        'description': desController.text,
                                        'media_url':postImage,
                                        'address':cityValue,
                                        'barberID':FirebaseAuth.instance.currentUser!.uid,
                                        'postID':documentReference.id,
                                        'isImage':true,

                                      }).then((value) => print("Success"));
                                      print('Confirmed');
                                      Navigator.of(context).pop();
                                      Navigator.push(context,
                                      MaterialPageRoute(builder: (context)=>const StylistProfilesScreen())
                                      );
                                      // Navigator.of(context).pop();
                                      //  addOrder(context, selectedDoc, name, price, time, user.uid, sUid,imageUrl,uName,uLocation,uPrice);
                                    },
                                  ),
                                ),
                              ]
                          )
                        ]

                    )
                )
            )

    );
  }

}