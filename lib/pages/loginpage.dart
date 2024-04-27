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
  final _formKey = GlobalKey<FormState>();
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
    return Scaffold(
      body: Form(
        key: _formKey,
        child: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(colors: [
            primarycolor.withOpacity(0.4),
            secondarycolor.withOpacity(0.2)
          ], begin: Alignment.topCenter, end: Alignment.bottomCenter)),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            // welcome text

            Center(
                child: Image.asset(
              'assets/images/logo.png',
              height: 200,
            )),
            const SizedBox(
              height: 10,
            ),
            Text(
              "Welcome Back ",
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
              "You Have Been Missed! ",
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
                    height: MediaQuery.of(context).size.height,
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
                              emailcontroller.text = value.toString();
                            },
                            key: ValueKey(emailcontroller),
                            validator: (value) {
                              if (value.toString().isEmpty) {
                                return 'Email should not be empty';
                              }else if(
                                !value.toString().contains('@')){
                                return 'Enter a valid email';

                              }
                              else{
                                return null;
                              }
                            },
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
                            key: ValueKey(passwordcontroller),
                            validator: (value) {
                              if (value.toString().length <=  5) {
                                return 'Password lenght should be greater than 6';
                              }
                              return null;
                            },
                            hinttext: 'Password',
                            controller: passwordcontroller,
                            obscuretext: true,
                          ),

                          // fdorgotpassword text?
                          const SizedBox(
                            height: 5,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              const ForgotPage()));
                                },
                                child: const Text(
                                  'Forgot password?',
                                  style: TextStyle(color: textcolor),
                                ),
                              ),
                            ],
                          ),
                          //login button

                          const SizedBox(
                            height: 20,
                          ),
                          custombutton(text: 'Login', onPressed: trysubmit),
                          //new USer ?
                          const SizedBox(
                            height: 10,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text(
                                'New User?',
                                style: TextStyle(color: primarycolor),
                              ),
                              GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              const signuserup()));
                                },
                                child: const Text(
                                  'SignUp',
                                  style: TextStyle(color: textcolor),
                                ),
                              ),
                            ],
                          ),
                          //or login with
                          const SizedBox(
                            height: 30,
                          ),
                          const customdivider(dividertext: 'OR'),
                          //apple and google logo
                          const SizedBox(
                            height: 50,
                          ),
                          const Row(
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
      ),
    );
  }

  trysubmit() {
    final isvalid = _formKey.currentState!.validate();
    if (isvalid) {
      signuserin();
    } else {
      print('something wrong');
    }
  }

  void signuserin() async {
    await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailcontroller.text, password: passwordcontroller.text);
    Navigator.push(
        context, MaterialPageRoute(builder: ((context) => const Homepage())));
  }
}
