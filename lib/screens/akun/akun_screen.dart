import 'package:fitness_gym/screens/akun/akun_view_model.dart';
import 'package:fitness_gym/utils/constants.dart';
import 'package:fitness_gym/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class AkunScreen extends StatelessWidget {
  const AkunScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final viewModel = Provider.of<AkunViewModel>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("Akun Saya",
            style:
                GoogleFonts.poppins(textStyle: const TextStyle(fontSize: 14))),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(30),
                  child: SizedBox(
                    height: 50,
                    width: 50,
                    child: Image.asset("assets/img/img.png"),
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Ulil Ambri",
                      style: GoogleFonts.poppins(
                        textStyle: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: neutral9,
                        ),
                      ),
                    ),
                    Text(
                      "+628123456789",
                      style: GoogleFonts.poppins(
                          textStyle: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: neutral7,
                      )),
                    )
                  ],
                ),
                IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.mode_outlined,
                      color: primary4,
                    ))
              ],
            ),
            sizedBoxHeight(20),
            ElevatedButton(
                onPressed: () async {
                  viewModel.logout(context);
                },
                child: const Text("Log Out"))
          ],
        ),
      ),
    );
  }
}
