import 'package:flutter/material.dart';
import 'package:sensor/profile_page.dart';
import 'package:sensor/sensor_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,

          children: [
            ElevatedButton(onPressed: (){
              Navigator.of(context).push(MaterialPageRoute(builder: (context)=>FingerprintAuthScreen()));
            },
                child: Text("Sensor Page")),
            SizedBox(height: 10.0,),
            ElevatedButton(onPressed: (){
              Navigator.of(context).push(MaterialPageRoute(builder: (context)=>ProfilePage()));
            },
                child: Text("Profile Page")),
          ],
        ),
      )),
    );
  }
}
