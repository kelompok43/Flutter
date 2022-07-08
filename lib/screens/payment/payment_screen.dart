import 'package:fitness_gym/screens/payment/payment_camera_screen.dart';
import 'package:fitness_gym/screens/payment/payment_view_model.dart';
import 'package:fitness_gym/utils/constants.dart';
import 'package:fitness_gym/widgets/widgets.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class PaymentScreen extends StatefulWidget {
  const PaymentScreen({Key? key}) : super(key: key);

  @override
  State<PaymentScreen> createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Provider.of<PaymentViewModel>(context, listen: false)
        .getPaymentMethod(context);
  }

  @override
  Widget build(BuildContext context) {
    String selectedRadio = "1 Bulan";
    return Scaffold(
      appBar: AppBar(
        backgroundColor: neutral9,
        title: Text(
          "Pembayaran",
          style: GoogleFonts.poppins(
            fontSize: 16,
            color: Colors.white,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: Container(
        color: neutral8,
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        child: ListView(
          children: [
            Text(
              "Daftar menjadi member “Fitness Gym” dengan membayar ke :",
              style: GoogleFonts.poppins(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
            sizedBoxHeight(20),
            Consumer<PaymentViewModel>(builder: (context, viewModel, child) {
              if (viewModel.paymentMethod.isNotEmpty) {
                var firstMethod = viewModel.paymentMethod.first;
                return Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: neutral1,
                  ),
                  padding: const EdgeInsets.all(10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        height: 82,
                        width: 62,
                        child: Image.asset("assets/img/BRI.png"),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            (firstMethod.accNumber ?? 0).toString(),
                            style: GoogleFonts.poppins(
                              fontSize: 12,
                              color: neutral8,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          Text(
                            "a.n " + (firstMethod.accName ?? ""),
                            style: GoogleFonts.poppins(
                              fontSize: 10,
                              color: neutral6,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          Text(
                            "Fitness Gym",
                            style: GoogleFonts.poppins(
                              fontSize: 10,
                              color: neutral6,
                              fontWeight: FontWeight.w400,
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                );
              } else {
                return Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: neutral1,
                  ),
                  padding: const EdgeInsets.all(10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Tidak ada metode pembayaran untuk saat ini",
                            style: GoogleFonts.poppins(
                              fontSize: 12,
                              color: neutral8,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                );
              }
            }),
            sizedBoxHeight(20),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: neutral1,
              ),
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Consumer<PaymentViewModel>(
                builder: (context, value, child) {
                  String textValue = '';
                  if (value.selectedValue == "1 Bulan") {
                    textValue = "Rp 400.000";
                  } else if (value.selectedValue == "3 Bulan") {
                    textValue = "Rp 1.000.000";
                  } else if (value.selectedValue == "6 Bulan") {
                    textValue = "Rp 1.800.000";
                  } else {
                    textValue = "Rp 3.500.000";
                  }
                  return ListTile(
                    title: Text(
                      "Total Tagihan",
                      style: GoogleFonts.poppins(
                        color: neutral8,
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    subtitle: Text(
                      "$textValue / ${value.selectedValue}",
                      style: GoogleFonts.poppins(
                        color: danger5,
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    trailing: TextButton(
                      child: Text(
                        "Pilih",
                        style: GoogleFonts.poppins(
                          color: primary4,
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
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
                            return SizedBox(
                              height: 400,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  sizedBoxHeight(10),
                                  SvgPicture.asset(
                                      "assets/icons/bottom_sheet_drag.svg"),
                                  Expanded(
                                      child: Container(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 25),
                                    width: MediaQuery.of(context).size.width,
                                    child: Consumer<PaymentViewModel>(
                                      builder: (context, viewModel, child) {
                                        return Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                horizontal: 27,
                                              ),
                                              child: Text(
                                                "Pilih Membership",
                                                style: GoogleFonts.poppins(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.w600,
                                                  color: neutral9,
                                                ),
                                              ),
                                            ),
                                            Column(
                                              children: [
                                                RadioListTile(
                                                  activeColor: primary4,
                                                  value: "1 Bulan",
                                                  title: Text("1 Bulan"),
                                                  groupValue: selectedRadio,
                                                  onChanged: (value) =>
                                                      viewModel.setRadio(
                                                    "1 Bulan",
                                                    selectedRadio =
                                                        value.toString(),
                                                  ),
                                                ),
                                                RadioListTile(
                                                  activeColor: primary4,
                                                  value: "3 Bulan",
                                                  title: Text("3 Bulan"),
                                                  groupValue: selectedRadio,
                                                  onChanged: (value) =>
                                                      viewModel.setRadio(
                                                    "3 Bulan",
                                                    selectedRadio =
                                                        value.toString(),
                                                  ),
                                                ),
                                                RadioListTile(
                                                  activeColor: primary4,
                                                  value: "6 Bulan",
                                                  title: Text("6 Bulan"),
                                                  groupValue: selectedRadio,
                                                  onChanged: (value) =>
                                                      viewModel.setRadio(
                                                    "6 Bulan",
                                                    selectedRadio =
                                                        value.toString(),
                                                  ),
                                                ),
                                                RadioListTile(
                                                  activeColor: primary4,
                                                  value: "1 Tahun",
                                                  title: Text("1 Tahun"),
                                                  groupValue: selectedRadio,
                                                  onChanged: (value) =>
                                                      viewModel.setRadio(
                                                    "1 Tahun",
                                                    selectedRadio =
                                                        value.toString(),
                                                  ),
                                                ),
                                              ],
                                            ),
                                            Divider(
                                              thickness: 1,
                                              color: neutral3,
                                            ),
                                            sizedBoxHeight(20),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceEvenly,
                                              children: [
                                                SizedBox(
                                                  width: 150,
                                                  height: 40,
                                                  child: OutlinedButton(
                                                    child: Text(
                                                      "Reset",
                                                      style:
                                                          GoogleFonts.poppins(
                                                        color: primary5,
                                                        fontSize: 12,
                                                        fontWeight:
                                                            FontWeight.w700,
                                                      ),
                                                    ),
                                                    onPressed: () {
                                                      viewModel.setRadio(
                                                          "1 Bulan", "1 Bulan");
                                                      Navigator.pop(context);
                                                    },
                                                    style: OutlinedButton
                                                        .styleFrom(
                                                      side: BorderSide(
                                                        color: primary4,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                SizedBox(
                                                  width: 150,
                                                  height: 40,
                                                  child: ElevatedButton(
                                                    child: Text(
                                                      "Pilih",
                                                      style:
                                                          GoogleFonts.poppins(
                                                        color: Colors.white,
                                                        fontSize: 12,
                                                        fontWeight:
                                                            FontWeight.w700,
                                                      ),
                                                    ),
                                                    onPressed: () {
                                                      Navigator.pop(context);
                                                    },
                                                    style: ElevatedButton
                                                        .styleFrom(
                                                      primary: primary4,
                                                    ),
                                                  ),
                                                )
                                              ],
                                            )
                                          ],
                                        );
                                      },
                                    ),
                                  ))
                                ],
                              ),
                            );
                          },
                        );
                      },
                    ),
                  );
                },
              ),
            ),
            sizedBoxHeight(20),
            Text(
              "Dan nikmati seluruh akses yang kamu dapatkan nantinya.",
              style: GoogleFonts.poppins(
                  color: Colors.white,
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                  fontStyle: FontStyle.italic),
            ),
            sizedBoxHeight(20),
            SizedBox(
              height: 40,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const PaymentCameraScreen(),
                    ),
                  );
                },
                child: Text(
                  "Gabung Sekarang",
                  style: GoogleFonts.poppins(
                    color: Colors.white,
                    fontSize: 14,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  primary: primary4,
                ),
              ),
            ),
            sizedBoxHeight(20),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: neutral1,
              ),
              padding: EdgeInsets.all(10),
              child: Column(
                children: [
                  sizedBoxHeight(10),
                  Text(
                    "Keuntungan",
                    style: GoogleFonts.poppins(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  sizedBoxHeight(20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Column(
                        children: [
                          SvgPicture.asset(
                            "assets/icons/icon_payment_1.svg",
                            width: 52,
                            height: 48,
                          ),
                          Text(
                            "Akses Semua Fitur",
                            style: GoogleFonts.poppins(
                              fontSize: 10,
                              fontWeight: FontWeight.w400,
                              color: neutral8,
                            ),
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          SvgPicture.asset(
                            "assets/icons/icon_payment_2.svg",
                            width: 52,
                            height: 48,
                          ),
                          Text(
                            "Akses Semua Kelas",
                            style: GoogleFonts.poppins(
                              fontSize: 10,
                              fontWeight: FontWeight.w400,
                              color: neutral8,
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                  sizedBoxHeight(20),
                  Text(
                    "Cara Kerja Membership",
                    style: GoogleFonts.poppins(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  sizedBoxHeight(30),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "1. Gabung Membership dalam beberapa menit",
                        style: GoogleFonts.poppins(
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      Text(
                        "Dengan mengirim struk bukti pembayaran ke Admin",
                        style: GoogleFonts.poppins(
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                          color: const Color(0xFF737373),
                        ),
                      ),
                      Text(
                        "2. Bayar Membership",
                        style: GoogleFonts.poppins(
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      Text(
                        "Lakukan pembayaran melalui no rekening Admin “Fitness Gym” yaitu  No. Rek : 000 111 222 333 444 A.N : Admin Operasional",
                        style: GoogleFonts.poppins(
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                          color: const Color(0xFF737373),
                        ),
                      ),
                      Text(
                        "3. Buat pesanan kelas di aplikasi Fitness Gym",
                        style: GoogleFonts.poppins(
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      Text(
                        "Ketika kamu sudah mendaftar maka kamu bebas mengakses seluruh fitur yang ada di aplikasi “Fitness Gym”",
                        style: GoogleFonts.poppins(
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                          color: const Color(0xFF737373),
                        ),
                      ),
                    ],
                  ),
                  sizedBoxHeight(9),
                  RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(
                      text:
                          "Dengan klik “Gabung Sekarang”, kamu setuju dengan ",
                      style: GoogleFonts.poppins(
                        textStyle: TextStyle(
                          fontSize: 12,
                          color: neutral4,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      children: [
                        TextSpan(
                          text: "Syarat dan Ketentuan ",
                          style: GoogleFonts.poppins(
                            textStyle: TextStyle(
                              fontWeight: FontWeight.w700,
                              fontSize: 12,
                              color: info7,
                            ),
                          ),
                          recognizer: TapGestureRecognizer()..onTap = () {},
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
