import 'package:fitness_gym/screens/membership/membership_view_model.dart';
import 'package:fitness_gym/screens/payment/payment_screen.dart';
import 'package:fitness_gym/utils/constants.dart';
import 'package:fitness_gym/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:iconify_flutter/icons/fa_solid.dart';
import 'package:provider/provider.dart';

class MembershipScreen extends StatelessWidget {
  const MembershipScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Membership",
          style: GoogleFonts.poppins(
            fontSize: 16,
            color: Colors.white,
            fontWeight: FontWeight.w600,
          ),
        ),
        backgroundColor: neutral9,
      ),
      body: Consumer<MembershipViewModel>(
        builder: (context, memberViewModel, child) {
          return Column(
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Member ID",
                          style: GoogleFonts.poppins(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: neutral9,
                          ),
                        ),
                        Text(
                          memberViewModel.user.status! == "Bukan Member"
                              ? "-"
                              : memberViewModel.user.id.toString(),
                          style: GoogleFonts.poppins(
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                            color: neutral7,
                          ),
                        )
                      ],
                    ),
                    sizedBoxHeight(20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Membership Status",
                          style: GoogleFonts.poppins(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: neutral9,
                          ),
                        ),
                        memberViewModel.user.status! == "Bukan Member"
                            ? Container(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 10, vertical: 5),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: const Color(0xFFFFF3E2),
                                ),
                                child: Text(
                                  "Belum Membership",
                                  style: GoogleFonts.poppins(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                    color: primary6,
                                  ),
                                ),
                              )
                            : Container(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 10, vertical: 5),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: success1,
                                ),
                                child: Text(
                                  "Member",
                                  style: GoogleFonts.poppins(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                    color: success7,
                                  ),
                                ),
                              )
                      ],
                    ),
                  ],
                ),
              ),
              Divider(
                color: neutral3,
                thickness: 1,
              ),
              Expanded(
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Include In Your Membership",
                        style: GoogleFonts.poppins(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: neutral9,
                        ),
                      ),
                      sizedBoxHeight(8),
                      Row(
                        children: [
                          Icon(
                            Icons.circle,
                            size: 8,
                            color: neutral5,
                          ),
                          sizedBoxWidth(11),
                          Text(
                            "Akses Semua Fitur",
                            style: GoogleFonts.poppins(
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              color: neutral8,
                            ),
                          ),
                        ],
                      ),
                      sizedBoxHeight(8),
                      Row(
                        children: [
                          Icon(
                            Icons.circle,
                            size: 8,
                            color: neutral5,
                          ),
                          sizedBoxWidth(11),
                          Text(
                            "Akses Semua Kelas",
                            style: GoogleFonts.poppins(
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              color: neutral8,
                            ),
                          ),
                        ],
                      ),
                      sizedBoxHeight(54),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const PaymentScreen(),
                              ));
                        },
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 15, vertical: 12),
                          decoration: BoxDecoration(
                              color: const Color(0xFFFFEED0),
                              borderRadius: BorderRadius.circular(5)),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const SizedBox(
                                height: 24,
                                width: 30,
                                child: Iconify(
                                  FaSolid.crown,
                                  color: Color(0xFF806A00),
                                ),
                              ),
                              Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Menjadi Anggota di Fitness Gym",
                                      style: GoogleFonts.poppins(
                                        textStyle: const TextStyle(
                                            color: Color(0xFF806A00),
                                            fontWeight: FontWeight.w600,
                                            fontSize: 14),
                                      ),
                                    ),
                                    Text(
                                      "& buka pengalaman penuh",
                                      style: GoogleFonts.poppins(
                                        textStyle: const TextStyle(
                                            color: Color(0xFF806A00),
                                            fontWeight: FontWeight.w400,
                                            fontSize: 14),
                                      ),
                                    ),
                                  ]),
                              const Icon(
                                Icons.arrow_forward_ios_rounded,
                                color: Color(0xFF806A00),
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
