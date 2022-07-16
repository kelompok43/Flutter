import 'package:fitness_gym/screens/change_password/change_password_view_model.dart';
import 'package:fitness_gym/utils/constants.dart';
import 'package:fitness_gym/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ChangePasswordScreen extends StatelessWidget {
  const ChangePasswordScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final newPasswordCtrl = TextEditingController();
    final confirmNewPasswordCtrl = TextEditingController();
    final _formKey = GlobalKey<FormState>();
    return Scaffold(
        appBar: AppBar(
          title: Text(
            "Ubah Kata Sandi",
            style: GoogleFonts.poppins(
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
          ),
          backgroundColor: neutral9,
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 16,
            ),
            child: Consumer<ChangePasswordViewModel>(
              builder: (context, value, child) {
                return Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        padding: const EdgeInsets.only(
                          top: 48,
                          left: 18,
                          bottom: 24,
                        ),
                        child: SvgPicture.asset(
                            "assets/icons/change_password_icon.svg"),
                      ),
                      Text(
                        "Ubah Password",
                        style: GoogleFonts.poppins(
                          fontSize: 24,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Text(
                        "Silahkan ubah password baru sesuai keinginan Anda.",
                        style: GoogleFonts.poppins(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            color: neutral6),
                      ),
                      sizedBoxHeight(76),
                      Text(
                        "Password Baru",
                        style: GoogleFonts.poppins(
                          color: neutral9,
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      sizedBoxHeight(5),
                      textFormFieldForPassword(
                        textCtrl: newPasswordCtrl,
                        hintText: "New Password",
                        isHidden: value.newPassHidden,
                        onTap: () {
                          value.newPassHidden = !value.newPassHidden;
                        },
                        message: "Password Baru",
                        action: TextInputAction.next,
                      ),
                      sizedBoxHeight(30),
                      Text(
                        "Konfirmasi Password Baru",
                        style: GoogleFonts.poppins(
                          color: neutral9,
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      textFormFieldForPassword(
                        textCtrl: confirmNewPasswordCtrl,
                        hintText: "Konfirmasi Password Baru",
                        isHidden: value.confirmNewPassHidden,
                        onTap: () {
                          value.confirmNewPassHidden =
                              !value.confirmNewPassHidden;
                        },
                        message: "Konfirmasi Password Baru",
                        action: TextInputAction.done,
                      ),
                      sizedBoxHeight(80),
                      SizedBox(
                        height: 45,
                        width: MediaQuery.of(context).size.width,
                        child: ElevatedButton(
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              _formKey.currentState!.save();
                              if (newPasswordCtrl.text ==
                                  confirmNewPasswordCtrl.text) {
                                showDialog(
                                  context: context,
                                  builder: (BuildContext context) =>
                                      AlertDialog(
                                    content: Text(
                                      "Apakah anda yakin ingin ubah password ?",
                                      textAlign: TextAlign.center,
                                      style: GoogleFonts.poppins(
                                          textStyle: TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.w400,
                                        color: neutral8,
                                      )),
                                    ),
                                    alignment: Alignment.center,
                                    actionsAlignment: MainAxisAlignment.center,
                                    actions: [
                                      SizedBox(
                                        width: 130,
                                        child: ElevatedButton(
                                          onPressed: () {
                                            value.changePassword(
                                                newPasswordCtrl.text, context);
                                          },
                                          child: Text(
                                            "Ya",
                                            style: GoogleFonts.poppins(
                                              textStyle: TextStyle(
                                                  color: primary5,
                                                  fontWeight: FontWeight.w700,
                                                  fontSize: 12),
                                            ),
                                          ),
                                          style: ElevatedButton.styleFrom(
                                            primary: Colors.white,
                                            side: BorderSide(
                                              width: 1,
                                              color: primary5,
                                            ),
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        width: 130,
                                        child: ElevatedButton(
                                          onPressed: () {
                                            Navigator.pop(context);
                                          },
                                          child: Text(
                                            "Batal",
                                            style: GoogleFonts.poppins(
                                              textStyle: const TextStyle(
                                                fontSize: 12,
                                                color: Colors.white,
                                                fontWeight: FontWeight.w700,
                                              ),
                                            ),
                                          ),
                                          style: ElevatedButton.styleFrom(
                                              primary: primary4),
                                        ),
                                      ),
                                    ],
                                  ),
                                );
                              } else {
                                SnackBar snackBar = SnackBar(
                                  behavior: SnackBarBehavior.floating,
                                  backgroundColor: primary5,
                                  duration: const Duration(seconds: 2),
                                  content:
                                      const Text('Confirm Password Tidak Sama'),
                                );
                                ScaffoldMessenger.of(context)
                                    .showSnackBar(snackBar);
                              }
                            }
                          },
                          child: Text(
                            "UBAH PASSWORD",
                            style: GoogleFonts.poppins(
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          style: ElevatedButton.styleFrom(
                            primary: primary4,
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ));
  }
}
