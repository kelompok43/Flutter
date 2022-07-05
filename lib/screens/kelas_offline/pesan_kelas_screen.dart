import 'package:fitness_gym/utils/constants.dart';
import 'package:fitness_gym/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class PesanKelasScreen extends StatelessWidget {
  const PesanKelasScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool checked = false;
    var date = DateTime.now();
    var dateFormat = DateFormat('EEEE, d MMMM', 'id_ID').format(date);
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 300,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/img/cycling.png"),
                  fit: BoxFit.cover,
                ),
              ),
              child: Stack(
                children: [
                  SafeArea(
                    child: Row(
                      children: [
                        IconButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          icon:
                              const Icon(Icons.arrow_back, color: Colors.white),
                        ),
                        Text(
                          "Detail Kelas",
                          style: GoogleFonts.poppins(
                            textStyle: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        Expanded(
                            child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            IconButton(
                              onPressed: () {
                                showDialog(
                                  context: context,
                                  builder: (BuildContext context) =>
                                      AlertDialog(
                                    title: Text(
                                      "Atur Pemberitahuan",
                                      style: GoogleFonts.poppins(
                                        textStyle: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w600,
                                          color: neutral9,
                                        ),
                                      ),
                                    ),
                                    actionsAlignment: MainAxisAlignment.center,
                                    content: SizedBox(
                                      height: 80,
                                      child: Column(
                                        children: [
                                          Row(
                                            children: [
                                              SvgPicture.asset(
                                                  "assets/icons/pepicons_stopwatch.svg"),
                                              sizedBoxWidth(13),
                                              Text(
                                                "15 Menit",
                                                style: GoogleFonts.poppins(
                                                  textStyle: TextStyle(
                                                    fontSize: 16,
                                                    fontWeight: FontWeight.w400,
                                                    color: neutral7,
                                                  ),
                                                ),
                                              ),
                                              Expanded(
                                                  child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.end,
                                                children: [
                                                  Icon(Icons.add_box),
                                                ],
                                              )),
                                            ],
                                          ),
                                          Row(
                                            children: [
                                              SvgPicture.asset(
                                                  "assets/icons/pepicons_stopwatch(1).svg"),
                                              sizedBoxWidth(13),
                                              Text(
                                                "30 Menit",
                                                style: GoogleFonts.poppins(
                                                  textStyle: TextStyle(
                                                    fontSize: 16,
                                                    fontWeight: FontWeight.w400,
                                                    color: neutral7,
                                                  ),
                                                ),
                                              ),
                                              Expanded(
                                                  child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.end,
                                                children: [
                                                  Icon(Icons.add_box),
                                                ],
                                              )),
                                            ],
                                          ),
                                          Row(
                                            children: [
                                              SvgPicture.asset(
                                                  "assets/icons/pepicons_stopwatch(2).svg"),
                                              sizedBoxWidth(13),
                                              Text(
                                                "Dimulai",
                                                style: GoogleFonts.poppins(
                                                  textStyle: TextStyle(
                                                    fontSize: 16,
                                                    fontWeight: FontWeight.w400,
                                                    color: neutral7,
                                                  ),
                                                ),
                                              ),
                                              Expanded(
                                                  child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.end,
                                                children: [
                                                  Icon(Icons.add_box),
                                                ],
                                              )),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                    actions: [
                                      SizedBox(
                                        width: 130,
                                        child: ElevatedButton(
                                          onPressed: () {
                                            Navigator.pop(context);
                                          },
                                          child: Text(
                                            "Batal",
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
                                              width: 2,
                                              color: primary5,
                                            ),
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        width: 130,
                                        child: ElevatedButton(
                                          onPressed: () {},
                                          child: Text(
                                            "Simpan",
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
                                      )
                                    ],
                                  ),
                                );
                              },
                              icon: const Icon(
                                Icons.notification_add,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ))
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            SizedBox(
                              width: 128,
                              height: 40,
                              child: ElevatedButton(
                                child: Text("Pesan",
                                    style: GoogleFonts.poppins(
                                      textStyle: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w600,
                                        color: info7,
                                      ),
                                    )),
                                onPressed: () {},
                                style: ElevatedButton.styleFrom(
                                  primary: info1,
                                ),
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Cycling",
                    style: GoogleFonts.poppins(
                        textStyle: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: neutral9,
                    )),
                  ),
                  sizedBoxHeight(10),
                  Text(
                    dateFormat + " 07.00 - 08.00",
                    style: GoogleFonts.poppins(
                        textStyle: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                      color: neutral6,
                    )),
                  ),
                  sizedBoxHeight(5),
                  Row(
                    children: [
                      SizedBox(
                        width: MediaQuery.of(context).size.width - 90,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Ruangan 01",
                              style: GoogleFonts.poppins(
                                  textStyle: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                                color: neutral8,
                              )),
                            ),
                            Text(
                              "Supermal Pakuwon Indah, 1st Floor Jl. Puncak Indah Lontar 2, 60216, Surabaya",
                              style: GoogleFonts.nunitoSans(
                                fontSize: 12,
                                fontWeight: FontWeight.w700,
                                color: secondary3,
                              ),
                            ),
                          ],
                        ),
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.keyboard_arrow_right),
                        iconSize: 40,
                      ),
                    ],
                  ),
                  sizedBoxHeight(20),
                  Row(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(30),
                        child: SizedBox(
                          height: 20,
                          width: 20,
                          child: Image.asset("assets/img/img.png"),
                        ),
                      ),
                      sizedBoxWidth(5),
                      Text(
                        "Peter",
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                          color: neutral5,
                        ),
                      )
                    ],
                  ),
                  sizedBoxHeight(10),
                  Divider(
                    thickness: 1,
                    color: neutral3,
                  ),
                  sizedBoxHeight(10),
                  Text(
                    "Fill the burn of a 3-part spin workout and explore different terrains without even leaving the gym",
                    style: GoogleFonts.nunitoSans(
                      textStyle: TextStyle(
                        fontWeight: FontWeight.w700,
                        color: secondary3,
                        fontSize: 12,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
              child: SizedBox(
                height: 40,
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {},
                  child: Text(
                    "Kembali Ke Beranda",
                    style: GoogleFonts.poppins(
                        textStyle: TextStyle(
                            color: primary5,
                            fontSize: 14,
                            fontWeight: FontWeight.w700)),
                  ),
                  style: ElevatedButton.styleFrom(
                    primary: Colors.white,
                    side: BorderSide(
                      color: primary4,
                      width: 2,
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
              child: SizedBox(
                height: 40,
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {},
                  child: Text(
                    "Pesan Kelas",
                    style: GoogleFonts.poppins(
                        textStyle: const TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                            fontWeight: FontWeight.w700)),
                  ),
                  style: ElevatedButton.styleFrom(
                    primary: primary4,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
