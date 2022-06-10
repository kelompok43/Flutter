import 'package:fitness_gym/screens/aktivitas/aktivitas_screen.dart';
import 'package:fitness_gym/screens/akun/akun_screen.dart';
import 'package:fitness_gym/screens/dashboard/dashboard_view_model.dart';
import 'package:fitness_gym/screens/home/home_screen.dart';
import 'package:fitness_gym/screens/kelas/kelas_screen.dart';
import 'package:fitness_gym/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:ionicons/ionicons.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _screens = [
      const HomeScreen(),
      const KelasScreen(),
      const AktivitasScreen(),
      const AkunScreen(),
    ];
    var viewModel = Provider.of<DashboardViewModel>(context);
    int selectIndex = viewModel.selectedIndex;
    return Scaffold(
      body: _screens[viewModel.selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: selectIndex,
        onTap: (index) => viewModel.update(index),
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Beranda',
          ),
          BottomNavigationBarItem(
            icon: Icon(Ionicons.barbell),
            label: 'Kelas',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.local_activity),
            label: 'Aktivitas',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Akun',
          ),
        ],
        selectedItemColor: primary5,
        selectedFontSize: 10,
        unselectedFontSize: 10,
        selectedLabelStyle:
            GoogleFonts.poppins(textStyle: TextStyle(color: primary5)),
        unselectedLabelStyle:
            GoogleFonts.poppins(textStyle: TextStyle(color: neutral5)),
        unselectedItemColor: neutral5,
        showUnselectedLabels: true,
      ),
    );
  }
}
