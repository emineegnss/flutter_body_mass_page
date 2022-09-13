import 'package:flutter/material.dart';

class MyContainer extends StatelessWidget {
  final Color renk;
  final Widget? child;
  final Function()? onPress;
  MyContainer({this.renk = Colors.white, this.child, this.onPress});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        margin: EdgeInsets.all(12),
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(20), color: renk),
        child: child,
      ),
    );
  }
}

class IconCinsiyet extends StatelessWidget {
  final String cinsiyet;
  final IconData icon;
  IconCinsiyet({required this.cinsiyet, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Column(mainAxisAlignment: MainAxisAlignment.center,
        //crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(icon, size: 50, color: Colors.black54),
          SizedBox(
            height: 10,
          ),
          Text(
            cinsiyet,
            style: TextStyle(fontSize: 25, color: Colors.black54, fontWeight: FontWeight.w600),
          )
        ]);
  }
}

TextStyle yaziStili = TextStyle(
  fontSize: 22,
  color: Colors.black54,
  fontWeight: FontWeight.bold,
);
TextStyle sayiStili = TextStyle(fontSize: 30, color: Colors.lightBlue, fontWeight: FontWeight.bold);
