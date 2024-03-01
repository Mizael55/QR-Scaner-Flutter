import 'package:flutter/material.dart';
import 'package:qr_reader/widgets/scan_tile.dart';

class MapasPage extends StatelessWidget {
  const MapasPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const ScanTiles(tipo: 'geo');
  }
}
