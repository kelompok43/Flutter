import 'dart:io';

import 'package:camera/camera.dart';
import 'package:fitness_gym/screens/payment/camera_screen.dart';
import 'package:fitness_gym/utils/constants.dart';
import 'package:fitness_gym/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import 'payment_view_model.dart';

class PaymentCameraScreen extends StatefulWidget {
  const PaymentCameraScreen({Key? key}) : super(key: key);

  @override
  State<PaymentCameraScreen> createState() => _PaymentCameraScreenState();
}

class _PaymentCameraScreenState extends State<PaymentCameraScreen> {
  var uploadingState = TransactionState.initial;
  @override
  Widget build(BuildContext context) {
    return Consumer<PaymentViewModel>(
      builder: (context, viewModel, child) {
        switch (viewModel.uploadState) {
          //tampilan saat upload bukti tf
          case TransactionState.loading:
            return Scaffold(
              body: Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      "Tunggu sebentar, ya...",
                      style: GoogleFonts.poppins(
                        fontSize: 24,
                        color: neutral9,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    Text(
                      "Pembayaranmu lagi diproses",
                      style: GoogleFonts.poppins(
                        fontSize: 16,
                        color: neutral5,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),
            );
          //tampilan saat berhasil upload bukti tf
          case TransactionState.done:
            return Scaffold(
              body: Padding(
                padding: const EdgeInsets.all(16),
                child: Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      SvgPicture.asset('assets/icons/sukses_upload_bukti.svg'),
                      sizedBoxHeight(40),
                      Text(
                        "Selamat!",
                        style: GoogleFonts.poppins(
                          fontSize: 24,
                          color: success6,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      Text(
                        "Pembayaranmu berhasil dikirim",
                        style: GoogleFonts.poppins(
                          fontSize: 18,
                          color: success6,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Text(
                        "Pembayaran akan segera diproses jangan lupa cek notifikasi ya !",
                        style: GoogleFonts.poppins(
                          fontSize: 12,
                          color: neutral6,
                          fontWeight: FontWeight.w400,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      sizedBoxHeight(60),
                      SizedBox(
                        height: 40,
                        width: MediaQuery.of(context).size.width,
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: Text(
                            "Cek Status Member",
                            style: GoogleFonts.poppins(
                              fontSize: 14,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          style: ElevatedButton.styleFrom(
                            primary: primary4,
                          ),
                        ),
                      ),
                      sizedBoxHeight(16),
                      SizedBox(
                        height: 40,
                        width: MediaQuery.of(context).size.width,
                        child: OutlinedButton(
                          onPressed: () {},
                          child: Text(
                            "Kembali ke Beranda",
                            style: GoogleFonts.poppins(
                              fontSize: 14,
                              fontWeight: FontWeight.w700,
                              color: primary5,
                            ),
                          ),
                          style: OutlinedButton.styleFrom(
                            primary: primary4,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          //tampilan sebelum upload, menampilkan tombol untuk ambil foto dan unggah foto, panduan, ketentuan dll
          case TransactionState.initial:
            return Scaffold(
              appBar: AppBar(
                title: Text(
                  "Pembayaran",
                  style: GoogleFonts.poppins(
                    fontSize: 16,
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                backgroundColor: neutral9,
              ),
              body: ListView(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Informasi kamu akan dilindungi Syarat dan Kebijakan Privasi masing-masing pihak untuk mematuhi peratiuran dari otoritas terkait.",
                          style: GoogleFonts.poppins(
                            fontSize: 10,
                            fontWeight: FontWeight.w400,
                            color: neutral4,
                          ),
                        ),
                        sizedBoxHeight(20),
                        Text("Panduan foto Struk Pembayaran :",
                            style: GoogleFonts.poppins(
                              fontSize: 14,
                              color: neutral9,
                              fontWeight: FontWeight.w400,
                            )),
                        sizedBoxHeight(20),
                        getContohBuktiWidget(),
                        sizedBoxHeight(10),
                        ...getKetentuanBukti(),
                        sizedBoxHeight(26),
                        Container(
                          height: 245,
                          width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(
                              color: primary4,
                              width: 2,
                            ),
                          ),
                          child: viewModel.imagePath != null
                              ? ClipRRect(
                                  borderRadius: BorderRadius.circular(10),
                                  child: Image.file(
                                    viewModel.imagePath!,
                                    fit: BoxFit.cover,
                                  ),
                                )
                              : Center(
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      GestureDetector(
                                        onTap: takePicture,
                                        child: Center(
                                          child: Container(
                                            height: 80,
                                            width: 80,
                                            decoration: BoxDecoration(
                                              color: primary5,
                                              borderRadius:
                                                  BorderRadius.circular(50),
                                            ),
                                            child: const Icon(
                                              Icons.camera_alt,
                                              color: Colors.white,
                                              size: 35,
                                            ),
                                          ),
                                        ),
                                      ),
                                      sizedBoxHeight(13),
                                      Text(
                                        "Upload Struk Pembayaran-mu",
                                        style: GoogleFonts.poppins(
                                          fontWeight: FontWeight.w400,
                                          color: neutral8,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                        ),
                        sizedBoxHeight(36),
                        Column(
                          children: [
                            SizedBox(
                              height: 40,
                              width: MediaQuery.of(context).size.width,
                              child: ElevatedButton(
                                onPressed: () {
                                  viewModel.uploadBukti(context);
                                },
                                child: Text(
                                  "Unggah Foto",
                                  style: GoogleFonts.poppins(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                              ),
                            ),
                            sizedBoxHeight(20),
                            SizedBox(
                              height: 40,
                              width: MediaQuery.of(context).size.width,
                              child: ElevatedButton(
                                onPressed: takePicture,
                                child: Text(
                                  "Ambil Foto",
                                  style: GoogleFonts.poppins(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                                style: ElevatedButton.styleFrom(
                                  primary: primary4,
                                ),
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ],
              ),
            );
        }
      },
    );
  }

  Row getContohBuktiWidget() {
    return Row(
      children: [
        Column(
          children: [
            Stack(
              children: [
                Container(
                  width: 80,
                  height: 50,
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: danger3,
                      width: 2,
                    ),
                    borderRadius: BorderRadius.circular(5),
                  ),
                ),
                Container(
                    margin: const EdgeInsets.only(left: 15),
                    height: 50,
                    width: 50,
                    child: Image.asset("assets/img/foto_buram.png")),
                Container(
                  margin: const EdgeInsets.only(top: 41, left: 33),
                  child: SvgPicture.asset("assets/icons/salah.svg"),
                )
              ],
            ),
            Text(
              "Buram",
              style: GoogleFonts.poppins(
                fontSize: 10,
                color: neutral5,
                fontWeight: FontWeight.w400,
              ),
            ),
          ],
        ),
        Column(
          children: [
            Stack(
              children: [
                Container(
                  width: 80,
                  height: 50,
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: danger3,
                      width: 2,
                    ),
                    borderRadius: BorderRadius.circular(5),
                  ),
                ),
                Container(
                    margin: const EdgeInsets.only(left: 15),
                    height: 50,
                    width: 50,
                    child: Image.asset("assets/img/foto_terang.png")),
                Container(
                  margin: const EdgeInsets.only(top: 41, left: 33),
                  child: SvgPicture.asset("assets/icons/salah.svg"),
                )
              ],
            ),
            Text(
              "Terlalu Terang",
              style: GoogleFonts.poppins(
                fontSize: 10,
                color: neutral5,
                fontWeight: FontWeight.w400,
              ),
            )
          ],
        ),
        Column(
          children: [
            Stack(
              children: [
                Container(
                  width: 80,
                  height: 50,
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: danger3,
                      width: 2,
                    ),
                    borderRadius: BorderRadius.circular(5),
                  ),
                ),
                Container(
                    margin: const EdgeInsets.only(left: 15),
                    height: 50,
                    width: 50,
                    child: Image.asset("assets/img/foto_gelap.png")),
                Container(
                  margin: const EdgeInsets.only(top: 41, left: 33),
                  child: SvgPicture.asset("assets/icons/salah.svg"),
                )
              ],
            ),
            Text(
              "Gelap",
              style: GoogleFonts.poppins(
                fontSize: 10,
                color: neutral5,
                fontWeight: FontWeight.w400,
              ),
            )
          ],
        ),
        Column(
          children: [
            Stack(
              children: [
                Container(
                  width: 80,
                  height: 50,
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: danger3,
                      width: 2,
                    ),
                    borderRadius: BorderRadius.circular(5),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(left: 27),
                  height: 50,
                  width: 50,
                  child: Image.asset(
                    "assets/img/foto_terpotong.png",
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 41, left: 33),
                  child: SvgPicture.asset("assets/icons/salah.svg"),
                )
              ],
            ),
            Text(
              "Terpotong",
              style: GoogleFonts.poppins(
                fontSize: 10,
                color: neutral5,
                fontWeight: FontWeight.w400,
              ),
            ),
          ],
        ),
      ],
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
    );
  }

  Future<void> takePicture() async {
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
      Provider.of<PaymentViewModel>(context, listen: false).imagePath =
          File(picture.path);
    }
  }

  List<Widget> getKetentuanBukti() {
    return [
      Row(
        children: [
          Icon(
            Icons.circle,
            size: 5,
            color: neutral6,
          ),
          sizedBoxWidth(5),
          Text(
            "Foto Struk pembayaran asli atas nama kamu",
            style: GoogleFonts.poppins(
              fontSize: 10,
              color: neutral6,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
      Row(
        children: [
          Icon(
            Icons.circle,
            size: 5,
            color: neutral6,
          ),
          sizedBoxWidth(5),
          Text(
            "Foto Struk pembayaran tidak menggunakan flash",
            style: GoogleFonts.poppins(
              fontSize: 10,
              color: neutral6,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
      Row(
        children: [
          Icon(
            Icons.circle,
            size: 5,
            color: neutral6,
          ),
          sizedBoxWidth(5),
          Text(
            "Foto Struk dengan cahaya yang cukup (tidak gelap)",
            style: GoogleFonts.poppins(
              fontSize: 10,
              color: neutral6,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
      Row(
        children: [
          Icon(
            Icons.circle,
            size: 5,
            color: neutral6,
          ),
          sizedBoxWidth(5),
          Text(
            "Foto Struk pembayaran tidak terpotong",
            style: GoogleFonts.poppins(
              fontSize: 10,
              color: neutral6,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    ];
  }
}
