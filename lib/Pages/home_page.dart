import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final user = FirebaseAuth.instance.currentUser!;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          //Image 
             Image.asset('images/heart.png'
             ,height: 300,
             ),    
                   //Put a space between the image and the text
                   SizedBox(height: 1),
          Text(
            'Hello You Are Singed',
            style: TextStyle(fontSize: 22),
          ),
          SizedBox(height: 5),
          Text(
            user.email!,
            style: TextStyle(fontSize: 22),
          ),
          SizedBox(height: 10),
          MaterialButton(onPressed: (){
            FirebaseAuth.instance.signOut();
          },
          color: Color.fromARGB(255, 97, 116, 239),
          child: Text('Sing Out'),
          ),
        ],
      ),
      ),
    );
  }
}