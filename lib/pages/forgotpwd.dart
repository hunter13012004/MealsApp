import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mealsapp/constants/colorspicker.dart';
import 'package:mealsapp/pages/loginpage.dart';
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
      body: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(colors: [
          primarycolor.withOpacity(0.4),
          secondarycolor.withOpacity(0.2)
        ], begin: Alignment.topCenter, end: Alignment.bottomCenter)),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          // welcome text

          Center(
              child: Image.asset(
            'assets/images/logo.png',
            height: 200,
          )),
          SizedBox(
            height: 10,
          ),

          Text(
            "Forgotton Your Password",
            style: GoogleFonts.lato(
                textStyle: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: textcolor)),
          ),

          //subtitle
          SizedBox(
            height: 10,
          ),
          Text(
            "Lets US Help You Get Back Into Your Account ",
            style: GoogleFonts.lato(
                textStyle: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.normal,
                    color: textcolor)),
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

                        SizedBox(
                          height: 20,
                        ),
                        custombutton(text: 'RESET', onPressed: resetpassword),
                        //new USer ?
                        SizedBox(
                          height: 250,
                        ),

                        customdivider(dividertext: 'OR'),
                        SizedBox(
                          height: 20,
                        ),

                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => LoginPage()));
                          },
                          child: Text("Go Back To Login",
                              style: GoogleFonts.lato(
                                  textStyle: TextStyle(
                                      fontSize: 26,
                                      fontWeight: FontWeight.bold,
                                      color: textcolor))),
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

  void resetpassword() {
    FirebaseAuth.instance.sendPasswordResetEmail(email: emailcontroller.text);
  }
}
