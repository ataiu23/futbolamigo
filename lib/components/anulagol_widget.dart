import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:math';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'anulagol_model.dart';
export 'anulagol_model.dart';

class AnulagolWidget extends StatefulWidget {
  const AnulagolWidget({
    super.key,
    this.idequipo,
    this.counter,
    this.marcadorlocal,
    this.idpartido,
    this.marcadorvisit,
    this.nombreclub,
    this.anulagol,
  });

  final int? idequipo;
  final String? counter;
  final int? marcadorlocal;
  final int? idpartido;
  final int? marcadorvisit;
  final String? nombreclub;
  final String? anulagol;

  @override
  State<AnulagolWidget> createState() => _AnulagolWidgetState();
}

class _AnulagolWidgetState extends State<AnulagolWidget>
    with TickerProviderStateMixin {
  late AnulagolModel _model;

  final animationsMap = <String, AnimationInfo>{};

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AnulagolModel());

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.ultimogol = await EventosPartidoTable().queryRows(
        queryFn: (q) => q
            .eqOrNull(
              'id_partido',
              widget!.idpartido,
            )
            .gteOrNull(
              'tipo_evento',
              'Gol',
            )
            .order('id'),
      );
      _model.marclocal = widget!.marcadorlocal;
      _model.marvisit = widget!.marcadorvisit;
      _model.ultimogolequipo =
          widget!.anulagol == 'local' ? 'Gol local' : 'Gol visitante';
      safeSetState(() {});
    });

    animationsMap.addAll({
      'textOnPageLoadAnimation': AnimationInfo(
        reverse: true,
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          ScaleEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 1000.0.ms,
            begin: Offset(1.0, 1.0),
            end: Offset(1.5, 1.5),
          ),
        ],
      ),
    });

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
      padding: EdgeInsetsDirectional.fromSTEB(0.0, 60.0, 0.0, 60.0),
      child: Container(
        width: MediaQuery.sizeOf(context).width * 1.0,
        height: MediaQuery.sizeOf(context).height * 0.5,
        decoration: BoxDecoration(
          color: FlutterFlowTheme.of(context).secondaryBackground,
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(0.0),
            bottomRight: Radius.circular(0.0),
            topLeft: Radius.circular(16.0),
            topRight: Radius.circular(16.0),
          ),
        ),
        child: Padding(
          padding: EdgeInsets.all(4.0),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(20.0, 8.0, 20.0, 0.0),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Divider(
                      thickness: 3.0,
                      indent: 150.0,
                      endIndent: 150.0,
                      color: FlutterFlowTheme.of(context).primaryBackground,
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 4.0, 16.0, 0.0),
                            child: Text(
                              'Gol ${widget!.anulagol}' ==
                                      _model.ultimogol?.firstOrNull?.tipoEvento
                                  ? 'ANULAR GOL'
                                  : 'SÓLO PUEDES ANULAR EL ÚLTIMO GOL REGISTRADO',
                              textAlign: TextAlign.center,
                              style: FlutterFlowTheme.of(context)
                                  .headlineMedium
                                  .override(
                                    font: GoogleFonts.interTight(
                                      fontWeight: FlutterFlowTheme.of(context)
                                          .headlineMedium
                                          .fontWeight,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .headlineMedium
                                          .fontStyle,
                                    ),
                                    color: FlutterFlowTheme.of(context).error,
                                    letterSpacing: 0.0,
                                    fontWeight: FlutterFlowTheme.of(context)
                                        .headlineMedium
                                        .fontWeight,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .headlineMedium
                                        .fontStyle,
                                  ),
                            ).animateOnPageLoad(
                                animationsMap['textOnPageLoadAnimation']!),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        if ('Gol ${widget!.anulagol}' ==
                            _model.ultimogol?.firstOrNull?.tipoEvento)
                          Expanded(
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 8.0, 0.0, 0.0),
                              child: Text(
                                'Vas a anular el último gol de:',
                                style: FlutterFlowTheme.of(context)
                                    .labelMedium
                                    .override(
                                      font: GoogleFonts.inter(
                                        fontWeight: FlutterFlowTheme.of(context)
                                            .labelMedium
                                            .fontWeight,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .labelMedium
                                            .fontStyle,
                                      ),
                                      letterSpacing: 0.0,
                                      fontWeight: FlutterFlowTheme.of(context)
                                          .labelMedium
                                          .fontWeight,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .labelMedium
                                          .fontStyle,
                                    ),
                              ),
                            ),
                          ),
                      ],
                    ),
                  ],
                ),
              ),
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  if ('Gol ${widget!.anulagol}' ==
                      _model.ultimogol?.firstOrNull?.tipoEvento)
                    Text(
                      valueOrDefault<String>(
                        'Gol ${widget!.anulagol}' ==
                                _model.ultimogol?.firstOrNull?.tipoEvento
                            ? widget!.nombreclub
                            : widget!.nombreclub,
                        'ultimo gol',
                      ),
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            font: GoogleFonts.inter(
                              fontWeight: FontWeight.w600,
                              fontStyle: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .fontStyle,
                            ),
                            color: FlutterFlowTheme.of(context).primary,
                            fontSize: 20.0,
                            letterSpacing: 0.0,
                            fontWeight: FontWeight.w600,
                            fontStyle: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .fontStyle,
                          ),
                    ),
                  Text(
                    'Minuto ',
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          font: GoogleFonts.inter(
                            fontWeight: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .fontWeight,
                            fontStyle: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .fontStyle,
                          ),
                          letterSpacing: 0.0,
                          fontWeight: FlutterFlowTheme.of(context)
                              .bodyMedium
                              .fontWeight,
                          fontStyle:
                              FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                        ),
                  ),
                  Text(
                    valueOrDefault<String>(
                      _model.ultimogol?.firstOrNull?.counter,
                      'counter',
                    ),
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          font: GoogleFonts.inter(
                            fontWeight: FontWeight.w600,
                            fontStyle: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .fontStyle,
                          ),
                          color: FlutterFlowTheme.of(context).primary,
                          fontSize: 20.0,
                          letterSpacing: 0.0,
                          fontWeight: FontWeight.w600,
                          fontStyle:
                              FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                        ),
                  ),
                ],
              ),
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  if ('Gol ${widget!.anulagol}' ==
                      _model.ultimogol?.firstOrNull?.tipoEvento)
                    FFButtonWidget(
                      onPressed: () async {
                        if (widget!.anulagol == 'local') {
                          _model.marclocal = _model.marclocal! + -1;
                          safeSetState(() {});
                          await ResultadosTable().update(
                            data: {
                              'GolesEquipo_Local': _model.marclocal,
                            },
                            matchingRows: (rows) => rows.eqOrNull(
                              'id',
                              widget!.idpartido,
                            ),
                          );
                          if (widget!.nombreclub == 'C.D. Amigo') {
                            await EventosPartidoTable().insert({
                              'id_partido': widget!.idpartido,
                              'tipo_evento': 'Gol local anulado',
                              'counter': widget!.counter,
                              'jugadoramigo':
                                  _model.ultimogol?.lastOrNull?.jugadoramigo,
                            });
                            Navigator.pop(context, _model.marclocal);
                          } else {
                            await EventosPartidoTable().insert({
                              'id_partido': widget!.idpartido,
                              'tipo_evento': 'Gol local anulado',
                              'counter': widget!.counter,
                            });
                            Navigator.pop(context, _model.marclocal);
                          }
                        } else {
                          _model.marvisit = _model.marvisit! + -1;
                          safeSetState(() {});
                          await ResultadosTable().update(
                            data: {
                              'GolesEquipo_Visitante': _model.marvisit,
                            },
                            matchingRows: (rows) => rows.eqOrNull(
                              'id',
                              widget!.idpartido,
                            ),
                          );
                          if (widget!.nombreclub == 'C.D. Amigo') {
                            await EventosPartidoTable().insert({
                              'id_partido': widget!.idpartido,
                              'tipo_evento': 'Gol visitante anulado',
                              'counter': widget!.counter,
                              'jugadoramigo':
                                  _model.ultimogol?.lastOrNull?.jugadoramigo,
                            });
                            Navigator.pop(context, _model.marvisit);
                          } else {
                            await EventosPartidoTable().insert({
                              'id_partido': widget!.idpartido,
                              'tipo_evento': 'Gol visitante anulado',
                              'counter': widget!.counter,
                            });
                            Navigator.pop(context, _model.marvisit);
                          }
                        }

                        safeSetState(() {});
                      },
                      text: 'Anular gol',
                      options: FFButtonOptions(
                        height: 40.0,
                        padding: EdgeInsetsDirectional.fromSTEB(
                            16.0, 0.0, 16.0, 0.0),
                        iconPadding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                        color: FlutterFlowTheme.of(context).primary,
                        textStyle:
                            FlutterFlowTheme.of(context).titleSmall.override(
                                  font: GoogleFonts.interTight(
                                    fontWeight: FlutterFlowTheme.of(context)
                                        .titleSmall
                                        .fontWeight,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .titleSmall
                                        .fontStyle,
                                  ),
                                  color: Colors.white,
                                  letterSpacing: 0.0,
                                  fontWeight: FlutterFlowTheme.of(context)
                                      .titleSmall
                                      .fontWeight,
                                  fontStyle: FlutterFlowTheme.of(context)
                                      .titleSmall
                                      .fontStyle,
                                ),
                        elevation: 0.0,
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                    ),
                  FFButtonWidget(
                    onPressed: () async {
                      if (widget!.anulagol == 'local') {
                        Navigator.pop(context, _model.marclocal);
                      } else {
                        Navigator.pop(context, _model.marvisit);
                      }
                    },
                    text: 'Cancelar',
                    options: FFButtonOptions(
                      height: 40.0,
                      padding:
                          EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                      iconPadding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                      color: FlutterFlowTheme.of(context).primary,
                      textStyle:
                          FlutterFlowTheme.of(context).titleSmall.override(
                                font: GoogleFonts.interTight(
                                  fontWeight: FlutterFlowTheme.of(context)
                                      .titleSmall
                                      .fontWeight,
                                  fontStyle: FlutterFlowTheme.of(context)
                                      .titleSmall
                                      .fontStyle,
                                ),
                                color: Colors.white,
                                letterSpacing: 0.0,
                                fontWeight: FlutterFlowTheme.of(context)
                                    .titleSmall
                                    .fontWeight,
                                fontStyle: FlutterFlowTheme.of(context)
                                    .titleSmall
                                    .fontStyle,
                              ),
                      elevation: 0.0,
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                  ),
                ],
              ),
            ].divide(SizedBox(height: 10.0)).addToEnd(SizedBox(height: 10.0)),
          ),
        ),
      ),
    );
  }
}
