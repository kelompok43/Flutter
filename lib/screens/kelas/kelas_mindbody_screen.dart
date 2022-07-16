import 'package:fitness_gym/screens/kelas_offline/pesan_kelas_screen.dart';
import 'package:fitness_gym/utils/constants.dart';
import 'package:fitness_gym/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class KelasMindBody extends StatefulWidget {
  const KelasMindBody({Key? key}) : super(key: key);

  @override
  State<KelasMindBody> createState() => _KelasMindBodyState();
}

class _KelasMindBodyState extends State<KelasMindBody>
    with SingleTickerProviderStateMixin {
  final List<Tab> myTabs = List.generate(7, (index) {
    var now = DateTime.now().toLocal();
    var date = DateTime(now.year, now.month, now.day + index);
    String dateDisplay = DateFormat('E d MMM', 'id_ID').format(date);
    return Tab(text: dateDisplay);
  });
  late TabController _tabController;

  @override
  void initState() {
    _tabController = TabController(vsync: this, length: myTabs.length);
    super.initState();
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    const String assetImage = "assets/img/mind_n_body.png";
    var date = DateTime.now();
    var dateFormat = DateFormat('EEEE, d MMMM', 'id_ID').format(date);
    return Scaffold(
      // appBar: AppBar(
      //   backgroundColor:neutral9,
      //   title: Text("Kelas Cycling",style: GoogleFonts.poppins(textStyle: TextStyle()),),
      //   bottom: TabBar(
      //     controller: _tabController,
      //     tabs: myTabs,
      //     isScrollable: true,
      //   ),
      // ),
      // body: TabBarView(
      //   controller: _tabController,
      //   children: myTabs.map((Tab tab) {
      //     // final String? label = tab.text?.toLowerCase();
      //     return Center(
      //       child: Container(),
      //     );
      //   }).toList(),
      // ),

      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            pinned: true,
            backgroundColor: neutral9,
            expandedHeight: 300,
            bottom: AppBar(
              backgroundColor: Colors.white,
              automaticallyImplyLeading: false,
              flexibleSpace: TabBar(
                controller: _tabController,
                isScrollable: true,
                tabs: myTabs,
                labelColor: neutral9,
                indicatorColor: primary5,
                indicatorSize: TabBarIndicatorSize.label,
              ),
            ),
            //
            flexibleSpace: Stack(
              children: [
                SizedBox(
                  height: 300,
                  width: MediaQuery.of(context).size.width,
                  child: Image.asset(
                    assetImage,
                    fit: BoxFit.cover,
                  ),
                ),
                SafeArea(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 55, top: 15),
                    child: SizedBox(
                      child: Text(
                        "Kelas Cardio",
                        style: GoogleFonts.poppins(
                          textStyle: const TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.w600),
                        ),
                      ),
                    ),
                  ),
                ),
                // Column(
                //   mainAxisAlignment: MainAxisAlignment.end,
                //   children: [
                //     BottomAppBar(
                //       elevation: 0,
                //       child: TabBar(
                //         controller: _tabController,
                //         isScrollable: true,
                //         tabs: myTabs,
                //         labelColor: neutral9,
                //         indicatorColor: primary5,
                //       ),
                //     ),
                //   ],
                // ),
              ],
            ),
          ),
          SliverToBoxAdapter(
            child: SizedBox(
              height: 800,
              width: MediaQuery.of(context).size.width,
              child: TabBarView(
                controller: _tabController,
                children: myTabs.map((Tab tab) {
                  // final String? label = tab.text?.toLowerCase();
                  return Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 16, vertical: 30),
                    child: Column(
                      // padding: const EdgeInsets.symmetric(
                      //     horizontal: 16, vertical: 30),
                      children: [
                        Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5),
                          ),
                          elevation: 20,
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 10,
                              vertical: 10,
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(dateFormat),
                                    SizedBox(
                                      height: 30,
                                      width: 127,
                                      child: ElevatedButton(
                                        onPressed: () {},
                                        child: Text(
                                          "Kelas Penuh",
                                          style: GoogleFonts.poppins(
                                            textStyle: TextStyle(
                                              fontSize: 14,
                                              fontWeight: FontWeight.w600,
                                              color: primary5,
                                            ),
                                          ),
                                        ),
                                        style: ElevatedButton.styleFrom(
                                            primary: const Color(0xFFFFF3E2)),
                                      ),
                                    ),
                                  ],
                                ),
                                Text(
                                  "07.00 - 08.00",
                                  style: GoogleFonts.poppins(
                                      textStyle: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w600,
                                    color: neutral6,
                                  )),
                                ),
                                sizedBoxHeight(16.5),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "Kelas Cardio",
                                      style: GoogleFonts.poppins(
                                          textStyle: TextStyle(
                                        fontSize: 14,
                                        color: neutral9,
                                        fontWeight: FontWeight.w600,
                                      )),
                                    ),
                                    Text(
                                      "Ruangan 1",
                                      style: GoogleFonts.poppins(
                                        textStyle: TextStyle(
                                          fontSize: 14,
                                          color: neutral9,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                                sizedBoxHeight(10),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(30),
                                      child: SizedBox(
                                          height: 20,
                                          width: 20,
                                          child: Image.asset(
                                              "assets/img/img.png")),
                                    ),
                                    sizedBoxWidth(5),
                                    Text(
                                      "Peter",
                                      style: GoogleFonts.poppins(
                                          textStyle: TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.w600,
                                        color: neutral5,
                                      )),
                                    ),
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.end,
                                        children: [
                                          Text(
                                            "Tidak Bisa Memesan",
                                            style: GoogleFonts.poppins(
                                              textStyle: TextStyle(
                                                fontSize: 12,
                                                fontWeight: FontWeight.w600,
                                                color: neutral5,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                        Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5),
                          ),
                          elevation: 20,
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 10,
                              vertical: 10,
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(dateFormat),
                                    SizedBox(
                                      height: 30,
                                      width: 127,
                                      child: ElevatedButton(
                                        onPressed: () {
                                          // Navigator.push(
                                          //     context,
                                          //     MaterialPageRoute(
                                          //       builder: (context) =>
                                          //           const PesanKelasScreen(),
                                          //     ));
                                        },
                                        child: Text(
                                          "Pesan",
                                          style: GoogleFonts.poppins(
                                            textStyle: TextStyle(
                                              fontSize: 14,
                                              fontWeight: FontWeight.w600,
                                              color: info7,
                                            ),
                                          ),
                                        ),
                                        style: ElevatedButton.styleFrom(
                                          primary: info1,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                Text(
                                  "07.00 - 08.00",
                                  style: GoogleFonts.poppins(
                                      textStyle: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w600,
                                    color: neutral6,
                                  )),
                                ),
                                sizedBoxHeight(16.5),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "Kelas Cardio",
                                      style: GoogleFonts.poppins(
                                          textStyle: TextStyle(
                                        fontSize: 14,
                                        color: neutral9,
                                        fontWeight: FontWeight.w600,
                                      )),
                                    ),
                                    Text(
                                      "Ruangan 1",
                                      style: GoogleFonts.poppins(
                                        textStyle: TextStyle(
                                          fontSize: 14,
                                          color: neutral9,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                                sizedBoxHeight(10),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(30),
                                      child: SizedBox(
                                          height: 20,
                                          width: 20,
                                          child: Image.asset(
                                              "assets/img/img.png")),
                                    ),
                                    sizedBoxWidth(5),
                                    Text(
                                      "Peter",
                                      style: GoogleFonts.poppins(
                                          textStyle: TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.w600,
                                        color: neutral5,
                                      )),
                                    ),
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.end,
                                        children: [
                                          Text(
                                            "17/30",
                                            style: GoogleFonts.poppins(
                                              textStyle: TextStyle(
                                                fontSize: 12,
                                                fontWeight: FontWeight.w600,
                                                color: neutral5,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                        Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5),
                          ),
                          elevation: 20,
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 10,
                              vertical: 10,
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(dateFormat),
                                    SizedBox(
                                      height: 30,
                                      width: 127,
                                      child: ElevatedButton(
                                        onPressed: () {},
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            SizedBox(
                                                width: 20,
                                                height: 18,
                                                child: SvgPicture.asset(
                                                    "assets/icons/crown.svg")),
                                            Text(
                                              "Upgrade",
                                              style: GoogleFonts.poppins(
                                                  textStyle: const TextStyle(
                                                fontSize: 14,
                                                fontWeight: FontWeight.w600,
                                                color: Color(0xFF806A00),
                                              )),
                                            )
                                          ],
                                        ),
                                        style: ElevatedButton.styleFrom(
                                          primary: const Color(0xFFFFFADF),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                Text(
                                  "07.00 - 08.00",
                                  style: GoogleFonts.poppins(
                                      textStyle: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w600,
                                    color: neutral6,
                                  )),
                                ),
                                sizedBoxHeight(16.5),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "Kelas Cardio",
                                      style: GoogleFonts.poppins(
                                          textStyle: TextStyle(
                                        fontSize: 14,
                                        color: neutral9,
                                        fontWeight: FontWeight.w600,
                                      )),
                                    ),
                                    Text(
                                      "Ruangan 1",
                                      style: GoogleFonts.poppins(
                                        textStyle: TextStyle(
                                          fontSize: 14,
                                          color: neutral9,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                                sizedBoxHeight(10),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(30),
                                      child: SizedBox(
                                          height: 20,
                                          width: 20,
                                          child: Image.asset(
                                              "assets/img/img.png")),
                                    ),
                                    sizedBoxWidth(5),
                                    Text(
                                      "Peter",
                                      style: GoogleFonts.poppins(
                                          textStyle: TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.w600,
                                        color: neutral5,
                                      )),
                                    ),
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.end,
                                        children: [
                                          Text(
                                            "17/30",
                                            style: GoogleFonts.poppins(
                                              textStyle: TextStyle(
                                                fontSize: 12,
                                                fontWeight: FontWeight.w600,
                                                color: neutral5,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                }).toList(),
              ),
            ),
          )
        ],
      ),
    );
  }
}
