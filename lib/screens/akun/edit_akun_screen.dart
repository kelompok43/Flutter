import 'package:fitness_gym/screens/akun/akun_view_model.dart';
import 'package:fitness_gym/widgets/widgets.dart';
import 'package:fitness_gym/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:iconify_flutter/icons/heroicons_solid.dart';
import 'package:iconify_flutter/icons/typcn.dart';
import 'package:provider/provider.dart';

// class EditAkunScreen extends StatelessWidget {
//   const EditAkunScreen({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     final _formKey = GlobalKey<FormState>();
//     TextEditingController tglLahirCtrl = TextEditingController();
//     TextEditingController namaCtrl = TextEditingController();
//     TextEditingController alamatCtrl = TextEditingController();
//     TextEditingController emailCtrl = TextEditingController();
//     TextEditingController noTelpCtrl = TextEditingController();
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: neutral9,
//         title: Text(
//           "Ubah Akun",
//           style: GoogleFonts.poppins(
//             fontSize: 16,
//             fontWeight: FontWeight.w600,
//           ),
//         ),
//       ),
//       body: Container(
//         padding: const EdgeInsets.symmetric(horizontal: 16),
//         child: SingleChildScrollView(
//           child: Form(
//             key: _formKey,
//             child: Column(
//               cros
//               children: [
//                 sizedBoxHeight(30),
//                 Center(
//                   child: Stack(
//                     children: [
//                       Container(
//                         height: 100,
//                         width: 100,
//                         decoration: BoxDecoration(
//                           color: primary1,
//                           shape: BoxShape.circle,
//                         ),
//                         child: Icon(
//                           Icons.person_outline_rounded,
//                           color: primary4,
//                           size: 50,
//                         ),
//                       ),
//                       GestureDetector(
//                         onTap: () {},
//                         child: Container(
//                             width: 30,
//                             height: 30,
//                             margin: const EdgeInsets.only(left: 70, top: 70),
//                             padding: const EdgeInsets.all(5),
//                             decoration: BoxDecoration(
//                               color: primary5,
//                               shape: BoxShape.circle,
//                             ),
//                             child: const Iconify(
//                               Typcn.camera_outline,
//                               color: Colors.white,
//                             )),
//                       )
//                     ],
//                   ),
//                 ),
//                 sizedBoxHeight(30),
//                 Text("Nama Lengkap"),
//                 sizedBoxHeight(5),
//                 TextField(
//                   controller: namaCtrl,
//                 )
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
class EditAkunScreen extends StatelessWidget {
  const EditAkunScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final tglLahirCtrl = TextEditingController();
    final _formKey = GlobalKey<FormState>();
    final namaCtrl = TextEditingController();
    final alamatCtrl = TextEditingController();
    final emailCtrl = TextEditingController();
    final noTelpCtrl = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        foregroundColor: neutral8,
        shadowColor: Colors.black12,
        title: Text(
          "Login",
          style: TextStyle(
            color: neutral9,
            fontSize: 14,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Consumer<AkunViewModel>(
              builder: (context, value, child) => Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  sizedBoxHeight(30),
                  Center(
                    child: Stack(
                      children: [
                        Container(
                          height: 100,
                          width: 100,
                          decoration: BoxDecoration(
                            color: primary1,
                            shape: BoxShape.circle,
                          ),
                          child: Icon(
                            Icons.person_outline_rounded,
                            color: primary4,
                            size: 50,
                          ),
                        ),
                        GestureDetector(
                          onTap: () {},
                          child: Container(
                              width: 30,
                              height: 30,
                              margin: const EdgeInsets.only(left: 70, top: 70),
                              padding: const EdgeInsets.all(5),
                              decoration: BoxDecoration(
                                color: primary5,
                                shape: BoxShape.circle,
                              ),
                              child: const Iconify(
                                Typcn.camera_outline,
                                color: Colors.white,
                              )),
                        )
                      ],
                    ),
                  ),
                  sizedBoxHeight(30),
                  Text(
                    "Nama Lengkap",
                    style: GoogleFonts.poppins(
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                      color: neutral9,
                    ),
                  ),
                  sizedBoxHeight(5),
                  TextFormField(
                    controller: namaCtrl,
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.all(10),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                        color: primary5,
                      )),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: primary3,
                        ),
                      ),
                      hintText: "Nama Lengkap",
                      hintStyle: GoogleFonts.poppins(
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                        color: const Color(0xFF5f5f5f),
                      ),
                    ),
                  ),
                  sizedBoxHeight(30),
                  Text(
                    "Tanggal Lahir",
                    style: GoogleFonts.poppins(
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                      color: neutral9,
                    ),
                  ),
                  sizedBoxHeight(5),
                  TextFormField(
                    onTap: () => value.datePicker(context, tglLahirCtrl),
                    readOnly: true,
                    controller: tglLahirCtrl,
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.all(10),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                        color: primary5,
                      )),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: primary3,
                        ),
                      ),
                      hintText: "Tanggal Lahir",
                      hintStyle: GoogleFonts.poppins(
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                        color: const Color(0xFF5f5f5f),
                      ),
                    ),
                  ),
                  sizedBoxHeight(30),
                  Text(
                    "Alamat",
                    style: GoogleFonts.poppins(
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                      color: neutral9,
                    ),
                  ),
                  sizedBoxHeight(5),
                  TextFormField(
                    controller: alamatCtrl,
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.all(10),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                        color: primary5,
                      )),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: primary3,
                        ),
                      ),
                      hintText: "-",
                      hintStyle: GoogleFonts.poppins(
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                        color: const Color(0xFF5f5f5f),
                      ),
                    ),
                  ),
                  sizedBoxHeight(30),
                  Card(
                    child: ListTile(
                      title: Text(
                        "Email",
                        style: GoogleFonts.poppins(
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                          color: neutral9,
                        ),
                      ),
                      subtitle: Text(
                        "ulilambri9888@gmail.com",
                        style: GoogleFonts.poppins(
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                          color: neutral7,
                        ),
                      ),
                      trailing: IconButton(
                        onPressed: () {
                          showModalBottomSheet<void>(
                            isScrollControlled: true,
                            shape: const RoundedRectangleBorder(
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(10),
                                topRight: Radius.circular(10),
                              ),
                            ),
                            context: context,
                            builder: (BuildContext context) {
                              return SingleChildScrollView(
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 16,
                                    vertical: 20,
                                  ),
                                  child: Padding(
                                    padding: EdgeInsets.only(
                                      bottom: MediaQuery.of(context)
                                          .viewInsets
                                          .bottom,
                                    ),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      children: [
                                        Text(
                                          "Tambahkan Email",
                                          style: GoogleFonts.poppins(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w600,
                                            color: info7,
                                          ),
                                        ),
                                        sizedBoxHeight(19),
                                        Text(
                                          "Email",
                                          style: GoogleFonts.poppins(
                                            fontSize: 12,
                                            fontWeight: FontWeight.w600,
                                            color: neutral9,
                                          ),
                                        ),
                                        sizedBoxHeight(5),
                                        TextFormField(
                                          controller: emailCtrl,
                                          decoration: InputDecoration(
                                            contentPadding:
                                                const EdgeInsets.all(10),
                                            focusedBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                              color: primary5,
                                            )),
                                            enabledBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                color: primary3,
                                              ),
                                            ),
                                            hintText: "user@gmail.com",
                                            hintStyle: GoogleFonts.poppins(
                                              fontSize: 12,
                                              fontWeight: FontWeight.w600,
                                              color: const Color(0xFF5f5f5f),
                                            ),
                                          ),
                                        ),
                                        sizedBoxHeight(30),
                                        SizedBox(
                                          width:
                                              MediaQuery.of(context).size.width,
                                          height: 45,
                                          child: ElevatedButton(
                                            onPressed: () {},
                                            child: Text(
                                              "Simpan",
                                              style: GoogleFonts.poppins(
                                                fontSize: 14,
                                                fontWeight: FontWeight.w700,
                                              ),
                                            ),
                                            style: ElevatedButton.styleFrom(
                                                primary: primary4),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              );
                            },
                          );
                        },
                        icon: Iconify(
                          HeroiconsSolid.pencil_alt,
                          color: primary4,
                        ),
                      ),
                    ),
                  ),
                  sizedBoxHeight(30),
                  Card(
                    child: ListTile(
                      title: Text(
                        "No Telepon",
                        style: GoogleFonts.poppins(
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                          color: neutral9,
                        ),
                      ),
                      subtitle: Text(
                        "-",
                        style: GoogleFonts.poppins(
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                          color: neutral7,
                        ),
                      ),
                      trailing: IconButton(
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
                              return SingleChildScrollView(
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 16,
                                    vertical: 20,
                                  ),
                                  child: Padding(
                                    padding: EdgeInsets.only(
                                      bottom: MediaQuery.of(context)
                                          .viewInsets
                                          .bottom,
                                    ),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      children: [
                                        Text(
                                          "Tambahkan Nomor Telepon",
                                          style: GoogleFonts.poppins(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w600,
                                            color: info7,
                                          ),
                                        ),
                                        sizedBoxHeight(19),
                                        Text(
                                          "Nomor Telepon",
                                          style: GoogleFonts.poppins(
                                            fontSize: 12,
                                            fontWeight: FontWeight.w600,
                                            color: neutral9,
                                          ),
                                        ),
                                        sizedBoxHeight(5),
                                        TextFormField(
                                          controller: noTelpCtrl,
                                          decoration: InputDecoration(
                                            contentPadding:
                                                const EdgeInsets.all(10),
                                            focusedBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                              color: primary5,
                                            )),
                                            enabledBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                color: primary3,
                                              ),
                                            ),
                                            hintText: "081234567890",
                                            hintStyle: GoogleFonts.poppins(
                                              fontSize: 12,
                                              fontWeight: FontWeight.w600,
                                              color: const Color(0xFF5f5f5f),
                                            ),
                                          ),
                                        ),
                                        sizedBoxHeight(30),
                                        SizedBox(
                                          width:
                                              MediaQuery.of(context).size.width,
                                          height: 45,
                                          child: ElevatedButton(
                                            onPressed: () {},
                                            child: Text(
                                              "Simpan",
                                              style: GoogleFonts.poppins(
                                                fontSize: 14,
                                                fontWeight: FontWeight.w700,
                                              ),
                                            ),
                                            style: ElevatedButton.styleFrom(
                                                primary: primary4),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              );
                            },
                          );
                        },
                        icon: Iconify(
                          HeroiconsSolid.pencil_alt,
                          color: primary4,
                        ),
                      ),
                    ),
                  ),
                  sizedBoxHeight(30),
                  SizedBox(
                    height: 45,
                    width: MediaQuery.of(context).size.width,
                    child: ElevatedButton(
                      onPressed: () {},
                      child: Text(
                        "SIMPAN",
                        style: GoogleFonts.poppins(
                          fontSize: 16,
                          color: Colors.white,
                        ),
                      ),
                      style: ElevatedButton.styleFrom(
                        primary: primary4,
                      ),
                    ),
                  ),
                  sizedBoxHeight(20),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
