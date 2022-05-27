import 'package:fitness_gym/screens/register/widgets.dart';
import 'package:flutter/material.dart';

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
        title: const Text(
          "Daftar",
          style: TextStyle(
            color: Colors.black,
          ),
        ),
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: const BoxDecoration(color: Colors.white),
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                sizedBoxHeight(5),
                labelText("Nama Lengkap"),
                sizedBoxHeight(5),
                textFormFieldRegister(namaCtrl, "Masukkan Nama Anda"),
                sizedBoxHeight(20),
                labelText("Email atau Nomor Ponsel"),
                sizedBoxHeight(5),
                textFormFieldRegister(
                    emailOrPhoneCtrl, "Masukkan Email atau No Ponsel"),
                sizedBoxHeight(5),
                exampleText("Contoh : 08123456789"),
                sizedBoxHeight(20),
                labelText("Kata Sandi"),
                sizedBoxHeight(5),
                textFormFieldRegister(passwordCtrl, "Masukkan Kata Sandi"),
                sizedBoxHeight(5),
                exampleText("Minimal 8 Karakter"),
                sizedBoxHeight(20),
                labelText("Masukkan Ulang Kata Sandi"),
                sizedBoxHeight(5),
                textFormFieldRegister(
                    confirmPasswordCtrl, "Masukkan Ulang Kata Sandi"),
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
                      primary: Colors.orange.shade800,
                    ),
                  ),
                ),
                Row(
                  children: [
                    const Text("Dengan mendaftar, saya menyetujui",
                        style: TextStyle(
                            fontSize: 12, fontWeight: FontWeight.bold)),
                    TextButton(
                      onPressed: () {},
                      child: const Text("Syarat dan Ketentuan",
                          style: TextStyle(
                              fontSize: 12, fontWeight: FontWeight.bold)),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
