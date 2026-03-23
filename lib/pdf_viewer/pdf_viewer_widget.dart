import 'dart:io';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';
import 'package:http/http.dart' as http;

class PdfViewerWidget extends StatefulWidget {
  final String pdfUrl;
  final String pdfName;

  const PdfViewerWidget({
    required this.pdfUrl,
    required this.pdfName,
  });

  @override
  State<PdfViewerWidget> createState() => _PdfViewerWidgetState();
}

class _PdfViewerWidgetState extends State<PdfViewerWidget> {
  bool _isLoading = true;
  String? _errorMessage;
  String? _localFilePath;

  @override
  void initState() {
    super.initState();
    _downloadAndOpenPdf();
  }

  Future<void> _downloadAndOpenPdf() async {
    try {
      setState(() {
        _isLoading = true;
        _errorMessage = null;
      });

      final dir = await getTemporaryDirectory();
      final fileName = '${DateTime.now().millisecondsSinceEpoch}_${widget.pdfName}';
      final localFile = File('${dir.path}/$fileName');

      final response = await http.get(Uri.parse(widget.pdfUrl));
      if (response.statusCode != 200) {
        throw Exception('Error al descargar PDF: ${response.statusCode}');
      }

      await localFile.writeAsBytes(response.bodyBytes);

      setState(() {
        _localFilePath = localFile.path;
        _isLoading = false;
      });
    } catch (e) {
      setState(() {
        _errorMessage = e.toString();
        _isLoading = false;
      });
    }
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        title: Text(
          widget.pdfName,
          overflow: TextOverflow.ellipsis,
          style: FlutterFlowTheme.of(context).titleLarge,
        ),
        actions: [
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 16.0, 0.0),
            child: IconButton(
              icon: Icon(
                Icons.download,
                color: FlutterFlowTheme.of(context).primaryText,
                size: 24.0,
              ),
              onPressed: () async {
                await downloadFile(
                  filename: widget.pdfName,
                  url: widget.pdfUrl,
                );
              },
            ),
          ),
        ],
      ),
      body: _errorMessage != null
          ? Center(
              child: Padding(
                padding: EdgeInsets.all(20.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.error_outline, size: 64, color: Colors.red),
                    SizedBox(height: 16),
                    Text(
                      'Error al abrir el PDF',
                      style: FlutterFlowTheme.of(context).titleLarge,
                    ),
                    SizedBox(height: 8),
                    Text(
                      _errorMessage!,
                      style: FlutterFlowTheme.of(context).bodyMedium,
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 24),
                    FFButtonWidget(
                      onPressed: () async {
                        _downloadAndOpenPdf();
                      },
                      text: 'Reintentar',
                      options: FFButtonOptions(
                        width: 140.0,
                        height: 44.0,
                        padding: EdgeInsetsDirectional.fromSTEB(16, 0, 16, 0),
                        iconPadding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                        color: FlutterFlowTheme.of(context).primary,
                        textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                              fontFamily: 'Inter',
                              color: Colors.white,
                            ),
                        elevation: 3,
                        borderSide: BorderSide(
                          color: Colors.transparent,
                          width: 1,
                        ),
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                  ],
                ),
              ),
            )
          : Stack(
              children: [
                if (_localFilePath != null)
                  PDFView(
                    filePath: _localFilePath!,
                    enableSwipe: true,
                    swipeHorizontal: false,
                    autoSpacing: true,
                    pageFling: true,
                    onRender: (_pages) {
                      setState(() {
                        _isLoading = false;
                      });
                    },
                    onError: (error) {
                      setState(() {
                        _errorMessage = error.toString();
                        _isLoading = false;
                      });
                    },
                    onPageError: (page, error) {
                      setState(() {
                        _errorMessage = 'Error en página $page: $error';
                        _isLoading = false;
                      });
                    },
                  ),
                if (_isLoading)
                  Container(
                    color: FlutterFlowTheme.of(context).secondaryBackground,
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                            width: 50.0,
                            height: 50.0,
                            child: CircularProgressIndicator(
                              valueColor: AlwaysStoppedAnimation<Color>(
                                FlutterFlowTheme.of(context).primary,
                              ),
                            ),
                          ),
                          SizedBox(height: 16.0),
                          Text(
                            'Descargando PDF...',
                            style: FlutterFlowTheme.of(context).bodyMedium,
                          ),
                        ],
                      ),
                    ),
                  ),
              ],
            ),
    );
  }
}
