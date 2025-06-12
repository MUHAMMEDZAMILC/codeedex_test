import 'package:flutter/material.dart';

class AppText extends StatelessWidget {
   AppText({super.key,required this.text,this.color,this.letterspace,this.size,this.weight,this.maximumline,this.align});
  String text;
  int? maximumline=1;
   Color? color;
   double? size, letterspace;
   FontWeight? weight;
  TextAlign? align;
  @override
  Widget build(BuildContext context) {
    return Text(text,style:TextStyle(fontSize: size??14,color: color,fontWeight: weight,letterSpacing: letterspace) ,maxLines: maximumline,textAlign: align,overflow: TextOverflow.ellipsis,);
  }
}