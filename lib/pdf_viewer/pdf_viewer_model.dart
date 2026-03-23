import 'package:flutter/material.dart';

abstract class PdfViewerModel extends ChangeNotifier {
  void initState(BuildContext context);
  void dispose();
}
