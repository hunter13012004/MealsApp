import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mealsapp/constants/colorspicker.dart';
import 'package:mealsapp/utils/customdivider.dart';
import 'package:mealsapp/utils/customtexfeild.dart';

import '../utils/custombutton.dart';

class ForgotPage extends StatefulWidget {
  const ForgotPage({super.key});

  @override
  State<ForgotPage> createState() => _ForgotPageState();
}

class _ForgotPageState extends State<ForgotPage> {
  final TextEditingController emailcontroller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundcolor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            // welcome text
            SizedBox(
              height: 100,
            ),
            Text(
              "Forgotton Your Password",
              style: GoogleFonts.lato(
                  textStyle:
                      TextStyle(fontSize: 30, fontWeight: FontWeight.bold,color: textcolor)),
            ),

            //subtitle
            SizedBox(
              height: 10,
            ),
            Text(
              "Lets US Help You Get Back Into Your Account ",
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
            
                       
    
                        SizedBox(
                          height: 20,
                        ),
                        custombutton(text: 'RESET', onPressed: resetpassword),
                //new USer ?
                        SizedBox(
                          height: 330,
                        ),

                        customdivider(dividertext: 'OR'),
                        SizedBox(height: 20,),

                        Text("Go Back To Login", style: GoogleFonts.lato(
                  textStyle:
                      TextStyle(fontSize: 26, fontWeight: FontWeight.bold,color: textcolor)))
                      
                       
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ]),
        ),
      ),
    );
  }
  void resetpassword(){
   FirebaseAuth.instance.sendPasswordResetEmail(email: emailcontroller.text);
  }
}