import 'package:fitness_gym/screens/dashboard/dashboard_view_model.dart';
import 'package:fitness_gym/utils/constants.dart';
import 'package:fitness_gym/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class AkunScreen extends StatelessWidget {
  const AkunScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final viewModel = Provider.of<DashboardViewModel>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Akun Saya",
          style: GoogleFonts.poppins(
            textStyle: const TextStyle(fontSize: 16,fontWeight: FontWeight.w600,),
          ),
        ),
        backgroundColor: neutral9,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ListTile(
            leading: CircleAvatar(
              backgroundColor: primary5,
            ),
            title: Text(
              "Ulil Ambri",
              style: GoogleFonts.poppins(
                textStyle: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: neutral9,
                ),
              ),
            ),
            subtitle: Text(
              "+628123456789",
              style: GoogleFonts.poppins(
                textStyle: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color: neutral7,
                ),
              ),
            ),
            trailing: IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.mode_edit_outlined,
                color: primary4,
              ),
            ),
          ),
          Divider(
            height: 0,
            color: neutral3,
          ),
          sizedBoxHeight(20),
          Padding(
            padding: const EdgeInsets.only(left: 16),
            child: Text(
              "Informasi Lain",
              style: GoogleFonts.poppins(
                textStyle: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: neutral9,
                ),
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                children: [
                  sizedBoxHeight(10),
                  Container(
                    color: Colors.white,
                    child: Table(
                      border: TableBorder.all(
                          color: neutral3,
                          borderRadius: BorderRadius.circular(5)),
                      children: [
                        TableRow(
                          children: [
                            ListTile(
                              leading: const Text("Membership"),
                              trailing: Icon(
                                Icons.arrow_forward_ios,
                                color: primary4,
                              ),
                              onTap: () {},
                            ),
                          ],
                        ),
                        TableRow(
                          children: [
                            ListTile(
                              leading: const Text("Membership"),
                              trailing: Icon(
                                Icons.arrow_forward_ios,
                                color: primary4,
                              ),
                              onTap: () {},
                            ),
                          ],
                        ),
                        TableRow(
                          children: [
                            ListTile(
                              leading: const Text("Membership"),
                              trailing: Icon(
                                Icons.arrow_forward_ios,
                                color: primary4,
                              ),
                              onTap: () {},
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                  sizedBoxHeight(30),
                  Text(
                    "Versi Aplikasi : 1.1.1",
                    style: GoogleFonts.poppins(
                        color: neutral3,
                        fontSize: 14,
                        fontWeight: FontWeight.w400),
                  ),
                  sizedBoxHeight(30),
                  SizedBox(
                    height: 40,
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () async {
                        viewModel.logout(context);
                      },
                      child: Text(
                        "Keluar",
                        style: GoogleFonts.poppins(
                            textStyle: TextStyle(
                                color: danger4,
                                fontSize: 14,
                                fontWeight: FontWeight.w700)),
                      ),
                      style: ElevatedButton.styleFrom(
                        primary: Colors.white,
                        side: BorderSide(
                          color: danger4,
                          width: 2,
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
