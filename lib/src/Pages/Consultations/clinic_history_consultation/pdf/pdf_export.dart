import 'dart:io';
import 'package:aronnax/src/Pages/Consultations/clinic_history_consultation/pdf/designs/theme_one.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;

Future pdfExport() async {
  final pdf = pw.Document();

  pdf.addPage(
    pw.Page(
      margin: const pw.EdgeInsets.all(0),
      pageFormat: PdfPageFormat.a4,
      build: (pw.Context context) {
        return themeOne();
      },
    ),
  );
  String dirPath = (await getApplicationDocumentsDirectory()).path;
  String filePath = "$dirPath/AronnaxOut-HC.pdf";
  File file = File(filePath);
  return file.writeAsBytes(
    await pdf.save(),
  );
}
