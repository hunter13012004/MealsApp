import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mealsapp/constants/colorspicker.dart';
import 'package:mealsapp/pages/forgotpwd.dart';
import 'package:mealsapp/pages/homepage.dart';
import 'package:mealsapp/pages/signuppage.dart';
import 'package:mealsapp/utils/custombutton.dart';
import 'package:mealsapp/utils/customdivider.dart';
import 'package:mealsapp/utils/customsignincontainer.dart';
import 'package:mealsapp/utils/customtexfeild.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController emailcontroller = TextEditingController();
  final TextEditingController passwordcontroller = TextEditingController();

  @override
  void dispose() {
    emailcontroller.dispose();
    passwordcontroller.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(      body: Container(
        decoration: BoxDecoration(gradient: LinearGradient(colors: [
              primarycolor.withOpacity(0.4),
              secondarycolor.withOpacity(0.2)
            ], begin: Alignment.topCenter, end: Alignment.bottomCenter)),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                    // welcome text
                    
                    Center(child: Image.asset('assets/images/logo.png',height: 200,)),
                    SizedBox(
        height: 10,
                    ),
                    Text(
        "Welcome Back ",
        style: GoogleFonts.lato(
            textStyle:
                TextStyle(fontSize: 30, fontWeight: FontWeight.bold,color: textcolor)),
                    ),
        
                    //subtitle
                    SizedBox(
        height: 5,
                    ),
                    Text(
        "You Have Been Missed! ",
        style: GoogleFonts.lato(
            textStyle:
                TextStyle(fontSize: 20, fontWeight: FontWeight.normal,color: textcolor)),
                    ),
        
                    //first textfeild(email)
                    SizedBox(
        height: 20,
                    ),
                    Expanded(
        child: SingleChildScrollView(physics: NeverScrollableScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              height: MediaQuery.of(context).size.height,
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
            
                    // fdorgotpassword text?
                    SizedBox(
                      height: 5,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        GestureDetector(
                          onTap: (){
                            Navigator.push(context,MaterialPageRoute(builder: (context)=> ForgotPage()));
                          },
                          child: Text(
                            'Forgot password?',
                            style: TextStyle(color:textcolor),
                          ),
                        ),
                      ],
                    ),
                    //login button
            
                    SizedBox(
                      height: 20,
                    ),
                    custombutton(text: 'Login', onPressed: signuserin),
            //new USer ?
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('New User?',style: TextStyle(color: primarycolor),),
                        GestureDetector(
                          onTap: (){
                            Navigator.push(context, MaterialPageRoute(builder: (context)=>signuserup()));
                          },
                          child: Text(
                            'SignUp',
                            style: TextStyle(color: textcolor),
                          ),
                        ),
                      ],
                    ),
                    //or login with
                    SizedBox(
                      height: 30,
                    ),
                    customdivider(dividertext: 'OR'),
                    //apple and google logo
                    SizedBox(
                      height: 50,
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

  void signuserin() async{
  await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailcontroller.text, password: passwordcontroller.text);
    Navigator.push(
        context, MaterialPageRoute(builder: ((context) => Homepage())));
  }
}
