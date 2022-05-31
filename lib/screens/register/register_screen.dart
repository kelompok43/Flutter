import 'package:fitness_gym/screens/register/register_view_model.dart';
import 'package:fitness_gym/utils/constants.dart';
import 'package:fitness_gym/widgets/widgets.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();
    final namaCtrl = TextEditingController();
    final emailOrPhoneCtrl = TextEditingController();
    final passwordCtrl = TextEditingController();
    final confirmPasswordCtrl = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        shadowColor: Colors.black12,
        title: const Text("Daftar",
            style: TextStyle(
              color: Colors.black,
              fontSize: 14,
              fontWeight: FontWeight.w600,
            )),
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: const BoxDecoration(color: Colors.white),
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Consumer<RegisterViewModel>(
              builder: (BuildContext context, viewModel, Widget? child) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    sizedBoxHeight(5),
                    labelText("Nama Lengkap"),
                    sizedBoxHeight(5),
                    textFormField(namaCtrl, "Masukkan Nama Anda"),
                    sizedBoxHeight(20),
                    labelText("Email atau Nomor Ponsel"),
                    sizedBoxHeight(5),
                    textFormField(
                        emailOrPhoneCtrl, "Masukkan Email atau No Ponsel"),
                    sizedBoxHeight(5),
                    exampleText("Contoh : 08123456789"),
                    sizedBoxHeight(20),
                    labelText("Kata Sandi"),
                    sizedBoxHeight(5),
                    textFormFieldForPassword(passwordCtrl,
                        "Masukkan Kata Sandi", viewModel.passIsHidden, () {
                      viewModel.passisHidden = !viewModel.passIsHidden;
                    }),
                    sizedBoxHeight(5),
                    exampleText("Minimal 8 Karakter"),
                    sizedBoxHeight(20),
                    labelText("Masukkan Ulang Kata Sandi"),
                    sizedBoxHeight(5),
                    textFormFieldForPassword(
                        confirmPasswordCtrl,
                        "Masukkan Kata Sandi",
                        viewModel.confirmPassIsHidden, () {
                      viewModel.confirmPassIsHidden =
                          !viewModel.confirmPassIsHidden;
                    }),
                    sizedBoxHeight(5),
                    exampleText("Minimal 8 Karakter"),
                    sizedBoxHeight(20),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {},
                        child: const Text(
                          "Daftar",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        style: ElevatedButton.styleFrom(
                          primary: colorOrange,
                        ),
                      ),
                    ),
                    Column(
                      children: [
                        sizedBoxHeight(5),
                        RichText(
                          textAlign: TextAlign.center,
                          text: TextSpan(
                            text: "Dengan mendaftar, saya menyetujui ",
                            style: TextStyle(
                                fontSize: 12,
                                color: colorGrey,
                                fontWeight: FontWeight.bold),
                            children: [
                              TextSpan(
                                  text: "Syarat dan Ketentuan ",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 12,
                                      color: Colors.blue.shade800),
                                  recognizer: TapGestureRecognizer()
                                    ..onTap = () {}),
                              TextSpan(
                                  text: "Serta ",
                                  style: TextStyle(
                                      fontSize: 12,
                                      color: colorGrey,
                                      fontWeight: FontWeight.bold)),
                                      TextSpan(
                                  text: "Kebijakan Privasi ",
                                  style:  TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 12,
                                      color: Colors.blue.shade800),
                                  recognizer: TapGestureRecognizer()
                                    ..onTap = () {}),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
