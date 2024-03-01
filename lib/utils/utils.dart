import 'package:flutter/material.dart';
import 'package:qr_reader/providers/db_provider.dart';
import 'package:url_launcher/url_launcher.dart';

handleLaunchUrl(BuildContext contex, ScanModel scan) async {
  final url = scan.value;

  if (scan.type == 'http') {
    final Uri url0 = Uri.parse(url);
    if (await canLaunchUrl(url0)) {
      await launchUrl(url0);
    } else {
      throw 'Could not launch $url0';
    }
  } else {
    Navigator.pushNamed(contex, 'map', arguments: scan);
  }
}
