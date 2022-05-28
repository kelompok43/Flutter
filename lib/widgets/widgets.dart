import 'package:flutter/material.dart';

Widget labelText(String text) {
  return Text(
    text,
    style: TextStyle(fontWeight: FontWeight.bold, color: Colors.grey.shade700),
  );
}

Widget exampleText(String text) {
  return Text(
    text,
    style: TextStyle(
        fontWeight: FontWeight.bold, color: Colors.grey.shade700, fontSize: 12),
  );
}

Widget sizedBoxHeight(double height) {
  return SizedBox(
    height: height,
  );
}

Widget sizedBoxWidth(double width) {
  return SizedBox(
    width: width,
  );
}

Widget sizedBoxHeightWidth(double height, double width) {
  return SizedBox(
    height: height,
    width: width,
  );
}

Widget textFormField(TextEditingController textCtrl, String hintText) {
  return TextFormField(
    controller: textCtrl,
    style: const TextStyle(fontSize: 12),
    decoration: InputDecoration(
      hintText: hintText,
      focusColor: Colors.orange,
      contentPadding: const EdgeInsets.all(10),
      focusedBorder: const OutlineInputBorder(
        borderSide: BorderSide(color: Colors.orange, width: 1),
      ),
      enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(
        color: Colors.orange,
        width: 0.8,
      )),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(5),
      ),
    ),
  );
}

Widget textFormFieldForPassword(TextEditingController textCtrl, String hintText,
    bool isHidden, Function() onTap) {
  return TextFormField(
    controller: textCtrl,
    obscureText: isHidden,
    style: const TextStyle(fontSize: 12),
    decoration: InputDecoration(
      contentPadding: const EdgeInsets.all(10),
      suffixIcon: IconButton(
        onPressed: onTap,
        icon: Icon(
          isHidden ? Icons.visibility_off : Icons.visibility,
          color: const Color(0xFF5F5F5F),
        ),
      ),
      hintText: hintText,
      focusColor: Colors.orange,
      focusedBorder: const OutlineInputBorder(
        borderSide: BorderSide(color: Colors.orange, width: 1),
      ),
      enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(
        color: Colors.orange,
        width: 0.8,
      )),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(5),
      ),
    ),
  );
}
