import 'dart:html' as html;
import 'dart:typed_data';
import 'package:flutter/services.dart' show rootBundle;

class CvService {
  static const String _assetPath = 'assets/cv/md_jehan_cv.pdf';
  static const String _downloadName = 'MD_Jehan_CV.pdf';

  static Future<void> downloadCv() async {
    final ByteData bytes = await rootBundle.load(_assetPath);
    final Uint8List pdfBytes =
    bytes.buffer.asUint8List(bytes.offsetInBytes, bytes.lengthInBytes);

    final blob = html.Blob([pdfBytes], 'application/pdf');
    final url = html.Url.createObjectUrlFromBlob(blob);

    final anchor = html.AnchorElement(href: url)
      ..setAttribute('download', _downloadName)
      ..style.display = 'none';

    html.document.body?.children.add(anchor);
    anchor.click();
    anchor.remove();

    html.Url.revokeObjectUrl(url);
  }
}