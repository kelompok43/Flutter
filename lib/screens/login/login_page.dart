import 'package:fitness_gym/screens/login/login_view_model.dart';
import 'package:fitness_gym/screens/register/widgets.dart';
import 'package:fitness_gym/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();
    final _usernameController = TextEditingController();
    final _passwordController = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        shadowColor: Colors.black12,
        title: const Text(
          "Login",
          style: TextStyle(
            color: Colors.black,
            fontSize: 14,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
          child: SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Consumer<LoginViewModel>(
                  builder: (context, viewModel, child) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    labelText("Email atau Nomor Ponsel"),
                    sizedBoxHeight(5),
                    textFormFieldRegister(
                        _usernameController, 'Masukkan email'),
                    sizedBoxHeight(5),
                    exampleText('Contoh: 08123456789'),
                    sizedBoxHeight(20),
                    labelText("Password"),
                    sizedBoxHeight(5),
                    textFormFieldForPassword(_passwordController,
                        'Masukkan kata sandi', viewModel.isHidden, () {
                      viewModel.isHidden = !viewModel.isHidden;
                    }),
                    sizedBoxHeight(5),
                    exampleText('Contoh: 08123456789'),
                    sizedBoxHeight(20),
                    SizedBox(
                      height: 45,
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {},
                        child: const Text(
                          'Login',
                          style: TextStyle(fontWeight: FontWeight.w600),
                        ),
                        style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all(colorOrange),
                        ),
                      ),
                    ),
                    Row(
                      children: [
                        const Text(
                          "Dengan mendaftar, saya menyetujui",
                          style: TextStyle(
                              fontSize: 12, fontWeight: FontWeight.bold),
                        ),
                        TextButton(
                          onPressed: () {},
                          child: const Text(
                            "Syarat dan Ketentuan",
                            style: TextStyle(
                                fontSize: 12, fontWeight: FontWeight.bold),
                          ),
                        ),
                      ],
                    ),
                  ],
                );
              }),
            ),
          )),
    );
  }
}
