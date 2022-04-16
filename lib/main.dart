import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';

void main() {
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: Scaffold(appBar: AppBar(title: Text("image adder "),),
      body: AppBody(),),);
  }
}
class AppBody extends StatefulWidget {
  const AppBody({Key? key}) : super(key: key);

  @override
  State<AppBody> createState() => _AppBodyState();
}

class _AppBodyState extends State<AppBody> {
  File? image;
  Future add_image ()async{
    try{
      final image = await ImagePicker().pickImage(source: ImageSource.camera);
      if(image == null)return;
      final imagetemp = File(image.path);
      setState(() => this.image = imagetemp);
    }on PlatformException catch(e){
      print("failed to pick : $e");
    }
  }
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(10,10,0,0),
      child: Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
        RaisedButton(child: Text("add photo"),onPressed: add_image),
        CircleAvatar(radius: 40,backgroundImage: FileImage(File(image!.path)) ),
        RaisedButton(child: Text("go to next page"),onPressed: (){
          Navigator.push(context, MaterialPageRoute(builder: (context)=>secondPage()));
        }),
        Text("syira"),
        Text("ahmad"),
        Text("mohamd"),
        Text("fatmah")
      ],),
    ) ;
  }
}

class secondPage extends StatelessWidget {
  const secondPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Center(child: Text("this second page"),),);
  }
}
