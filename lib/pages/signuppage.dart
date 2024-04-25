import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mealsapp/constants/colorspicker.dart';
import 'package:mealsapp/pages/homepage.dart';
import 'package:mealsapp/utils/custombutton.dart';
import 'package:mealsapp/utils/customdivider.dart';
import 'package:mealsapp/utils/customsignincontainer.dart';
import 'package:mealsapp/utils/customtexfeild.dart';

class signuserup extends StatefulWidget {
  const signuserup({super.key});

  @override
  State<signuserup> createState() => _signuserupState();
}

class _signuserupState extends State<signuserup> {
  final TextEditingController emailcontroller = TextEditingController();
  final TextEditingController passwordcontroller = TextEditingController();
  final TextEditingController confirmpasswordcontroller = TextEditingController();

  @override
  void dispose() {
    emailcontroller.dispose();
    passwordcontroller.dispose();
    confirmpasswordcontroller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(decoration: BoxDecoration(gradient: LinearGradient(colors: [
      primarycolor.withOpacity(0.4),
      secondarycolor.withOpacity(0.2)
                  ], begin: Alignment.topCenter, end: Alignment.bottomCenter)),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                    // welcome text
                    SizedBox(
        height: 5,
                    ),
                    Center(child: Image.asset('assets/images/logo.png',height: 200,)),
            SizedBox(
              height: 10,
            ),
           
                    Text(
        "New Here ",
        style: GoogleFonts.lato(
            textStyle:
                TextStyle(fontSize: 30, fontWeight: FontWeight.bold,color: textcolor)),
                    ),
        
                    //subtitle
                    SizedBox(
        height: 5,
                    ),
                    Text(
        "Lets Get You Signed Up ",
        style: GoogleFonts.lato(
            textStyle:
                TextStyle(fontSize: 20, fontWeight: FontWeight.normal,color: textcolor)),
                    ),
        
                    //first textfeild(email)
                    SizedBox(
        height: 20,
                    ),
                    Expanded(
        child: SingleChildScrollView(
          physics: NeverScrollableScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              height: 5000,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: secondarycolor,
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    SizedBox(
                      height: 20,
                    ),
                    customTextfeild(
                      hinttext: 'Enter Your Email ',
                      controller: emailcontroller,
                      obscuretext: false,
                    ),
                    //second textfeild(password)
                    SizedBox(
                      height: 10,
                    ),
                    customTextfeild(
                        hinttext: 'Password', controller: passwordcontroller,obscuretext: true,),
                        SizedBox(
                      height: 10,
                    ),
                      customTextfeild(hinttext: 'Confirm Password', controller: confirmpasswordcontroller,obscuretext: true,)
            
                    //login button
            ,
                    SizedBox(
                      height: 20,
                    ),
                    custombutton(text: 'SignUp', onPressed: signup),
            //new USer ?
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('Already a user ?',style: TextStyle(color: primarycolor),),
                        GestureDetector(
                          onTap: (){Navigator.pop(context);},
                          child: Text(
                            'SignIn',
                            style: TextStyle(color: textcolor),
                          ),
                        ),
                      ],
                    ),
                    //or login with
                    SizedBox(
                      height: 20,
                    ),
                    customdivider(dividertext: 'OR'),
                    //apple and google logo
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        customcontainer(
                          imagepath: 'assets/images/google.png',
                        ),
                        customcontainer(
                            imagepath: 'assets/images/facebook.png')
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
                    ),
                  ]),
      ),
    );
  }
  void signup()async{
   await FirebaseAuth.instance.createUserWithEmailAndPassword(email: emailcontroller.text,
         password: passwordcontroller.text);
         Navigator.push(context,MaterialPageRoute(builder: (context)=> Homepage()));
  }
   
  }

