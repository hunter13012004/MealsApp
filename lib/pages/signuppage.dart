import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:mealsapp/constants/colorspicker.dart';
import 'package:mealsapp/functions/databaseFunctions.dart';
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
  final TextEditingController usernamecontroller = TextEditingController();
  final TextEditingController confirmpasswordcontroller = TextEditingController();
   final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();

  final _signupFormKey = GlobalKey<FormState>();

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
      body: Form(
        key: _signupFormKey,
        child: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(colors: [
            primarycolor.withOpacity(0.4),
            secondarycolor.withOpacity(0.2)
          ], begin: Alignment.topCenter, end: Alignment.bottomCenter)),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            // welcome text
            const SizedBox(
              height: 5,
            ),
            Center(
                child: Image.asset(
              'assets/images/logo.png',
              color: primarycolor,
              height: 200,
            )),
            const SizedBox(
              height: 10,
            ),

            Text(
              "New Here ? ",
              style: GoogleFonts.lato(
                  textStyle: const TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: textcolor)),
            ),

            //subtitle
            const SizedBox(
              height: 5,
            ),
            Text(
              "Lets Get You Signed Up ",
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
               
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    height: 700,
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
                            onSaved: (value){
                              usernamecontroller.text =value.toString();

                            },
                            validator: (value){
                              if(value.toString().isEmpty){
                                return 'Enter your Name ';
                              }
                              else{
                                return null; 
                              }
                            },
                            key: ValueKey(usernamecontroller),
                              hinttext: 'Enter your Username',
                              controller: usernamecontroller,
                              obscuretext: false),
                              const SizedBox(
                            height: 10,
                          ),
                          customTextfeild(
                            onSaved: (value) {
                              emailcontroller.text = value.toString();
                            },
                            
                            validator: (value) {
                              if (value.toString().isEmpty) {
                                return 'Email should not be empty';
                              } else if (!value.toString().contains('@')) {
                                return 'Enter a valid email';
                              } else {
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
                          customTextfeild(
                            onSaved: (value) {
                              passwordcontroller.text = value.toString();
                            },
                            validator: (value) {
                              if (value.toString().length <= 5) {
                                return 'password lenght should be 6 or more ';
                              } else {
                                return null;
                              }
                            },
                            key: ValueKey(passwordcontroller),
                            hinttext: 'Password',
                            controller: passwordcontroller,
                            obscuretext: true,
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          customTextfeild(
                            onSaved: (value) {
                              confirmpasswordcontroller.text = value.toString();
                            },
                            validator: (value) {
                              if (value.toString() != passwordcontroller.text) {
                                return 'passwords Do not match ';
                              } else {
                                return null;
                              }
                            },
                            key: ValueKey(confirmpasswordcontroller),
                            hinttext: 'Confirm Password',
                            controller: confirmpasswordcontroller,
                            obscuretext: true,
                          )

                          //login button
                          ,
                          const SizedBox(
                            height: 20,
                          ),
                          custombutton(text: 'SignUp', onPressed: trysubmit),
                          //new USer ?
                          const SizedBox(
                            height: 10,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text(
                                'Already a user ?',
                                style: TextStyle(color: primarycolor),
                              ),
                              GestureDetector(
                                onTap: () {
                                  Navigator.pop(context);
                                },
                                child: const Text(
                                  'SignIn',
                                  style: TextStyle(color: textcolor),
                                ),
                              ),
                            ],
                          ),
                          //or login with
                          const SizedBox(
                            height: 20,
                          ),
                          const customdivider(dividertext: 'OR'),
                          //apple and google logo
                          const SizedBox(
                            height: 20,
                          ),
                           Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              customcontainer(
                                onTap: ()async{
                                  await _signInWithGoogle(context);

                                },
                                imagepath: 'assets/images/google.png',
                              ),
                              const customcontainer(
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
      ),
    );
  }

  trysubmit() {
    final isvalid = _signupFormKey.currentState!.validate();
    if (isvalid) {
      signup();
      create('Users', usernamecontroller.text, usernamecontroller.text, emailcontroller.text, 'image','address');
    } else {
      print('something wrong');
    }
  }
    Future<void> _signInWithGoogle(BuildContext context) async {
    try {
      final GoogleSignInAccount? googleSignInAccount = await _googleSignIn.signIn();
      if (googleSignInAccount != null) {
        final GoogleSignInAuthentication googleSignInAuthentication =
            await googleSignInAccount.authentication;

        final AuthCredential credential = GoogleAuthProvider.credential(
          accessToken: googleSignInAuthentication.accessToken,
          idToken: googleSignInAuthentication.idToken,
        );

        final UserCredential authResult = await _auth.signInWithCredential(credential);
        final User? user = authResult.user;

        if (user != null) {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const Homepage()), 
          );
        } else {
          print('Failed to sign in with Google');
        }
      }
    } catch (error) {
      print('Error signing in with Google: $error');
    }
  }

  void signup() async {
    await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: emailcontroller.text, password: passwordcontroller.text);
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => const Homepage()));
  }
}
