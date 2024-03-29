import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:provider/provider.dart';
import 'package:qr_reader/providers/scan_list_provider.dart';
import 'package:qr_reader/utils/utils.dart';

class ScanButton extends StatelessWidget {
  const ScanButton({super.key});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      elevation: 0,
      onPressed: () async {
        String barcodeScanRes = await FlutterBarcodeScanner.scanBarcode(
            '#3D8BEF', 'Cancelar', false, ScanMode.QR);
        // const barcodeScanRes = 'https://fernando-herrera.com';
        // const barcodeScanRes = 'geo:18.462295,-69.305104';
        if (barcodeScanRes == '-1') {
          return;
        }

        final scanListProvider =
            Provider.of<ScanListProvider>(context, listen: false);
        // scanListProvider.nuevoScan(barcodeScanRes);
        final nuevoScan = await scanListProvider.nuevoScan(barcodeScanRes);
        handleLaunchUrl(context, nuevoScan);
      },
      child: const Icon(Icons.filter_center_focus),
    );
  }
}
