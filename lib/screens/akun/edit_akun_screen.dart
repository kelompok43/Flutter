import 'dart:io';

import 'package:camera/camera.dart';
import 'package:fitness_gym/screens/akun/akun_view_model.dart';
import 'package:fitness_gym/widgets/widgets.dart';
import 'package:fitness_gym/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:iconify_flutter/icons/heroicons_solid.dart';
import 'package:iconify_flutter/icons/typcn.dart';
import 'package:provider/provider.dart';

import '../payment/camera_screen.dart';

class EditAkunScreen extends StatelessWidget {
  const EditAkunScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();
    Provider.of<AkunViewModel>(context, listen: false).fetchData();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: neutral9,
        title: const Text(
          "Ubah Akun",
          style: TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Consumer<AkunViewModel>(
              builder: (context, viewModel, child) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    sizedBoxHeight(30),
                    Center(
                      child: Stack(
                        children: [
                          Container(
                            height: 100,
                            width: 100,
                            decoration: BoxDecoration(
                              color: primary1,
                              shape: BoxShape.circle,
                            ),
                            child: viewModel.imagePath != null
                                ? ClipRRect(
                                    borderRadius: BorderRadius.circular(60),
                                    child: Image.file(
                                      viewModel.imagePath!,
                                      fit: BoxFit.cover,
                                    ),
                                  )
                                : viewModel.user.picture! != ""
                                    ? ClipRRect(
                                        borderRadius: BorderRadius.circular(60),
                                        child: Image.network(
                                          viewModel.user.picture!,
                                          fit: BoxFit.cover,
                                        ),
                                      )
                                    : Icon(
                                        Icons.person_outline_rounded,
                                        color: primary4,
                                        size: 50,
                                      ),
                          ),
                          GestureDetector(
                            onTap: () => takePicture(context),
                            child: Container(
                                width: 30,
                                height: 30,
                                margin:
                                    const EdgeInsets.only(left: 70, top: 70),
                                padding: const EdgeInsets.all(5),
                                decoration: BoxDecoration(
                                  color: primary5,
                                  shape: BoxShape.circle,
                                ),
                                child: const Iconify(
                                  Typcn.camera_outline,
                                  color: Colors.white,
                                )),
                          )
                        ],
                      ),
                    ),
                    sizedBoxHeight(30),
                    Text(
                      "Nama Lengkap",
                      style: GoogleFonts.poppins(
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                        color: neutral9,
                      ),
                    ),
                    sizedBoxHeight(5),
                    TextFormField(
                      controller: viewModel.nameCtrl,
                      style: GoogleFonts.poppins(
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                        color: neutral9,
                      ),
                      decoration: InputDecoration(
                        contentPadding: const EdgeInsets.all(10),
                        hintText: "Nama Lengkap",
                        hintStyle: GoogleFonts.poppins(),
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
                          return "Nama Harus Diisi";
                        }
                        return null;
                      },
                    ),
                    sizedBoxHeight(30),
                    Text(
                      "Tanggal Lahir",
                      style: GoogleFonts.poppins(
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                        color: neutral9,
                      ),
                    ),
                    sizedBoxHeight(5),
                    TextFormField(
                      onTap: () => viewModel.datePicker(
                          context, viewModel.tglLahirCtrl!),
                      readOnly: true,
                      style: GoogleFonts.poppins(
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                        color: neutral9,
                      ),
                      controller: viewModel.tglLahirCtrl,
                      decoration: InputDecoration(
                        contentPadding: const EdgeInsets.all(10),
                        hintText: "Tanggal Lahir",
                        hintStyle: GoogleFonts.poppins(),
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
                          return "Tanggal Lahir Harus Diisi";
                        }
                        return null;
                      },
                    ),
                    sizedBoxHeight(30),
                    Text(
                      "Alamat",
                      style: GoogleFonts.poppins(
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                        color: neutral9,
                      ),
                    ),
                    sizedBoxHeight(5),
                    TextFormField(
                      controller: viewModel.alamatCtrl,
                      style: GoogleFonts.poppins(
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                        color: neutral9,
                      ),
                      decoration: InputDecoration(
                        contentPadding: const EdgeInsets.all(10),
                        hintText: "Alamat",
                        hintStyle: GoogleFonts.poppins(),
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
                          return "Alamat Harus Diisi";
                        }
                        return null;
                      },
                    ),
                    sizedBoxHeight(30),
                    Card(
                      child: ListTile(
                        title: Text(
                          "Email",
                          style: GoogleFonts.poppins(
                            fontSize: 12,
                            fontWeight: FontWeight.w600,
                            color: neutral9,
                          ),
                        ),
                        subtitle: Text(
                          viewModel.emailCtrl!.text,
                          style: GoogleFonts.poppins(
                            fontSize: 12,
                            fontWeight: FontWeight.w600,
                            color: neutral7,
                          ),
                        ),
                        trailing: IconButton(
                          onPressed: () {
                            showModalBottomSheet<void>(
                              isScrollControlled: true,
                              shape: const RoundedRectangleBorder(
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(10),
                                  topRight: Radius.circular(10),
                                ),
                              ),
                              context: context,
                              builder: (BuildContext context) {
                                return SingleChildScrollView(
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 16,
                                      vertical: 20,
                                    ),
                                    child: Padding(
                                      padding: EdgeInsets.only(
                                        bottom: MediaQuery.of(context)
                                            .viewInsets
                                            .bottom,
                                      ),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Text(
                                            "Tambahkan Email",
                                            style: GoogleFonts.poppins(
                                              fontSize: 16,
                                              fontWeight: FontWeight.w600,
                                              color: info7,
                                            ),
                                          ),
                                          sizedBoxHeight(19),
                                          Text(
                                            "Email",
                                            style: GoogleFonts.poppins(
                                              fontSize: 12,
                                              fontWeight: FontWeight.w600,
                                              color: neutral9,
                                            ),
                                          ),
                                          sizedBoxHeight(5),
                                          TextFormField(
                                            controller: viewModel.emailCtrl,
                                            style: GoogleFonts.poppins(
                                              fontSize: 12,
                                              fontWeight: FontWeight.w600,
                                              color: neutral9,
                                            ),
                                            decoration: InputDecoration(
                                              contentPadding:
                                                  const EdgeInsets.all(10),
                                              focusedBorder: OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                color: primary5,
                                              )),
                                              enabledBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: primary3,
                                                ),
                                              ),
                                              hintText: viewModel.user.email,
                                              hintStyle: GoogleFonts.poppins(
                                                fontSize: 12,
                                                fontWeight: FontWeight.w600,
                                                color: const Color(0xFF5f5f5f),
                                              ),
                                            ),
                                          ),
                                          sizedBoxHeight(30),
                                          SizedBox(
                                            width: MediaQuery.of(context)
                                                .size
                                                .width,
                                            height: 45,
                                            child: ElevatedButton(
                                              onPressed: () {
                                                viewModel.changeEmail(
                                                    viewModel.emailCtrl!);
                                                Navigator.pop(context);
                                              },
                                              child: Text(
                                                "Simpan",
                                                style: GoogleFonts.poppins(
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.w700,
                                                ),
                                              ),
                                              style: ElevatedButton.styleFrom(
                                                  primary: primary4),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                );
                              },
                            );
                          },
                          icon: Iconify(
                            HeroiconsSolid.pencil_alt,
                            color: primary4,
                          ),
                        ),
                      ),
                    ),
                    sizedBoxHeight(30),
                    Card(
                      child: ListTile(
                        title: Text(
                          "No Telepon",
                          style: GoogleFonts.poppins(
                            fontSize: 12,
                            fontWeight: FontWeight.w600,
                            color: neutral9,
                          ),
                        ),
                        subtitle: Text(
                          viewModel.phoneCtrl!.text,
                          style: GoogleFonts.poppins(
                            fontSize: 12,
                            fontWeight: FontWeight.w600,
                            color: neutral7,
                          ),
                        ),
                        trailing: IconButton(
                          onPressed: () {
                            showModalBottomSheet<void>(
                              shape: const RoundedRectangleBorder(
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(10),
                                  topRight: Radius.circular(10),
                                ),
                              ),
                              context: context,
                              builder: (BuildContext context) {
                                return SingleChildScrollView(
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 16,
                                      vertical: 20,
                                    ),
                                    child: Padding(
                                      padding: EdgeInsets.only(
                                        bottom: MediaQuery.of(context)
                                            .viewInsets
                                            .bottom,
                                      ),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Text(
                                            "Tambahkan Nomor Telepon",
                                            style: GoogleFonts.poppins(
                                              fontSize: 16,
                                              fontWeight: FontWeight.w600,
                                              color: info7,
                                            ),
                                          ),
                                          sizedBoxHeight(19),
                                          Text(
                                            "Nomor Telepon",
                                            style: GoogleFonts.poppins(
                                              fontSize: 12,
                                              fontWeight: FontWeight.w600,
                                              color: neutral9,
                                            ),
                                          ),
                                          sizedBoxHeight(5),
                                          TextFormField(
                                            controller: viewModel.phoneCtrl,
                                            style: GoogleFonts.poppins(
                                              fontSize: 12,
                                              fontWeight: FontWeight.w600,
                                              color: neutral9,
                                            ),
                                            decoration: InputDecoration(
                                              contentPadding:
                                                  const EdgeInsets.all(10),
                                              focusedBorder: OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                color: primary5,
                                              )),
                                              enabledBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: primary3,
                                                ),
                                              ),
                                              hintText: "081234567890",
                                              hintStyle: GoogleFonts.poppins(
                                                fontSize: 12,
                                                fontWeight: FontWeight.w600,
                                                color: const Color(0xFF5f5f5f),
                                              ),
                                            ),
                                          ),
                                          sizedBoxHeight(30),
                                          SizedBox(
                                            width: MediaQuery.of(context)
                                                .size
                                                .width,
                                            height: 45,
                                            child: ElevatedButton(
                                              onPressed: () {
                                                viewModel.changePhone(
                                                    viewModel.phoneCtrl!);
                                                Navigator.pop(context);
                                              },
                                              child: Text(
                                                "Simpan",
                                                style: GoogleFonts.poppins(
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.w700,
                                                ),
                                              ),
                                              style: ElevatedButton.styleFrom(
                                                  primary: primary4),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                );
                              },
                            );
                          },
                          icon: Iconify(
                            HeroiconsSolid.pencil_alt,
                            color: primary4,
                          ),
                        ),
                      ),
                    ),
                    sizedBoxHeight(30),
                    SizedBox(
                      height: 45,
                      width: MediaQuery.of(context).size.width,
                      child: ElevatedButton(
                        onPressed: () {
                          final passwordCtrl = TextEditingController();
                          if (_formKey.currentState!.validate()) {
                            showDialog(
                                builder: (context) => AlertDialog(
                                      title: Text(
                                        "Masukkan Password Akun Anda",
                                        style: GoogleFonts.poppins(
                                          fontSize: 16,
                                          color: info7,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                      titlePadding: const EdgeInsets.symmetric(
                                        vertical: 20,
                                        horizontal: 16,
                                      ),
                                      contentPadding:
                                          const EdgeInsets.symmetric(
                                        horizontal: 16,
                                      ),
                                      actionsPadding:
                                          const EdgeInsets.symmetric(
                                        horizontal: 8,
                                        vertical: 10,
                                      ),
                                      content: Consumer<AkunViewModel>(
                                        builder: (context, value, child) =>
                                            Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                mainAxisSize: MainAxisSize.min,
                                                children: [
                                              Text(
                                                "Password",
                                                style: GoogleFonts.poppins(
                                                  fontSize: 12,
                                                  fontWeight: FontWeight.w600,
                                                  color: neutral9,
                                                ),
                                              ),
                                              sizedBoxHeight(5),
                                              textFormFieldForPassword(
                                                  textCtrl: passwordCtrl,
                                                  hintText:
                                                      "Masukkan Password Anda",
                                                  isHidden: value.isHidden,
                                                  onTap: () => value.isHidden =
                                                      !value.isHidden,
                                                  message:
                                                      "Password Tidak Boleh Kosong",
                                                  action: TextInputAction.done)
                                            ]),
                                      ),
                                      actions: [
                                        SizedBox(
                                          height: 45,
                                          width:
                                              MediaQuery.of(context).size.width,
                                          child: ElevatedButton(
                                            onPressed: () {
                                              final email =
                                                  viewModel.user.email;
                                              if (_formKey.currentState!
                                                  .validate()) {
                                                viewModel.addDetailUser(email!,
                                                    passwordCtrl.text, context);
                                              }
                                            },
                                            child: Text(
                                              "OKE",
                                              style: GoogleFonts.poppins(
                                                fontSize: 12,
                                                fontWeight: FontWeight.w600,
                                                color: Colors.white,
                                              ),
                                            ),
                                            style: ElevatedButton.styleFrom(
                                              primary: primary4,
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                context: context);
                          }
                        },
                        child: Text(
                          "SIMPAN",
                          style: GoogleFonts.poppins(
                            fontSize: 16,
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        style: ElevatedButton.styleFrom(
                          primary: primary4,
                        ),
                      ),
                    ),
                    sizedBoxHeight(20),
                  ],
                );
              },
            ),
          ),
        ),
      ),
    );

    // }
  }

  Future<void> takePicture(BuildContext context) async {
    final cameras = await availableCameras();
    if (cameras.isEmpty) {
      SnackBar snackBar = SnackBar(
        behavior: SnackBarBehavior.floating,
        backgroundColor: primary5,
        duration: const Duration(seconds: 2),
        content: const Text('Tidak ada kamera di perangkat ini'),
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
      return;
    }
    final firstCamera = cameras.first;

    var picture = await Navigator.push<XFile>(
        context,
        MaterialPageRoute(
          builder: (context) => CameraScreen(
            cameras: firstCamera,
          ),
        ));

    if (picture != null) {
      Provider.of<AkunViewModel>(context, listen: false).imagePath =
          File(picture.path);
    }
  }
}
