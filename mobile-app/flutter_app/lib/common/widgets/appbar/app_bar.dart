import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class BasicAppBar extends StatelessWidget implements PreferredSizeWidget {
  final Widget ? title;
  const BasicAppBar({super.key, this.title});

  @override
  Widget build(BuildContext context) {
    return AppBar(
     
     backgroundColor: Colors.transparent,
     elevation: 0,
     centerTitle: true,
     title: title ?? const  Text("") ,
     leading: IconButton(
      onPressed: (){
        Navigator.pop(context);
      }, 
      icon:Container(
        height: 50,
        width: 50,
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.08),
          shape: BoxShape.circle
        ),
        child: Icon(
          Icons.arrow_back_ios_new,
          size: 20,
          
        ),
      ) ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight); // AppBar height
}
