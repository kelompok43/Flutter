import 'package:fitness_gym/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class KelasOfflineStrength extends StatelessWidget {
  const KelasOfflineStrength({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            backgroundColor: neutral9,
            expandedHeight: 300,
            flexibleSpace: SafeArea(
              child: Stack(
                children: [
                  SizedBox(
                    height: 300,
                    child: Image.asset(
                      "assets/img/strength_n_conditions.png",
                      fit: BoxFit.cover,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 55, top: 15),
                    child: SizedBox(
                      child: Text(
                        "Kelas Strenth & Conditions",
                        style: GoogleFonts.poppins(
                          textStyle: const TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.w600),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
