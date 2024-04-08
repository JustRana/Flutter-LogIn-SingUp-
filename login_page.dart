
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:login_page/Pages/resetPassword.dart';



class LoginPage extends StatefulWidget{
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage>{
//Check whether the user has an account or not
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  Future singIn()async{
    await FirebaseAuth.instance.signInWithEmailAndPassword(
      email: _emailController.text.trim(), password: _passwordController.text.trim());
  }

  void openSingUpPage(){
    Navigator.of(context).pushReplacementNamed('SingUp Page');
  }

  @override
  void dispose(){
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
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
             Image.asset('images/welcome.png'
             ,height: 300,
             ),
                    
                    
                   //Put a space between the image and the text
                   SizedBox(height: 1),
                    
                    
                   //Title
             Text(
              'LOG IN',
              //change style for the text
              style: GoogleFonts.robotoCondensed(fontSize: 40 ,fontWeight: FontWeight.bold),
              ),
                    
                    
                   //SubTitle
             Text(
              'Welcome Back <3',
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
              SizedBox(height: 10),
                
                GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ResetPasswordPage(),
                  ),
                );
              },
              child: Text(
                'Forget Password?',
                style: TextStyle(
                  color: const Color.fromARGB(255, 106, 107, 107),
                  fontSize: 13,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          
        
      
    
        
                 //Put a space between the Password field and Sing in button
                   SizedBox(height: 15),
                    
                    
                  //sing in button
                 Padding(
                   padding: const EdgeInsets.symmetric(horizontal: 25),
                   child: GestureDetector(
                    onTap: singIn,
                     child: Container(
                                     padding: EdgeInsets.all(16),
                                     decoration: BoxDecoration(
                     color: Color.fromARGB(255, 97, 116, 239),
                     borderRadius: BorderRadius.circular(12)),
                                     child: Center(
                     child: Text(
                                     'LogIn',
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
               Text('Not yet a member?',
               style: GoogleFonts.robotoCondensed(
                color: Color.fromARGB(255, 20, 20, 20),
                fontWeight: FontWeight.bold,
               ),),
               GestureDetector(
                 child: GestureDetector(
                  onTap: openSingUpPage,
                   child: Text('Sing up Now',
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