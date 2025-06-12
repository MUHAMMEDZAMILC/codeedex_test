import 'package:flutter/material.dart';

class AppText extends StatelessWidget {
   AppText({super.key,required this.text,this.style,this.maximumline,this.align});
  String text;
  TextStyle? style;
  int? maximumline=1;
  TextAlign? align;
  @override
  Widget build(BuildContext context) {
    return Text(text,style:style ,maxLines: maximumline,textAlign: align,);
  }
}