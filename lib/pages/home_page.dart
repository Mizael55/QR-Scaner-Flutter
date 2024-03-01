import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qr_reader/pages/direcciones_page.dart';
import 'package:qr_reader/providers/db_provider.dart';
import 'package:qr_reader/providers/theme_provider.dart';
import 'package:qr_reader/providers/ui_provider.dart';
import 'package:qr_reader/widgets/custom_navigatorbar.dart';
import 'package:qr_reader/widgets/scan_bottom.dart';
import '../providers/scan_list_provider.dart';
import 'mapas_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
     final scanLsitProvider = Provider.of<ScanListProvider>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: const Text('Historial'),
        leading: IconButton(
          icon: Icon(themeProvider.isDarkMode
              ? Icons.light_mode_outlined
              : Icons.dark_mode_outlined),
          onPressed: () {
            themeProvider.setDarkMode(!themeProvider.isDarkMode);
          },
        ),
        actions: <Widget>[
          IconButton(icon: const Icon(Icons.delete_forever), onPressed: () {
            scanLsitProvider.borrarTodos();
          })
        ],
      ),
      body: _HomePageBody(),
      bottomNavigationBar: const CustomNavigatorBar(),
      floatingActionButton: const ScanButton(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}

class _HomePageBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final scanLsitProvider = Provider.of<ScanListProvider>(context, listen: false);
    final uiProvider = Provider.of<UiProvider>(context);
    final currentIndex = uiProvider.selectedMenuOpt;
    DBProvider.db.database;

    switch (currentIndex) {
      case 0:
        scanLsitProvider.cargarScansPorTipo('geo');
        return const MapasPage();
      case 1:
        scanLsitProvider.cargarScansPorTipo('http');
        return const DireccionesPage();
      default:
        return const MapasPage();
    }
  }
}
