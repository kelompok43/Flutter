import 'package:fitness_gym/utils/constants.dart';
import 'package:flutter/material.dart';
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
              child: Container(
                padding: const EdgeInsets.all(16),
                child: TabBarView(children: [
                  Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Aktivitas Hari Ini",
                          style: GoogleFonts.poppins(
                            textStyle: const TextStyle(
                                fontSize: 16, fontWeight: FontWeight.w600),
                          ),
                        ),
                        ListView(children: [
                          Container()
                        ],)
                      ]),
                  Container(),
                ]),
              ),
            )
          ],
        ),
      ),
    );
  }
}
