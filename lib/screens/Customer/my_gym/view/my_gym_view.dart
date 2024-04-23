import 'package:fitbull/screens/login/viewmodel/login_view_model.dart';
import 'package:fitbull/widgets/card_list_mygym.dart';
import 'package:fitbull/widgets/my_gym_info.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../widgets/QRCodeImage.dart';



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
      body:  Center(
        child: QRCodeImage(
          base64String: 'iVBORw0KGgoAAAANSUhEUgAAAMgAAADIAQAAAACFI5MzAAAA5UlEQVR4Xu2VMQ4DIQwETcUz+OkBP+UZdGQX3yUKSmq2YIUQeK5Y2dhn459sDbx1yCHUITKkGxRGuywVHpMS4bGOZhH7fdUhxVLtds09CBJkFK5FCcJ/XG8lg9XmwXclMruEltPaJduJa77Ez1WEsMJ0a7EFT60SYRa75RkuS673EqoF749ZcylSWWr8NOC6ZQ+JkJnLglLTsuWehIgL7RsxmJsWuaeLIWzTuxLhsXaOPdQ8ixF0LR8jXfMTOTLusVciY1rkmS5cSmSw2s9U/nK9nXiXwDhXWf4le8lPHXIIdYg2eQGJ0HcUmdej6QAAAABJRU5ErkJggg==',
        ),
      ),

    );
  }
}
