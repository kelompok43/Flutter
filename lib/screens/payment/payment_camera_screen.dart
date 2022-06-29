import 'dart:io';

import 'package:camera/camera.dart';
import 'package:fitness_gym/screens/payment/camera_screen.dart';
import 'package:fitness_gym/utils/constants.dart';
import 'package:fitness_gym/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

class PaymentCameraScreen extends StatelessWidget {
  final String? imagePath;
  const PaymentCameraScreen({Key? key, this.imagePath}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
                Row(
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
                                child:
                                    Image.asset("assets/img/foto_buram.png")),
                            Container(
                              margin: const EdgeInsets.only(top: 41, left: 33),
                              child: SvgPicture.asset("assets/img/salah.svg"),
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
                                child:
                                    Image.asset("assets/img/foto_terang.png")),
                            Container(
                              margin: const EdgeInsets.only(top: 41, left: 33),
                              child: SvgPicture.asset("assets/img/salah.svg"),
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
                                child:
                                    Image.asset("assets/img/foto_gelap.png")),
                            Container(
                              margin: const EdgeInsets.only(top: 41, left: 33),
                              child: SvgPicture.asset("assets/img/salah.svg"),
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
                              child: SvgPicture.asset("assets/img/salah.svg"),
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
                ),
                sizedBoxHeight(10),
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
                  child: imagePath != null
                      ? Image.file(File(imagePath!))
                      : Stack(
                          children: [
                            GestureDetector(
                              onTap: () async {
                                final cameras = await availableCameras();
                                final firstCamera = cameras.first;
                                await availableCameras()
                                    .then((_) => Navigator.pushReplacement(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => CameraScreen(
                                            cameras: firstCamera,
                                          ),
                                        )));
                              },
                              child: Center(
                                child: Container(
                                  height: 80,
                                  width: 80,
                                  decoration: BoxDecoration(
                                    color: primary5,
                                    borderRadius: BorderRadius.circular(50),
                                  ),
                                  child: const Icon(
                                    Icons.camera_alt,
                                    color: Colors.white,
                                    size: 35,
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              margin: const EdgeInsets.only(left: 75, top: 170),
                              child: Text(
                                "Upload Struk Pembayaran-mu",
                                style: GoogleFonts.poppins(
                                  fontWeight: FontWeight.w400,
                                  color: neutral8,
                                ),
                              ),
                            ),
                          ],
                        ),
                ),
                sizedBoxHeight(36),
                Column(
                  children: [
                    SizedBox(
                      height: 40,
                      width: MediaQuery.of(context).size.width,
                      child: ElevatedButton(
                        onPressed: () {},
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
                        onPressed: () async {
                          final cameras = await availableCameras();
                          final firstCamera = cameras.first;
                          await availableCameras()
                              .then((_) => Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => CameraScreen(
                                      cameras: firstCamera,
                                    ),
                                  )));
                        },
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
}
