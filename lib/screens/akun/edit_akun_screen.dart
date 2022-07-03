import 'package:fitness_gym/utils/constants.dart';
import 'package:fitness_gym/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconify_flutter/icons/heroicons_outline.dart';
import 'package:iconify_flutter/icons/heroicons_solid.dart';
import 'package:iconify_flutter/icons/typcn.dart';
import 'package:intl/intl.dart';
import 'package:iconify_flutter/iconify_flutter.dart';

class EditAkunScreen extends StatefulWidget {
  const EditAkunScreen({Key? key}) : super(key: key);

  @override
  State<EditAkunScreen> createState() => _EditAkunScreenState();
}

class _EditAkunScreenState extends State<EditAkunScreen> {
  TextEditingController namaCtrl = TextEditingController();
  TextEditingController tglLahirCtrl = TextEditingController();
  TextEditingController alamatCtrl = TextEditingController();
  TextEditingController emailCtrl = TextEditingController();
  TextEditingController noTelpCtrl = TextEditingController();
  @override
  void initState() {
    tglLahirCtrl.text = ""; //set the initial value of text field
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    GlobalKey _formKey = GlobalKey<FormState>();
    return Scaffold(
      appBar: AppBar(
          backgroundColor: neutral9,
          title: Text(
            "Ubah Akun",
            style: GoogleFonts.poppins(
              fontSize: 16,
              color: Colors.white,
              fontWeight: FontWeight.w600,
            ),
          )),
      body: ListView(
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
          Form(
            key: _formKey,
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 16,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
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
                    onTap: () async {
                      DateTime? pickedDate = await showDatePicker(
                          context: context,
                          initialDate: DateTime.now(),
                          firstDate: DateTime(
                              1980), //DateTime.now() - not to allow to choose before today.
                          lastDate: DateTime(2030));

                      if (pickedDate != null) {
                        String formattedDate =
                            DateFormat('yyyy-MM-dd').format(pickedDate);

                        setState(() {
                          tglLahirCtrl.text =
                              formattedDate; //set output date to TextField value.
                        });
                      } else {}
                    },
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
                ],
              ),
            ),
          ),
          sizedBoxHeight(30),
          Form(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: Card(
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
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(10),
                            topRight: Radius.circular(10),
                          ),
                        ),
                        context: context,
                        builder: (BuildContext context) {
                          return SizedBox(
                            height: 233,
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 16,
                                vertical: 20,
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
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
                                    width: MediaQuery.of(context).size.width,
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
            ),
          ),
          sizedBoxHeight(30),
          Form(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: Card(
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
                          return SizedBox(
                            height: 233,
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 16,
                                vertical: 20,
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
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
                                    width: MediaQuery.of(context).size.width,
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
            ),
          ),
          sizedBoxHeight(30),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: SizedBox(
              height: 45,
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
                  )),
            ),
          ),
        ],
      ),
    );
  }
}
