import 'package:fitness_gym/models/users_model.dart';
import 'package:fitness_gym/screens/akun/membership_screen.dart';
import 'package:fitness_gym/screens/change_password/change_password_screen.dart';
import 'package:fitness_gym/screens/dashboard/dashboard_view_model.dart';
import 'package:fitness_gym/screens/terms_n_conditions/terms_n_conditions.dart';
import 'package:fitness_gym/utils/constants.dart';
import 'package:fitness_gym/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../../models/api/user_api.dart';
import 'edit_akun_screen.dart';

class AkunScreen extends StatefulWidget {
  const AkunScreen({Key? key}) : super(key: key);

  @override
  State<AkunScreen> createState() => _AkunScreenState();
}

class _AkunScreenState extends State<AkunScreen> {
 Future<UsersModel>? model;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance!.addPostFrameCallback((timeStamp) {
      model = UserApi().fetchDataById();
    });
  }

  @override
  Widget build(BuildContext context) {
    final viewModel = Provider.of<DashboardViewModel>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Akun Saya",
          style: GoogleFonts.poppins(
            textStyle: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        backgroundColor: neutral9,
      ),
      body: FutureBuilder(
        future: model,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ListTile(
                  leading: CircleAvatar(
                    backgroundColor: primary5,
                  ),
                  title: Text(
                    "",
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
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const EditAkunScreen(),
                          ));
                    },
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
                                      Icons.arrow_forward_ios_rounded,
                                      color: primary4,
                                      size: 20,
                                    ),
                                    onTap: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                const MembershipScreen(),
                                          ));
                                    },
                                  ),
                                ],
                              ),
                              TableRow(
                                children: [
                                  ListTile(
                                    leading: const Text("Ubah kata sandi"),
                                    trailing: Icon(
                                      Icons.arrow_forward_ios_rounded,
                                      color: primary4,
                                      size: 20,
                                    ),
                                    onTap: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                const ChangePasswordScreen(),
                                          ));
                                    },
                                  ),
                                ],
                              ),
                              TableRow(
                                children: [
                                  ListTile(
                                    leading: const Text("Syarat & Ketentuan"),
                                    trailing: Icon(
                                      Icons.arrow_forward_ios_rounded,
                                      color: primary4,
                                      size: 20,
                                    ),
                                    onTap: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                const TermsAndConditionsScreen(),
                                          ));
                                    },
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
                            onPressed: () {
                              showDialog(
                                  context: context,
                                  builder: (BuildContext context) =>
                                      AlertDialog(
                                        actionsAlignment:
                                            MainAxisAlignment.center,
                                        content: Text(
                                          "Apakah anda yakin ingin keluar ?",
                                          textAlign: TextAlign.center,
                                          style: GoogleFonts.poppins(
                                              textStyle: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w400,
                                            color: neutral8,
                                          )),
                                        ),
                                        alignment: Alignment.center,
                                        actions: [
                                          SizedBox(
                                            width: 130,
                                            child: ElevatedButton(
                                              onPressed: () {
                                                viewModel.logout(context);
                                              },
                                              child: Text(
                                                "Ya",
                                                style: GoogleFonts.poppins(
                                                  textStyle: TextStyle(
                                                      color: primary5,
                                                      fontWeight:
                                                          FontWeight.w700,
                                                      fontSize: 12),
                                                ),
                                              ),
                                              style: ElevatedButton.styleFrom(
                                                primary: Colors.white,
                                                side: BorderSide(
                                                  width: 1,
                                                  color: primary5,
                                                ),
                                              ),
                                            ),
                                          ),
                                          SizedBox(
                                            width: 130,
                                            child: ElevatedButton(
                                              onPressed: () {
                                                Navigator.pop(context);
                                              },
                                              child: Text(
                                                "Batal",
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
                                      ));
                            },
                            child: Text(
                              "Keluar",
                              style: GoogleFonts.poppins(
                                  textStyle: TextStyle(
                                      color: danger5,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w700)),
                            ),
                            style: ElevatedButton.styleFrom(
                              primary: Colors.white,
                              side: BorderSide(
                                color: danger5,
                                width: 1,
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            );
          }
          return Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
