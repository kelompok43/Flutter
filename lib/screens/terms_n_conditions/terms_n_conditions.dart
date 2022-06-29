import 'package:fitness_gym/utils/constants.dart';
import 'package:fitness_gym/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class TermsAndConditionsScreen extends StatelessWidget {
  const TermsAndConditionsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: neutral9,
        title: Text(
          "Syarat & Ketentuan",
          style: GoogleFonts.poppins(
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: Stack(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: 382,
            decoration: BoxDecoration(
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.elliptical(400, 70),
                  bottomRight: Radius.elliptical(400, 70),
                ),
                color: primary4),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 16, top: 24, right: 40),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  height: 48,
                  width: 80,
                  child: SvgPicture.asset("assets/img/logo.svg"),
                ),
                Text(
                  "TERMS AND CONDITIONS",
                  style: GoogleFonts.poppins(
                    fontSize: 16,
                    fontStyle: FontStyle.italic,
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 96, left: 16, right: 16),
            child: Card(
              child: Container(
                padding: const EdgeInsets.all(16),
                child: ListView(
                  children: [
                    Text(
                      "Syarat dan Ketentuan Pengguna Aplikasi Seluler Fitness Gym",
                      style: GoogleFonts.poppins(
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                        color: neutral8,
                      ),
                    ),
                    sizedBoxHeight(35),
                    Text(
                      "Diperbarui pada: 28 Apr 2020",
                      style: GoogleFonts.poppins(
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        color: neutral8,
                      ),
                    ),
                    sizedBoxHeight(35),
                    Text(
                      "Syarat dan Ketentuan Pengguna Aplikasi ini (\"Ketentuan\") dan Kebijakan Privasi mengatur penggunaan Anda atasaplikasi dan layanan yang disediakan oleh salah satu penyedia layanan kebugarandan kesehatan tergantung pada keanggotaan Anda atau tergantung pada klub Anda (jikaAnda bukan Anggota), PT. Exertainment Indonesia (Celebrity Fitness) atau PT. Fitness First Indonesia (FitnessFirst) (adalah\"kami\") (atau secara kolektif, \"Aplikasi\")\.",
                      style: GoogleFonts.poppins(
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        color: neutral8,
                      ),
                    ),
                    sizedBoxHeight(35),
                    Text(
                      "Kami memiliki dan mengoperasikan merek dagang/jasa pusatkebugaran yang dikenal sebagai \"Fitness First\" dan \"CelebrityFitness\", dengan klub yang berlokasi di berbagai lokasi yang berbeda-beda.",
                      style: GoogleFonts.poppins(
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        color: neutral8,
                      ),
                    ),
                    sizedBoxHeight(35),
                    Text(
                      "DENGAN MENGGUNAKAN APLIKASI, ANDA SETUJU UNTUK TERIKAT OLEH KETENTUAN. JIKA ANDA TIDAKMENYETUJUI PERSYARATAN, MOHON JANGAN GUNAKAN APLIKASI INI.",
                      style: GoogleFonts.poppins(
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        color: neutral8,
                      ),
                    ),
                    sizedBoxHeight(50),
                    Text(
                      "1. PENJELASAN",
                      style: GoogleFonts.poppins(
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                        color: neutral8,
                      ),
                    ),
                    sizedBoxHeight(35),
                    Text(
                      "“Klub” berarti klub kesehatan dankebugaran atau gym yang dioperasikan oleh kami di bawah merek FitnessFirst atau merek Celebrity Fitness atau di bawah kedua merek tersebut jika Andaadalah anggota dual brand. ",
                      style: GoogleFonts.poppins(
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        color: neutral8,
                      ),
                    ),
                    sizedBoxHeight(35),
                    Text(
                      "“Anggota” berarti anggota dari salahsatu Klub.",
                      style: GoogleFonts.poppins(
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        color: neutral8,
                      ),
                    ),
                    sizedBoxHeight(35),
                    Text(
                      "“Pengguna” berarti seseorang yangmenggunakan Aplikasi, termasuk individu yang telah mendaftar atau belummendaftarkan akun di Aplikasi pada usia legal untuk mendapatkan akses ke Klub.",
                      style: GoogleFonts.poppins(
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        color: neutral8,
                      ),
                    ),
                    sizedBoxHeight(50),
                    Text(
                      "2. PENGANTAR",
                      style: GoogleFonts.poppins(
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                        color: neutral8,
                      ),
                    ),
                    sizedBoxHeight(35),
                    Text(
                      "2.1. Aplikasiini memungkinkan Anda untuk mencari, menjadwalkan dan memesan kelas dan sesipelatihan pribadi yang diadakan di Klub; melacak challenge dan achivementAnda (hanya berlaku untuk member); dan memantau aktivitas kesehatan dankebugaran Anda. ",
                      style: GoogleFonts.poppins(
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        color: neutral8,
                      ),
                    ),
                    sizedBoxHeight(35),
                    Text(
                      "2.2. Untuksepenuhnya menggunakan layanan yang disediakan di Aplikasi, Anda harus mendaftarkan akun di Aplikasi. Jika Anda tidak mendaftarkan akun, Anda tidakakan dapat menikmati semua atau beberapa layanan yang disediakan di Aplikasi.",
                      style: GoogleFonts.poppins(
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        color: neutral8,
                      ),
                    ),
                    sizedBoxHeight(35),
                    Text(
                      "2.3. Denganmendaftarkan akun, Anda setuju untuk memberikan informasi yang benar, akurat,dan lengkap seperti yang disyaratkan selama pendaftaran dan untuk mematuhisemua peraturan dan ketentuan Klub yang berlaku. Apabila ditemukan ketidakakuratanatas data dan informasi yang diberikan Pengguna maka hal tersebut sepenuhnyamerupakan tanggung jawab dari Pengguna, sehingga dari dan oleh kerenanya Pengguna dengan inimembebaskan kami dari segala tuntutan, gugatan dan permintaan ganti kerugiandalam bentuk apapun.",
                      style: GoogleFonts.poppins(
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        color: neutral8,
                      ),
                    ),
                    sizedBoxHeight(50),
                    Text(
                      "3. HAK KEKAYAAN INTELEKTUAL",
                      style: GoogleFonts.poppins(
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                        color: neutral8,
                      ),
                    ),
                    sizedBoxHeight(35),
                    Text(
                      "3.1. Aplikasi dan layanan ini dimiliki dan dioperasikan oleh Kami. Seluruh konten dan desain layanan dilindungi oleh perundang-undangan RepublikIndonesia terkait hak kekayaan Intelektual. Semua hak mengenai layanan danmateri yang terkandungdi Aplikasidimiliki oleh Kami. Kami mempertahankan dan mencadangkan semua hak kepemilikan untuk konten layanan kami.",
                      style: GoogleFonts.poppins(
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        color: neutral8,
                      ),
                    ),
                    sizedBoxHeight(35),
                    Text(
                      "3.2. Andatunduk pada kepatuhan dengan Ketentuan, Aplikasi hanya untuk penggunaan pribadiAnda dan Anda dengan ini mengakui dan menyetujui bahwa Aplikasi dan semua namadan logo serta semua nama produk dan layanan terkait, merek desain, dan sloganadalah merek dagang/jasa atau merek layanan dari Kami. Pengguna tidak diizinkan untuk menggunakan nama ataulogo apa pun dalam iklan, publisitas, atau cara komersial lainnya apapun tanpaizin tertulis dari Kami. Semuamerek dagang lain yang muncul di layanan adalah properti dari pemiliknyamasing-masing. ",
                      style: GoogleFonts.poppins(
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        color: neutral8,
                      ),
                    ),
                    sizedBoxHeight(50),
                    Text(
                      "4. COVID-19 DISCLAIMER ",
                      style: GoogleFonts.poppins(
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                        color: neutral8,
                      ),
                    ),
                    sizedBoxHeight(35),
                    Text(
                      "4.1. Dalammengakses tempat, Pengguna dengan ini menyatakan dan menjamin bahwa Penggunabelum, dalam 14 hari terakhir melakukan kontak dekat dengan seseorang yang terjangkitCOVID-19 atau merupakan bagian dari kluster COVID-19, atau telah melakukankontak dengan seseorang yang tiba dari luar negeri dan tidak dikarantinasendiri selama 14 hari, dan tidak memiliki gejala berikut dalam 14 hariterakhir. ",
                      style: GoogleFonts.poppins(
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        color: neutral8,
                      ),
                    ),
                    sizedBoxHeight(35),
                    Text(
                      "a. Demam 37,3derajat Celsius atau lebih; ",
                      style: GoogleFonts.poppins(
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        color: neutral8,
                      ),
                    ),
                    sizedBoxHeight(35),
                    Text(
                      "b. Batuk",
                      style: GoogleFonts.poppins(
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        color: neutral8,
                      ),
                    ),
                    sizedBoxHeight(35),
                    Text(
                      "c. Kesulitanbernapas",
                      style: GoogleFonts.poppins(
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        color: neutral8,
                      ),
                    ),
                    sizedBoxHeight(35),
                    Text(
                      "d. Nyeritenggorokan",
                      style: GoogleFonts.poppins(
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        color: neutral8,
                      ),
                    ),
                    sizedBoxHeight(35),
                    Text(
                      "e. Sakitkepala",
                      style: GoogleFonts.poppins(
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        color: neutral8,
                      ),
                    ),
                    sizedBoxHeight(35),
                    Text(
                      "f. Napas terengah-engah;",
                      style: GoogleFonts.poppins(
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        color: neutral8,
                      ),
                    ),
                    sizedBoxHeight(35),
                    Text(
                      "g. Gejalaseperti flu",
                      style: GoogleFonts.poppins(
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        color: neutral8,
                      ),
                    ),
                    sizedBoxHeight(35),
                    Text(
                      "h. Kehilanganrasa dan bau",
                      style: GoogleFonts.poppins(
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        color: neutral8,
                      ),
                    ),
                    sizedBoxHeight(35),
                    Text(
                      "4.2. Penggunamenerima bahwa manajemen Klub berhak untuk menolak akses Pengguna jikamanajemen Klub mencurigai Pengguna sedang sakit dan/atau di mana Penggunamenunjukkan gejala-gejala di atas atau karena adanya keluhan dari anggota laindi mana keluhan tersebut disebabkan Pengguna menunjukkan gejala sepertitersebut di atas di sekitar orang lain.",
                      style: GoogleFonts.poppins(
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        color: neutral8,
                      ),
                    ),
                    sizedBoxHeight(35),
                    Text(
                      "4.3. Sebelum Pengguna mengunjungi Klub, pemesanan ulang pada Aplikasiwajib untuk: ",
                      style: GoogleFonts.poppins(
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        color: neutral8,
                      ),
                    ),
                    sizedBoxHeight(35),
                    Text(
                      "a. Memesan tempatdi kelas grup fitnes yang dipilih Pengguna (tergantung ketersediaan).",
                      style: GoogleFonts.poppins(
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        color: neutral8,
                      ),
                    ),
                    sizedBoxHeight(35),
                    Text(
                      "4.4. Selama kunjungan Pengguna ke Klub, Pengguna harusmematuhi:",
                      style: GoogleFonts.poppins(
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        color: neutral8,
                      ),
                    ),
                    sizedBoxHeight(35),
                    Text(
                      "a. Memastikan kondisi tubuh sehat sebelum berolahraga;",
                      style: GoogleFonts.poppins(
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        color: neutral8,
                      ),
                    ),
                    sizedBoxHeight(35),
                    Text(
                      "b. Memeriksasuhu badan di depan Klub (Front of House); ",
                      style: GoogleFonts.poppins(
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        color: neutral8,
                      ),
                    ),
                    sizedBoxHeight(35),
                    Text(
                      "c. Menyanitasitangan pada saat masuk dan keluar Klub;",
                      style: GoogleFonts.poppins(
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        color: neutral8,
                      ),
                    ),
                    sizedBoxHeight(35),
                    Text(
                      "d. Wajibmenggunakan masker setiap saat dan mengganti masker yang digunakan dari luar ;",
                      style: GoogleFonts.poppins(
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        color: neutral8,
                      ),
                    ),
                    sizedBoxHeight(35),
                    Text(
                      "e. Mencucitangan dengan sabun;",
                      style: GoogleFonts.poppins(
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        color: neutral8,
                      ),
                    ),
                    sizedBoxHeight(35),
                    Text(
                      "f. Mempraktikkanjarak sosial yang aman minimal sejauh 2 (dua) meter;",
                      style: GoogleFonts.poppins(
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        color: neutral8,
                      ),
                    ),
                    sizedBoxHeight(35),
                    Text(
                      "g. Pengguna wajib membawa alat pribadi untuk keperluanselama melakukan latihan di klub, termasuk tapi tidak terbatas pada handuk, alat bantu olahraga (jika ada) dan alat kebersihan, serta alat dan perelengkapan ibadah,",
                      style: GoogleFonts.poppins(
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        color: neutral8,
                      ),
                    ),
                    sizedBoxHeight(35),
                    Text(
                      "h. Pengguna bukanlah ibu hamil, anak-anak, lansia, dan/atau penderitakomorbid. ",
                      style: GoogleFonts.poppins(
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        color: neutral8,
                      ),
                    ),
                    sizedBoxHeight(35),
                    Text(
                      "i. mempraktikan etika batuk yang baik dan benar;",
                      style: GoogleFonts.poppins(
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        color: neutral8,
                      ),
                    ),
                    sizedBoxHeight(35),
                    Text(
                      "j. mengisi formulir self assesment untuk mengukurrisiko penularan COVID-19;",
                      style: GoogleFonts.poppins(
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        color: neutral8,
                      ),
                    ),
                    sizedBoxHeight(35),
                    Text(
                      "k. Melakukanlangkah kesehatan dan keselamatan lain yang dapat dilakukan dari waktu ke waktuberdasarkan keadaan.",
                      style: GoogleFonts.poppins(
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        color: neutral8,
                      ),
                    ),
                    sizedBoxHeight(50),
                    Text(
                      "5. PEMBATASAN PENGGUNAAN",
                      style: GoogleFonts.poppins(
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                        color: neutral8,
                      ),
                    ),
                    sizedBoxHeight(35),
                    Text(
                      "5.1. Dalammenggunakan Aplikasi, Anda setuju untuk tidak:",
                      style: GoogleFonts.poppins(
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        color: neutral8,
                      ),
                    ),
                    sizedBoxHeight(35),
                    Text(
                      "a. menyamarsebagai orang lain atau mengakses akun orang lain dengan atau tanpa izinmereka;",
                      style: GoogleFonts.poppins(
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        color: neutral8,
                      ),
                    ),
                    sizedBoxHeight(35),
                    Text(
                      "c. mengizinkanorang lain untuk menggunakan Pemesanan Anda;",
                      style: GoogleFonts.poppins(
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        color: neutral8,
                      ),
                    ),
                    sizedBoxHeight(35),
                    Text(
                      "d. membatalkanPemesanan yang telah selesai langsung dengan kami di salah satu Klub bukanmelalui Aplikasi; ",
                      style: GoogleFonts.poppins(
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        color: neutral8,
                      ),
                    ),
                    sizedBoxHeight(35),
                    Text(
                      "e. mengunggahsegala bentuk materi yang dianggap merusak reputasi kami, termasuk materi yangdapat (i) merusak sistem komputer atau data Pengguna lain (ii) pornografi, transaksi/perbuatanilegal, menghina, memfitnah, atau melakukan ujaran tidak pantas; (iii) hakcipta atau dilindungi;",
                      style: GoogleFonts.poppins(
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        color: neutral8,
                      ),
                    ),
                    sizedBoxHeight(35),
                    Text(
                      "f. mengumpulkanatau menggunakan alamat email, header surat, nama layar atau pengidentifikasilainnya tanpa persetujuan eksplisit dari orang yang diidentifikasi (termasuk, dantidak terbatas pada, pengelabuan, penipuan internet, perampokan kata sandi, webspidering, dan web data extraction) atau menggunakanlayanan untuk mendistribusikan perangkat lunak yang secara rahasia mengumpulkaninformasi tentang pengguna atau secara rahasia mengirimkan informasi tentangpengguna;",
                      style: GoogleFonts.poppins(
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        color: neutral8,
                      ),
                    ),
                    sizedBoxHeight(35),
                    Text(
                      "g. memodifikasi,mengadaptasi, menyiapkan karya turunan dari, atau mendekompilasi, merekayasabalik, membongkar, atau berupaya mendapatkan kode sumber dari Aplikasi;",
                      style: GoogleFonts.poppins(
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        color: neutral8,
                      ),
                    ),
                    sizedBoxHeight(35),
                    Text(
                      "h. menggunakanAplikasi untuk tujuan apa pun yang melanggar hukum atau dilarang oleh Ketentuanini; atau",
                      style: GoogleFonts.poppins(
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        color: neutral8,
                      ),
                    ),
                    sizedBoxHeight(35),
                    Text(
                      "i. melakukanatau mengizinkan tindakan apa pun yang secara langsung atau tidak langsungcenderung merugikan Hak Kekayaan Intelektual kami atau pihak ketiga mana punsehubungan dengan akses dan penggunaan Anda terhadap Aplikasi.",
                      style: GoogleFonts.poppins(
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        color: neutral8,
                      ),
                    ),
                    sizedBoxHeight(35),
                    Text(
                      "5.2. Dalamhal anda melakukan pelanggaran terhadap pembatasan sebagaimana tersebut padaangka 5.1 di atas, maka kami akan melakukan segala tindakan yang diperlukanguna mempertahankan hak dan kepentingan kami, termasuk mengambil langkah-langkahhukum yang diperlukan.",
                      style: GoogleFonts.poppins(
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        color: neutral8,
                      ),
                    ),
                    sizedBoxHeight(50),
                    Text(
                      "6. MEDIA SOSIAL",
                      style: GoogleFonts.poppins(
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                        color: neutral8,
                      ),
                    ),
                    sizedBoxHeight(35),
                    Text(
                      "6.1. JikaAnda memilih untuk menghubungkan akun media sosial Anda (seperti Facebook) keakun Anda, maka anda setuju beberapa informasi tertentu dari akun media sosial Anda dapat diberikankepada kami, termasuk informasi yang merupakan bagian dari profil Anda atauprofil teman Anda;",
                      style: GoogleFonts.poppins(
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        color: neutral8,
                      ),
                    ),
                    sizedBoxHeight(35),
                    Text(
                      "6.2. Kamijuga dapat menerima informasi tentang Anda dari sumber lain, seperti basis datapublik, mitra pemasaran strategis bersama, halaman dan platform media sosial ,orang-orang yang berteman dengan Anda atau terhubung dengan platform mediasosial, serta dari pihak ketiga lainnya.",
                      style: GoogleFonts.poppins(
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        color: neutral8,
                      ),
                    ),
                    sizedBoxHeight(50),
                    Text(
                      "7. PEMESANAN DAN PEMBAYARAN",
                      style: GoogleFonts.poppins(
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                        color: neutral8,
                      ),
                    ),
                    sizedBoxHeight(50),
                    Text(
                      "Pemesanan Kelas",
                      style: GoogleFonts.poppins(
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                        color: neutral8,
                      ),
                    ),
                    sizedBoxHeight(35),
                    Text(
                      "7.1. Andaharus masuk ke Aplikasi untuk memesan dan membeli kelas dan ini mungkintermasuk kelas yang ditawarkan oleh penyedia pihak ketiga baik secara penuhatau bersama-sama dengan kami. Setibanya di Klub, Anda harus check-inmenggunakan rincian pendaftaran Anda. ",
                      style: GoogleFonts.poppins(
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        color: neutral8,
                      ),
                    ),
                    sizedBoxHeight(35),
                    Text(
                      "7.2. Andamengakui dan menyetujui bahwa jenis, harga, dan penjadwalan kelas ditentukanoleh kami dan/atau penyedia layanan kami dan bahwa kami dan/atau penyedialayanan kami dapat dengan kebijaksanaan kami sendiri mengubah jenis, harga, danpenjadwalan kelas dari waktu ke waktu tanpa pemberitahuan sebelumnya kepadaAnda.",
                      style: GoogleFonts.poppins(
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        color: neutral8,
                      ),
                    ),
                    sizedBoxHeight(35),
                    Text(
                      "7.3. Kamidan/atau penyedia layanan kami akan memfasilitasi pembayaran kelas yang dipesanmenggunakan rincian pembayaran yang Anda berikan selama proses pendaftaranAplikasi sebagai berikut: ",
                      style: GoogleFonts.poppins(
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        color: neutral8,
                      ),
                    ),
                    sizedBoxHeight(35),
                    Text(
                      "(a) JikaAnda adalah Anggota dan Anda telah memesan kelas yang diadakan di Klub ataulokasi lain yang melebihi manfaat keanggotaan Anda, Anda mungkin diharuskanmembayar biaya tambahan yang tunduk pada kebijakan kami.",
                      style: GoogleFonts.poppins(
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        color: neutral8,
                      ),
                    ),
                    sizedBoxHeight(35),
                    Text(
                      "(b) JikaAnda bukan Anggota dan Anda telah memesan kelas yang diadakan di Klub ataulokasi lain, Anda akan diminta untuk membayar biaya yang tunduk padakebijaksanaan kami.",
                      style: GoogleFonts.poppins(
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        color: neutral8,
                      ),
                    ),
                    sizedBoxHeight(35),
                    Text(
                      "7.4. Pemesanan kelas melalui Aplikasi tidak lengkap sampaipembayaran disetujui oleh kami. Setelah pembayaran disetujui oleh kami, kamiakan mengirimkan tangkapan layar bukti pemesanan ke perangkat Anda melalui Aplikasiuntuk mengonfirmasi bahwa kelas Anda telah berhasil dipesan (\"Pemesanan Lengkap\") dan faktur pajak yangdikeluarkan oleh kami bahwa kelas dipesan melalui alamat email yang Andaberikan selama proses pendaftaran Aplikasi selesai. Anda harus menunjukkantangkapan layar bukti pemesanan di perangkat Anda sebagai bukti hak Anda untukberpartisipasi dalam kelas yang dipesan di tempat yang dipilih. Anda tidakberhak untuk menjual kembali, menugaskan, atau mentransfer kelas yang dipesanyang merupakan subjek dari Pemesanan Lengkap kepada pihak ketiga mana pun.",
                      style: GoogleFonts.poppins(
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        color: neutral8,
                      ),
                    ),
                    sizedBoxHeight(35),
                    Text(
                      "7.5. Kami berhak untuk meminta dokumen identifikasi Anda untukmemastikan bahwa Anda adalah orang yang membuat Pemesanan Lengkap. Jika ada perbedaan dalamidentifikasi antara Anda dan orang yang membuatPemesanan Lengkap, kamiberhak atas kebijakan kami sendiri dan mutlak untuk menolak partisipasi Andadalam kelas yang dipesan.",
                      style: GoogleFonts.poppins(
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        color: neutral8,
                      ),
                    ),
                    sizedBoxHeight(35),
                    Text(
                      "7.6. JikaAnda tidak menghadiri kelas yang dipesan yang merupakan subjek dari Pemesanan Lengkap dan Anda gagal untuk membatalkannya sesuai dengan Ketentuan ini, kami berhak atas kebijakankami sendiri dan mutlak untuk menolak memberi Anda pengembalian dana dari hargayang dibayarkan oleh Anda untuk kelas yang dipesan yang merupakan subjek dariPemesanan Lengkap. Jikakarena alasan apa pun keanggotaan Anda dengan kami telah diakhiri ataudibatalkan dan Anda memiliki Pemesanan Lengkap melampaui tanggal keanggotaan Anda, kami akan membatalkan pesanantersebut. Di mana Anda telah membayar untuk kelas atau sesi pelatihan pribadi,pengembalian dana akan dilakukan. ",
                      style: GoogleFonts.poppins(
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        color: neutral8,
                      ),
                    ),
                    sizedBoxHeight(35),
                    Text(
                      "7.7. Jika Anda membatalkan kelas yang dipesan yangmerupakan subjek dari Pemesanan Lengkap paling lambat 1 (satu) jam sebelum jadwal dimulainya kelas (sebagaimana dinyatakan dalam buktipemesanan untuk Pemesanan Lengkap), kami akan memberi Anda pengembalian dana dari harga yang dibayarkan untuk kelas yang dipesan,setelah dikurangi biaya pembatalan. Jika kami membatalkan kelas yang dipesandengan alasan apa pun, Anda berhak atas pengembalian dana penuh yang dibayarkanuntuk Pemesanan Lengkap.Pengembalian dana akan dibayarkan ke akun kartu kredit Anda yang digunakanuntuk melakukan pembayaran untuk Pemesanan Lengkap",
                      style: GoogleFonts.poppins(
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        color: neutral8,
                      ),
                    ),
                    sizedBoxHeight(35),
                    Text(
                      "7.8. Andaselanjutnya setuju untuk terikat oleh ketentuan layanan dari penyedia layanan terkaitsehubungan dengan pembayaran yang dilakukan melalui Aplikasi.",
                      style: GoogleFonts.poppins(
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        color: neutral8,
                      ),
                    ),
                    sizedBoxHeight(50),
                    Text(
                      "Pemesanan Kelas Digital",
                      style: GoogleFonts.poppins(
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                        color: neutral8,
                      ),
                    ),
                    sizedBoxHeight(35),
                    Text(
                      "7.9. Layananyang ditawarkan pada pemesanan kelas digital dapat menawarkan akses ke berbagaikelas digital audio dan/atau video dari perangkat Anda, melalui streaminglangsung dan/atau sesuai permintaan. Untuk mengakses kelas-kelas digital ini,Anda harus mematuhi persyaratan teknis dan perangkat keras tertentu. Saatberpartisipasi dalam kelas digital, informasi profil Aplikasi Anda dapat munculdi papan Leaderboard bersama dengan peserta kelas lainnya.",
                      style: GoogleFonts.poppins(
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        color: neutral8,
                      ),
                    ),
                    sizedBoxHeight(50),
                    Text(
                      "Pembayaran",
                      style: GoogleFonts.poppins(
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                        color: neutral8,
                      ),
                    ),
                    sizedBoxHeight(35),
                    Text(
                      "7.10. Semua harga untuk layanan di Aplikasi sudah termasuk pajak,termasuk E-Tax dan Pajak Hiburan atau pajak lainnya sesuai dengan ketentuanperpajakan atau peraturan daerah yang berlaku. Pembayaran dari kartu kredittunduk pada biaya transaksi penerbit kartu terkait dan biaya lainnya, dan dalam hal penggunaan kartu kreditinternasional maka berlaku juga untuk nilai tukar. Jika kami menawarkan layananapa pun yang gratis, pajak dan biaya tersebut mungkin masih tetap berlaku.",
                      style: GoogleFonts.poppins(
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        color: neutral8,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
