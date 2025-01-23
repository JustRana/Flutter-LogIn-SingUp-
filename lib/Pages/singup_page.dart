import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';



class SingUpPage extends StatefulWidget {
  const SingUpPage({super.key});

  @override
  State<SingUpPage> createState() => _SingUpPageState();
}

class _SingUpPageState extends State<SingUpPage> {
  //Check whether the user has an account or not
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmpasswordController = TextEditingController();

  Future singUp()async{
    //Make sure the password matches
    if(passwordConfirmed()){
     await FirebaseAuth.instance.createUserWithEmailAndPassword(
      email: _emailController.text.trim(), password: _passwordController.text.trim());
      Navigator.of(context).pushNamed('/');
    }
  }
  
  bool passwordConfirmed(){
    if(_passwordController.text.trim() == _confirmpasswordController.text.trim()){
       return true;
    }else{
      return false;
    }
  }


  void openSingUpPage(){
    Navigator.of(context).pushReplacementNamed('Login Page');
  }

  @override
  void dispose(){
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _confirmpasswordController.dispose();
  }

  @override
  Widget build(BuildContext context){
    return Scaffold(
      //color background
      backgroundColor: Colors.white,
      //use safe area To move the image away from the edges of the application
      body: SafeArea(
        //use Center to place the column in the middle of the screen
        child : Center(
          //Items are scrollable
         child : SingleChildScrollView(
           child: SingleChildScrollView(
             child: Column(
              //make everything in the center
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                   //Image 
             Image.asset('images/logo.png'
             ,height: 300,
             ),
                    
                    
                   //Put a space between the image and the text
                   SizedBox(height: 1),
                    
                    
                   //Title
             Text(
              'Sing UP',
              //change style for the text
              style: GoogleFonts.robotoCondensed(fontSize: 40 ,fontWeight: FontWeight.bold),
              ),
                    
                    
                   //SubTitle
             Text(
              'Welcome , Here you can sing up',
              //change style for the text
              style: GoogleFonts.robotoCondensed(fontSize: 20),
              ),
                    
                    
             //Put a space between the Subtitle and the Email field
                   SizedBox(height: 40),
                    
                    
                    
                   //Email Field 
                 Padding(
                   padding: const EdgeInsets.symmetric(horizontal: 25),
                   //I used Container to modify Field and set a background and colors for it
                   child: TextField(
                    //When the user enters an email or password, it will be saved here
                  controller: _emailController,
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderSide:BorderSide(color: Color.fromARGB(255, 215, 213, 213)),
                        borderRadius:BorderRadius.circular(12),
                         ),
                         focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Color.fromARGB(255, 99, 98, 98)),
                        borderRadius:BorderRadius.circular(12),
                        ),
                    //To clarify, this box pertains to password
                    hintText: 'Email',
                    fillColor: Color.fromARGB(255, 215, 213, 213),
                    filled: true,
                   ),
                ),
              ),
                    
                    
                 //Put a space between the Email Field and the Password field
                   SizedBox(height: 10),
                    
                   
                 //Pasword Field 
                 Padding(
                   padding: const EdgeInsets.symmetric(horizontal: 25),
                   //I used Container to modify Field and set a background and colors for it
                   child: TextField(
                    //When the user enters an email or password, it will be saved here
                  controller: _passwordController,
                  //to make the password hidden
                  obscureText: true,
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderSide:BorderSide(color: Color.fromARGB(255, 215, 213, 213)),
                        borderRadius:BorderRadius.circular(12),
                         ),
                         focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Color.fromARGB(255, 99, 98, 98)),
                        borderRadius:BorderRadius.circular(12),
                        ),
                    //To clarify, this box pertains to password
                    hintText: 'Password',
                    fillColor: Color.fromARGB(255, 215, 213, 213),
                    filled: true,
                   ),
                ),
              ),
                    
                    
                 //Put a space between the Password field and Sing in button
                   SizedBox(height: 10),


              //Confirm Pasword Field 
                 //Pasword Field 
                 Padding(
                   padding: const EdgeInsets.symmetric(horizontal: 25),
                   //I used Container to modify Field and set a background and colors for it
                   child: TextField(
                    //When the user enters an email or password, it will be saved here
                  controller: _confirmpasswordController,
                  //to make the password hidden
                  obscureText: true,
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderSide:BorderSide(color: Color.fromARGB(255, 215, 213, 213)),
                        borderRadius:BorderRadius.circular(12),
                         ),
                         focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Color.fromARGB(255, 99, 98, 98)),
                        borderRadius:BorderRadius.circular(12),),
                    //To clarify, this box pertains to password
                    hintText: 'Confirm Password',
                    fillColor: Color.fromARGB(255, 215, 213, 213),
                    filled: true,
                   ),
                ),
              ),
                    
                    
                 //Put a space between the Password field and Sing in button
                   SizedBox(height: 15),
                    
                    
                  //sing in button
                 Padding(
                   padding: const EdgeInsets.symmetric(horizontal: 25),
                   child: GestureDetector(
                    onTap: singUp,
                     child: Container(
                                     padding: EdgeInsets.all(16),
                                     decoration: BoxDecoration(
                     color: Color.fromARGB(255, 97, 116, 239),
                     borderRadius: BorderRadius.circular(12)),
                                     child: Center(
                     child: Text(
                                     'SingUp',
                      style: GoogleFonts.robotoCondensed(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 18 ,
                                 ),
                                ),
                     ),
                     ),
                   ),
                 ),
                    
                    
                 //Put a space between the Sing in button and sing up
                   SizedBox(height: 25),
                    
                    
                  // Text : sing up  
                  Row(
                   mainAxisAlignment: MainAxisAlignment.center,
             children: [
               Text('Already a member?',
               style: GoogleFonts.robotoCondensed(
                color: Color.fromARGB(255, 20, 20, 20),
                fontWeight: FontWeight.bold,
               ),),
               GestureDetector(
                 child: GestureDetector(
                  onTap: openSingUpPage,
                   child: Text('LogIn Now',
                   style: GoogleFonts.robotoCondensed(
                    color: Color.fromARGB(255, 52, 167, 56),
                    fontWeight: FontWeight.bold,
                   )),
                 ),
               )
             ],
                  )
                 ]),
           ),
         ),
      ),
      ),
    );
  }
}