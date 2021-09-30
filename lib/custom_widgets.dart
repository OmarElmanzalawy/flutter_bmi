// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';
import 'constants.dart';

enum GenderCard{male,female}
GenderCard? selectedGender;


class IconCard extends StatelessWidget {
  final String title;
  final Icon icon;

  IconCard({required this.title,required this.icon});

  @override
  Widget build(BuildContext context) {
      return Center(
        child: Column(
          children: [
            SizedBox(height: 20,),
            icon,
            Padding(
              padding: EdgeInsets.only(top: 20),
              child: Text(title,style: kTitleStyle,),
            )
          ],
        ),
      );
  }
}

class RoundIconButton extends StatelessWidget{
  final IconData icn;
  final Color? iconColor;
  final VoidCallback onpressed;
  final Color? backgroundColor;
  RoundIconButton({required this.icn,required this.onpressed, this.iconColor,this.backgroundColor});
  @override
  Widget build(BuildContext context){
    return ElevatedButton.icon(
      icon: Icon(icn,color: iconColor ?? Color(0xffffffff),),
      label: Text(''),
      onPressed: onpressed,
      style: ButtonStyle(
        elevation: MaterialStateProperty.all(12.0),
        padding: MaterialStateProperty.all(EdgeInsets.only(left: 7)),
        backgroundColor: MaterialStateProperty.all(backgroundColor),
        shape: MaterialStateProperty.all(CircleBorder()),
        fixedSize: MaterialStateProperty.all(Size(40,40)),
      ),
    );
  }
}
class CustomCard extends StatelessWidget {
  final double? width;
  final double? height;
  final Color? color;
  final EdgeInsets? margin;
  final Widget? cardChild;
  CustomCard({this.width,this.height,this.color,this.margin,this.cardChild});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        child: cardChild,
        margin: margin ?? EdgeInsets.all(15.0),
        height: height ?? MediaQuery.of(context).size.height*0.24,
        width:  width ?? MediaQuery.of(context).size.width*0.4,
        decoration: BoxDecoration(
          color: color ?? Color(0xff1d1f33),
          borderRadius: BorderRadius.circular(10.0),
        ),
      ),
    );
  }
}