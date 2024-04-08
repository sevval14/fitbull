import 'package:fitbull/widgets/card_list_mygym.dart';
import 'package:fitbull/widgets/my_gym_info.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';



class MyGymView extends StatefulWidget {
  MyGymView({Key? key}) : super(key: key);

  @override
  State<MyGymView> createState() => _MyGymViewState();
}

class _MyGymViewState extends State<MyGymView> {
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Container(
          alignment: Alignment.center,
          child: Text(
            "mygym",
            style: GoogleFonts.aBeeZee(
              fontSize: 30.0,
              fontWeight: FontWeight.w600,
              color: const Color.fromRGBO(0, 67, 168, 1),
            ),
          ),
        ),
        backgroundColor: Colors.white,
        automaticallyImplyLeading: true,
      ),
      body: Container()
    );
  }
}
