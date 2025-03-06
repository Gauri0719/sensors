import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  ImagePicker _picker = ImagePicker();
  File? _ImageFile;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Profile",style:TextStyle(
          fontSize: 20,fontWeight: FontWeight.bold),),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SafeArea(child: Column(
          children: [
            Stack(
              children: [
                Container(
                width: 150,
                height: 150,
                decoration: BoxDecoration(
                    color: Colors.grey.shade300,
                    shape: BoxShape.circle,
                image:
                _ImageFile!=null
                    ? (DecorationImage(image:FileImage(_ImageFile!),fit: BoxFit.cover))
                    : null,
                ),
                child: _ImageFile == null
                    ? Icon(
                  Icons.person_2,
                  size: 80.0,
                  color: Colors.grey.shade500,)
                    : null,
              ),
                Positioned(
                  bottom: 0.0,
                  right: 0.0,
                  child: InkWell(
                    onTap: _showSourceDialog,
                    child: CircleAvatar(
                      radius: 25.0,
                      child: Icon(Icons.camera_alt_rounded,color: Colors.white,),
                      backgroundColor: Colors.blue,
                    ),
                  ),
                )
              ]
            ),

          SizedBox(height: 30.0,),
          TextField(
            decoration: InputDecoration(
              labelText:"Name",
              border: OutlineInputBorder(

              )
            ),
          ),
            SizedBox(height: 20.0,),
            TextField(
              decoration: InputDecoration(
                  labelText:"Email",
                  border: OutlineInputBorder(

                  )
              ),
            ),
            SizedBox(height: 20.0,),
            TextField(
              decoration: InputDecoration(
                  labelText:"Address",
                  border: OutlineInputBorder(

                  )
              ),
            ),
            Spacer(),
            ElevatedButton(onPressed: (){}, child: Text("Submit"))
          ],
        )),
      ),
    );
  }
 Future<void> pickImage(ImageSource imageSource) async {
    try{
     final XFile? pickedFile= await _picker.pickImage(
         source: imageSource,
     imageQuality: 80);
     if(pickedFile!=null){
       setState(() {
         _ImageFile = File(pickedFile.path);
       });

     }
    }catch(ex){

    }
 }
  Future _showSourceDialog() {
     return showDialog(context: context, builder: (BuildContext context){
       return AlertDialog(
         title: Text("Select Image Source"),
         content: SingleChildScrollView(
           child: ListBody(
             children: [
               InkWell(
                 onTap: (){
                   Navigator.pop(context);
                   pickImage(ImageSource.camera);
                 },
                 child: Padding(
                   padding: const EdgeInsets.all(8.0),
                   child: Row(
                     children: [
                       Icon(Icons.camera_alt),
                       SizedBox(width: 10.0,),
                       Text("Camera")
                     ],
                   ),
                 ),
               ),
               InkWell(
                 onTap: (){
                   Navigator.pop(context);
                   pickImage(ImageSource.gallery);
                 },
                 child: Padding(
                   padding: const EdgeInsets.all(8.0),
                   child: Row(
                     children: [
                       Icon(Icons.photo_library),
                       SizedBox(width: 10.0,),
                       Text("Gallery")
                     ],
                   ),
                 ),
               ),
               InkWell(
                 onTap: (){
                  Navigator.pop(context);
                  deleteProfile();
                 },
                 child: Padding(
                   padding: const EdgeInsets.all(8.0),
                   child: Row(
                     children: [
                       Icon(Icons.delete,color: Colors.red,),
                       SizedBox(width: 10.0,),
                       Text("Delete Profile")
                     ],
                   ),
                 ),
               )
             ],
           ),
         ),
       );
     });
  }
  void deleteProfile() {
    setState(() {

      _ImageFile=null;
    });
  }
}
