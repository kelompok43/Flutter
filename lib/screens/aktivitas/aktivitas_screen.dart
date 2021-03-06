import 'package:fitness_gym/utils/constants.dart';
import 'package:fitness_gym/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class AktivitasScreen extends StatelessWidget {
  const AktivitasScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Aktivitas Kelas"),
        backgroundColor: neutral9,
      ),
      body: DefaultTabController(
        initialIndex: 0,
        length: 2,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TabBar(
              indicatorColor: primary5,
              unselectedLabelColor: neutral9,
              labelColor: neutral9,
              tabs: const [
                Tab(
                  text: "Aktivitas Kelas",
                ),
                Tab(
                  text: "Selesai",
                ),
              ],
            ),
            Expanded(
              child: TabBarView(
                children: [
                  Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(
                            top: 15,
                            left: 15,
                            right: 15,
                          ),
                          child: Text(
                            "Aktivitas Hari Ini",
                            style: GoogleFonts.poppins(
                              textStyle: const TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.w600),
                            ),
                          ),
                        ),
                        Expanded(
                          child: ListView(
                            children: [Container()],
                          ),
                        )
                      ]),
                  Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          margin: const EdgeInsets.only(top: 10),
                          color: Colors.white,
                          height: 54,
                          child: Row(
                            children: [
                              Expanded(
                                child: TextButton(
                                  onPressed: () {},
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      SvgPicture.asset(
                                          'assets/icons/urutkan.svg'),
                                      sizedBoxWidth(5),
                                      Text(
                                        'Urutkan',
                                        style: TextStyle(color: primary6),
                                      ),
                                    ],
                                  ),
                                  style:
                                      TextButton.styleFrom(primary: primary6),
                                ),
                              ),
                              VerticalDivider(
                                thickness: 1,
                                width: 20,
                                indent: 5,
                                endIndent: 5,
                                color: neutral3,
                              ),
                              Expanded(
                                child: TextButton(
                                  onPressed: () {},
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      SvgPicture.asset(
                                          'assets/icons/system-uicons_filtering.svg'),
                                      sizedBoxWidth(5),
                                      Text(
                                        'Filter',
                                        style: TextStyle(color: primary6),
                                      ),
                                    ],
                                  ),
                                  style:
                                      TextButton.styleFrom(primary: primary6),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                            top: 15,
                            left: 15,
                            right: 15,
                          ),
                          child: Text(
                            "Aktivitas Selesai",
                            style: GoogleFonts.poppins(
                              textStyle: const TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.w600),
                            ),
                          ),
                        ),
                        Expanded(
                          child: ListView(
                            padding: const EdgeInsets.symmetric(vertical: 20),
                            children: [
                              buildAktivitasCard(),
                              buildAktivitasCard(),
                              buildAktivitasCard(),
                            ],
                          ),
                        )
                      ]),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget buildAktivitasCard() {
    return Container(
      margin: const EdgeInsets.symmetric(
        vertical: 10,
        horizontal: 16,
      ),
      decoration: const BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Color.fromARGB(25, 0, 0, 0),
            blurRadius: 20,
          )
        ],
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
      padding: const EdgeInsets.all(15),
      child: Row(
        children: [
          Container(
            height: 50,
            width: 50,
            decoration: BoxDecoration(
                color: Colors.amber,
                borderRadius: BorderRadius.circular(5),
                image: const DecorationImage(
                    image: AssetImage("assets/img/cycling.png"),
                    fit: BoxFit.cover)),
            child: const SizedBox(),
          ),
          sizedBoxWidth(15),
          Expanded(
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Text("Cycling"),
                    Text("07.00 - 08.00 WIB"),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text("Ruangan 1"),
                    Expanded(
                        child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        SizedBox(
                          height: 20,
                          width: 20,
                          child: CircleAvatar(
                            child: Image.asset("assets/img/img.png"),
                          ),
                        ),
                        sizedBoxWidth(5),
                        const Text("Peter"),
                      ],
                    ))
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
