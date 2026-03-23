import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'contenedorasistencia2_model.dart';
export 'contenedorasistencia2_model.dart';

class Contenedorasistencia2Widget extends StatefulWidget {
  const Contenedorasistencia2Widget({
    super.key,
    this.nombre,
    this.imagen,
  });

  final String? nombre;
  final String? imagen;

  @override
  State<Contenedorasistencia2Widget> createState() =>
      _Contenedorasistencia2WidgetState();
}

class _Contenedorasistencia2WidgetState
    extends State<Contenedorasistencia2Widget> {
  late Contenedorasistencia2Model _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => Contenedorasistencia2Model());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 0.0, 8.0),
      child: InkWell(
        splashColor: Colors.transparent,
        focusColor: Colors.transparent,
        hoverColor: Colors.transparent,
        highlightColor: Colors.transparent,
        onTap: () async {
          if (_model.puntual!) {
            _model.puntual = !(_model.puntual ?? true);
            _model.retraso = !(_model.retraso ?? true);
            safeSetState(() {});
          } else if (_model.retraso!) {
            _model.retraso = !(_model.retraso ?? true);
            _model.ausente = !(_model.ausente ?? true);
            _model.puntual = false;
            safeSetState(() {});
          } else if (_model.ausente!) {
            _model.ausente = !(_model.ausente ?? true);
            _model.puntual = !(_model.puntual ?? true);
            safeSetState(() {});
          }
        },
        child: Container(
          width: 130.0,
          height: 87.0,
          decoration: BoxDecoration(
            color: () {
              if (_model.puntual!) {
                return FlutterFlowTheme.of(context).secondary;
              } else if (_model.retraso!) {
                return Color(0xFFF1F289);
              } else {
                return Color(0xFFFDA1A1);
              }
            }(),
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(0.0),
              bottomRight: Radius.circular(16.0),
              topLeft: Radius.circular(16.0),
              topRight: Radius.circular(0.0),
            ),
            shape: BoxShape.rectangle,
            border: Border.all(
              color: () {
                if (_model.puntual!) {
                  return Color(0xFE069F77);
                } else if (_model.retraso!) {
                  return Color(0xFFCBD60C);
                } else {
                  return Color(0xFFE10909);
                }
              }(),
              width: 6.0,
            ),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(5.0, 6.0, 0.0, 6.0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(24.0),
                      child: Image.network(
                        valueOrDefault<String>(
                          widget!.imagen,
                          'https://ataiu.com/futbol/jugadores/fotos/nofoto.webp',
                        ),
                        width: 37.5,
                        height: 44.9,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Opacity(
                      opacity: 0.8,
                      child: Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 0.0, 0.0),
                        child: Text(
                          valueOrDefault<String>(
                            () {
                              if (_model.puntual!) {
                                return 'Puntual';
                              } else if (_model.retraso!) {
                                return 'Retraso';
                              } else if (_model.ausente!) {
                                return 'Ausente';
                              } else {
                                return _model.retraso?.toString();
                              }
                            }(),
                            'texto variavle',
                          ),
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    font: GoogleFonts.inter(
                                      fontWeight: FontWeight.w600,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .fontStyle,
                                    ),
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.w600,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .fontStyle,
                                  ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Align(
                alignment: AlignmentDirectional(-1.0, 0.0),
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(5.0, 0.0, 0.0, 0.0),
                  child: Text(
                    widget!.nombre!,
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          font: GoogleFonts.inter(
                            fontWeight: FontWeight.w600,
                            fontStyle: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .fontStyle,
                          ),
                          fontSize: 12.0,
                          letterSpacing: 0.0,
                          fontWeight: FontWeight.w600,
                          fontStyle:
                              FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                        ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
