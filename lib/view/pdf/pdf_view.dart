import 'package:flutter/material.dart';
import 'package:flutter_cached_pdfview/flutter_cached_pdfview.dart';

class PdfViewScreen extends StatelessWidget {
  final String pdfUrl;
  final String title;

  const PdfViewScreen({super.key, required this.pdfUrl, required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: const PDF().cachedFromUrl(
        // 'https://github.com/shahin2067/pdf_resources/raw/main/1.%20Kopotakkho%20Nod.pdf',
        pdfUrl,
        placeholder: (double progress) => Center(child: Text('$progress %')),
        errorWidget: (dynamic error) => Center(child: Text(error.toString())),
      ),
    );
  }
}
