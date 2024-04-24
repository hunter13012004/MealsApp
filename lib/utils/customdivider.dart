import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mealsapp/constants/colorspicker.dart';

class customdivider extends StatelessWidget {
  final String dividertext;
  const customdivider({super.key, required this.dividertext});


  @override
  Widget build(BuildContext context) {
    return  Row(
                children: [
                  Expanded(
                    child: Divider(
                      thickness: 1,
                      color: primarycolor,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    child: Text(
                      dividertext,
                      style: GoogleFonts.lato(textStyle: TextStyle(color: textcolor)),
                    ),
                  ),
                  Expanded(
                    child: Divider(
                      thickness: 1,
                      color: primarycolor,
                    ),
                  ),
                ],
              );
  }
}