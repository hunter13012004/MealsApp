import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
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

  final _forgotFormKey =GlobalKey<FormState>();
  final TextEditingController emailcontroller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: _forgotFormKey,
        child: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(colors: [
            primarycolor.withOpacity(0.4),
            secondarycolor.withOpacity(0.2)
          ], begin: Alignment.topCenter, end: Alignment.bottomCenter)),
          child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            // welcome text
        
            Center(
                child: Image.asset(
              'assets/images/logo.png',color: primarycolor,
              height: 200,
            )),
            const SizedBox(
              height: 10,
            ),
        
            Text(
              "Forgotton Your Password",
              style: GoogleFonts.lato(
                  textStyle: const TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: textcolor)),
            ),
        
            //subtitle
            const SizedBox(
              height: 10,
            ),
            Text(
              "Lets US Help You Get Back Into Your Account ",
              style: GoogleFonts.lato(
                  textStyle: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.normal,
                      color: textcolor)),
            ),
        
            //first textfeild(email)
            const SizedBox(
              height: 20,
            ),
            Expanded(
              child: SingleChildScrollView(
                physics: const NeverScrollableScrollPhysics(),
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
                          const SizedBox(
                            height: 20,
                          ),
                          customTextfeild(
                            onSaved: (value) {
                              emailcontroller.text =value.toString();
                              
                            },
                            validator: (value) {
                              if(value.toString().isEmpty || value == null){
                                return 'Email should not be empty'; 
                              
                              }else if(
                                !value.toString().contains('@')){
                                return 'Enter a valid email';

                              }
                              else{
                                return null;
                              }
                              
                              
                            },
                            key: ValueKey(emailcontroller),
                            hinttext: 'Enter Your Email ',
                            controller: emailcontroller,
                            obscuretext: false,
                          ),
                          //second textfeild(password)
                          const SizedBox(
                            height: 10,
                          ),
        
                          const SizedBox(
                            height: 20,
                          ),
                          custombutton(text: 'RESET', onPressed: trysubmit),
                          //new USer ?
                          const SizedBox(
                            height: 250,
                          ),
        
                          const customdivider(dividertext: 'OR'),
                          const SizedBox(
                            height: 20,
                          ),
        
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => const LoginPage()));
                            },
                            child: Text("Go Back To Login",
                                style: GoogleFonts.lato(
                                    textStyle: const TextStyle(
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
      ),
    );
  }

  trysubmit(){
    final isvalid =  _forgotFormKey.currentState!.validate();
    if(isvalid){
      resetpassword();
    }else{
      print('Something went Wrong');
    }
  }

  void resetpassword() {
    FirebaseAuth.instance.sendPasswordResetEmail(email: emailcontroller.text);
  }
}
