import 'package:fitness_gym/utils/constants.dart';
import 'package:flutter/material.dart';

Widget labelText(String text) {
  return Text(
    text,
    style: TextStyle(fontWeight: FontWeight.bold, color: neutral5),
  );
}

Widget exampleText(String text) {
  return Text(
    text,
    style:
        TextStyle(fontWeight: FontWeight.bold, color: neutral5, fontSize: 12),
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

Widget textFormField(
    {required TextEditingController textCtrl,
    required String hintText,
    required String message,
    required TextInputAction action}) {
  return TextFormField(
    controller: textCtrl,
    textInputAction: action,
    style: const TextStyle(fontSize: 12),
    decoration: InputDecoration(
      hintText: hintText,
      focusColor: primary3,
      contentPadding: const EdgeInsets.all(10),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: primary3, width: 1),
      ),
      enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
        color: primary3,
        width: 0.8,
      )),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(5),
      ),
    ),
    validator: (value) {
      if (value == null || value.isEmpty) {
        return "$message Tidak Boleh Kosong";
      }
      return null;
    },
  );
}

Widget textFormFieldForPassword(
    {required TextEditingController textCtrl,
    required String hintText,
    required bool isHidden,
    required Function() onTap,
    required String message,
    required TextInputAction action}) {
  return TextFormField(
    controller: textCtrl,
    textInputAction: action,
    obscureText: isHidden,
    style: const TextStyle(fontSize: 12),
    decoration: InputDecoration(
      contentPadding: const EdgeInsets.all(10),
      suffixIcon: IconButton(
        onPressed: onTap,
        icon: Icon(
          isHidden ? Icons.visibility_off : Icons.visibility,
          color: neutral7,
        ),
      ),
      hintText: hintText,
      focusColor: primary3,
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: primary3, width: 1),
      ),
      enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
        color: primary3,
        width: 0.8,
      )),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(5),
      ),
    ),
    validator: (value) {
      if (value == null || value.isEmpty) {
        return "$message Tidak Boleh Kosong";
      }
      return null;
    },
  );
}
