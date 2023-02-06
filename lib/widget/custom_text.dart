
import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  final String text;
  const CustomText({
    Key? key,required this.text
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style: const TextStyle(fontWeight: FontWeight.w400,fontSize: 18,color: Color(0xffE69023)),
      cursorColor: const Color(0xffE69023),
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.symmetric(vertical: 10,horizontal: 15),
        hintText: text,
        hintStyle:const TextStyle(fontWeight: FontWeight.w400,fontSize: 16,color: Colors.white),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(25),
              borderSide: const BorderSide(color: Colors.white)),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(25),
              borderSide: const BorderSide(
                  width: 2, color: Colors.white)),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(25),
              borderSide: const BorderSide(
                  width: 2, color: Color(0xffE69023)))),
    );
  }
}