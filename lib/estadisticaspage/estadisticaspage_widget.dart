import '/backend/supabase/supabase.dart';
import '/components/navbarequipos_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_charts.dart';
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
import 'estadisticaspage_model.dart';
export 'estadisticaspage_model.dart';

class EstadisticaspageWidget extends StatefulWidget {
  const EstadisticaspageWidget({
    super.key,
    required this.idjugador,
    required this.imagenjugador,
    required this.nombrejugador,
    required this.posicion,
  });

  final int? idjugador;
  final String? imagenjugador;
  final String? nombrejugador;
  final int? posicion;

  static String routeName = 'estadisticaspage';
  static String routePath = '/estadisticaspage';

  @override
  State<EstadisticaspageWidget> createState() => _EstadisticaspageWidgetState();
}

class _EstadisticaspageWidgetState extends State<EstadisticaspageWidget>
    with TickerProviderStateMixin {
  late EstadisticaspageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  final animationsMap = <String, AnimationInfo>{};

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => EstadisticaspageModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.respuestaEntrenamientos = await EntrenamientosTable().queryRows(
        queryFn: (q) => q
            .eqOrNull(
              'id_jugador',
              widget!.idjugador,
            )
            .order('id', ascending: true),
      );
      await Future.wait([
        Future(() async {
          if (_model.respuestaEntrenamientos!
              .where((e) => e.totalpases != null)
              .toList()
              .isNotEmpty) {
            _model.pases = _model.respuestaEntrenamientos!
                .map((e) => e.totalpases)
                .withoutNulls
                .toList()
                .toList()
                .cast<int>();
            _model.fechapase = _model.respuestaEntrenamientos!
                .where((e) => e.totalpases != null)
                .toList()
                .map((e) => dateTimeFormat("d/M", e.createdAt))
                .toList()
                .toList()
                .cast<String>();
            _model.indicePases =
                List.generate(_model.pases.length, (i) => i.toDouble());
            _model.fechasPasesDouble =
                List.generate(_model.fechapase.length, (i) => i.toDouble());
            _model.anchograficopases =
                _model.pases.length <= 8 ? 300 : (_model.pases.length * 33);
            safeSetState(() {});
          }
        }),
        Future(() async {
          if (_model.respuestaEntrenamientos!
              .where((e) => e.totalgoles != null)
              .toList()
              .isNotEmpty) {
            _model.tiro = _model.respuestaEntrenamientos!
                .map((e) => e.totalgoles)
                .withoutNulls
                .toList()
                .toList()
                .cast<int>();
            _model.fechatiro = _model.respuestaEntrenamientos!
                .where((e) => e.totalgoles != null)
                .toList()
                .map((e) => dateTimeFormat("d/M", e.createdAt))
                .toList()
                .toList()
                .cast<String>();
            _model.indiceTiro =
                List.generate(_model.tiro.length, (i) => i.toDouble());
            _model.fechasTiroDouble =
                List.generate(_model.fechatiro.length, (i) => i.toDouble());
            _model.anchograficotiro =
                _model.tiro.length <= 8 ? 300 : (_model.tiro.length * 33);
            safeSetState(() {});
          }
        }),
        Future(() async {
          if (_model.respuestaEntrenamientos!
              .where((e) => e.velocidad != null)
              .toList()
              .isNotEmpty) {
            _model.fechavelocidad = _model.respuestaEntrenamientos!
                .where((e) => e.velocidad != null)
                .toList()
                .map((e) => dateTimeFormat("d/M", e.createdAt))
                .toList()
                .toList()
                .cast<String>();
            _model.anchograficovelocidad = _model.velocidad.length <= 8
                ? 300
                : (_model.velocidad.length * 33);
            safeSetState(() {});
            _model.velocidad = (List<int> var1) {
              return [for (final v in var1) v / 1000];
            }(_model.respuestaEntrenamientos!
                    .map((e) => e.velocidad?.millisecondsSinceEpoch)
                    .withoutNulls
                    .toList()
                    .toList())
                .toList()
                .cast<double>();
            _model.indiceVelocidad =
                List.generate(_model.velocidad.length, (i) => i.toDouble());
            _model.fechasVelocidadDouble = List.generate(
                _model.fechavelocidad.length, (i) => i.toDouble());
            safeSetState(() {});
          }
        }),
        Future(() async {
          if (_model.respuestaEntrenamientos!
              .where((e) => e.tiemporegate != null)
              .toList()
              .isNotEmpty) {
            _model.fecharegate = _model.respuestaEntrenamientos!
                .where((e) => e.tiemporegate != null)
                .toList()
                .map((e) => dateTimeFormat("d/M", e.createdAt))
                .toList()
                .toList()
                .cast<String>();
            _model.anchograficoregate =
                _model.regate.length <= 8 ? 300 : (_model.regate.length * 33);
            safeSetState(() {});
            _model.regate = (List<int> var2) {
              return [for (final v in var2) v / 1000];
            }(_model.respuestaEntrenamientos!
                    .map((e) => e.tiemporegate?.millisecondsSinceEpoch)
                    .withoutNulls
                    .toList()
                    .toList())
                .toList()
                .cast<double>();
            _model.conotirado = _model.respuestaEntrenamientos!
                .map((e) => e.conoregate)
                .withoutNulls
                .toList()
                .toList()
                .cast<int>();
            _model.regatetotal = (List<int> var3, List<double> var4) {
              return [
                for (int i = 0; i < var4.length; i++) var4[i] + (0.5 * var3[i])
              ];
            }(_model.conotirado.toList(), _model.regate.toList())
                .toList()
                .cast<double>();
            _model.indiceRegate =
                List.generate(_model.regatetotal.length, (i) => i.toDouble());
            _model.fechasRegateDouble =
                List.generate(_model.fecharegate.length, (i) => i.toDouble());
            safeSetState(() {});
          }
        }),
      ]);
    });

    animationsMap.addAll({
      'chartOnPageLoadAnimation1': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          MoveEffect(
            curve: Curves.easeInOut,
            delay: 1090.0.ms,
            duration: 330.0.ms,
            begin: Offset(100.0, 0.0),
            end: Offset(0.0, 0.0),
          ),
        ],
      ),
      'chartOnPageLoadAnimation2': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          MoveEffect(
            curve: Curves.easeInOut,
            delay: 1090.0.ms,
            duration: 330.0.ms,
            begin: Offset(100.0, 0.0),
            end: Offset(0.0, 0.0),
          ),
        ],
      ),
      'chartOnPageLoadAnimation3': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          MoveEffect(
            curve: Curves.easeInOut,
            delay: 1090.0.ms,
            duration: 330.0.ms,
            begin: Offset(100.0, 0.0),
            end: Offset(0.0, 0.0),
          ),
        ],
      ),
      'chartOnPageLoadAnimation4': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          MoveEffect(
            curve: Curves.easeInOut,
            delay: 1090.0.ms,
            duration: 330.0.ms,
            begin: Offset(100.0, 0.0),
            end: Offset(0.0, 0.0),
          ),
        ],
      ),
    });

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.sizeOf(context).width;
    final isSmallScreen = screenWidth < 414;
    final infoFontSize = isSmallScreen ? 16.0 : 13.0;
    final datosFontSize = isSmallScreen ? 10.0 : 8.0;

    return FutureBuilder<List<VistaRendimientoJugadorRow>>(
      future: VistaRendimientoJugadorTable().querySingleRow(
        queryFn: (q) => q.eqOrNull(
          'id_jugador',
          widget!.idjugador,
        ),
      ),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Scaffold(
            backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
            body: Center(
              child: SizedBox(
                width: 50.0,
                height: 50.0,
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(
                    FlutterFlowTheme.of(context).primary,
                  ),
                ),
              ),
            ),
          );
        }
        List<VistaRendimientoJugadorRow>
            estadisticaspageVistaRendimientoJugadorRowList = snapshot.data!;

        final estadisticaspageVistaRendimientoJugadorRow =
            estadisticaspageVistaRendimientoJugadorRowList.isNotEmpty
                ? estadisticaspageVistaRendimientoJugadorRowList.first
                : null;

        return GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
            FocusManager.instance.primaryFocus?.unfocus();
          },
          child: Scaffold(
            key: scaffoldKey,
            backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
            body: SafeArea(
              top: true,
              child: Stack(
                children: [
                  Stack(
                    children: [
                      Align(
                        alignment: AlignmentDirectional(0.0, 0.0),
                        child: FutureBuilder<List<JugadoresRow>>(
                          future: JugadoresTable().querySingleRow(
                            queryFn: (q) => q.eqOrNull(
                              'id',
                              widget!.idjugador,
                            ),
                          ),
                          builder: (context, snapshot) {
                            // Customize what your widget looks like when it's loading.
                            if (!snapshot.hasData) {
                              return Center(
                                child: SizedBox(
                                  width: 50.0,
                                  height: 50.0,
                                  child: CircularProgressIndicator(
                                    valueColor: AlwaysStoppedAnimation<Color>(
                                      FlutterFlowTheme.of(context).primary,
                                    ),
                                  ),
                                ),
                              );
                            }
                            List<JugadoresRow> containerJugadoresRowList =
                                snapshot.data!;

                            final containerJugadoresRow =
                                containerJugadoresRowList.isNotEmpty
                                    ? containerJugadoresRowList.first
                                    : null;

                            return Container(
                              width: double.infinity,
                              height: double.infinity,
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context)
                                    .secondaryBackground,
                                image: DecorationImage(
                                  fit: BoxFit.cover,
                                  image: Image.asset(
                                    'assets/images/sing_in.webp',
                                  ).image,
                                ),
                                borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(5.0),
                                  bottomRight: Radius.circular(5.0),
                                  topLeft: Radius.circular(5.0),
                                  topRight: Radius.circular(5.0),
                                ),
                              ),
                              alignment: AlignmentDirectional(0.0, 0.0),
                              child: Align(
                                alignment: AlignmentDirectional(0.0, 0.0),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 0.0, 80.0),
                                  child: Container(
                                    width: 340.0,
                                    height: 595.0,
                                    decoration: BoxDecoration(
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryBackground,
                                      borderRadius: BorderRadius.circular(30.0),
                                      shape: BoxShape.rectangle,
                                    ),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Align(
                                          alignment:
                                              AlignmentDirectional(0.0, 0.0),
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 8.0, 0.0, 20.0),
                                            child: Container(
                                              width: 316.09,
                                              height: 570.1,
                                              decoration: BoxDecoration(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryBackground,
                                              ),
                                              child: Column(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 14.0,
                                                                0.0, 0.0),
                                                    child: Container(
                                                      decoration:
                                                          BoxDecoration(),
                                                      child: Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0.0,
                                                                    0.0,
                                                                    0.0,
                                                                    12.0),
                                                        child: Row(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceEvenly,
                                                          children: [
                                                            ClipRRect(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          8.0),
                                                              child:
                                                                  Image.network(
                                                                valueOrDefault<
                                                                    String>(
                                                                  widget!
                                                                      .imagenjugador,
                                                                  'https://ataiu.com/futbol/jugadores/fotos/nofoto.webp',
                                                                ),
                                                                width: 132.5,
                                                                height: 176.7,
                                                                fit: BoxFit
                                                                    .cover,
                                                              ),
                                                            ),
                                                            Align(
                                                              alignment:
                                                                  AlignmentDirectional(
                                                                      0.0,
                                                                      -1.0),
                                                              child: Column(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .center,
                                                                crossAxisAlignment:
                                                                    CrossAxisAlignment
                                                                        .center,
                                                                children: [
                                                                  Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0.0,
                                                                            0.0,
                                                                            10.0,
                                                                            8.0),
                                                                    child: Text(
                                                                      'Nombre',
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .labelMedium
                                                                          .override(
                                                                            font:
                                                                                GoogleFonts.inter(
                                                                              fontWeight: FlutterFlowTheme.of(context).labelMedium.fontWeight,
                                                                              fontStyle: FlutterFlowTheme.of(context).labelMedium.fontStyle,
                                                                            ),
                                                                            letterSpacing:
                                                                                0.0,
                                                                            fontWeight:
                                                                                FlutterFlowTheme.of(context).labelMedium.fontWeight,
                                                                            fontStyle:
                                                                                FlutterFlowTheme.of(context).labelMedium.fontStyle,
                                                                          ),
                                                                    ),
                                                                  ),
                                                                  Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0.0,
                                                                            0.0,
                                                                            10.0,
                                                                            16.0),
                                                                    child: Text(
                                                                      valueOrDefault<
                                                                          String>(
                                                                        containerJugadoresRow
                                                                            ?.nombreJugador,
                                                                        'nombre',
                                                                      ),
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .override(
                                                                            font:
                                                                                GoogleFonts.inter(
                                                                              fontWeight: FontWeight.w600,
                                                                              fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                            ),
                                                                            fontSize:
                                                                                16.0,
                                                                            letterSpacing:
                                                                                0.0,
                                                                            fontWeight:
                                                                                FontWeight.w600,
                                                                            fontStyle:
                                                                                FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                          ),
                                                                    ),
                                                                  ),
                                                                  Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0.0,
                                                                            0.0,
                                                                            10.0,
                                                                            8.0),
                                                                    child: Text(
                                                                      'Posicion',
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .labelMedium
                                                                          .override(
                                                                            font:
                                                                                GoogleFonts.inter(
                                                                              fontWeight: FlutterFlowTheme.of(context).labelMedium.fontWeight,
                                                                              fontStyle: FlutterFlowTheme.of(context).labelMedium.fontStyle,
                                                                            ),
                                                                            letterSpacing:
                                                                                0.0,
                                                                            fontWeight:
                                                                                FlutterFlowTheme.of(context).labelMedium.fontWeight,
                                                                            fontStyle:
                                                                                FlutterFlowTheme.of(context).labelMedium.fontStyle,
                                                                          ),
                                                                    ),
                                                                  ),
                                                                  Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0.0,
                                                                            0.0,
                                                                            10.0,
                                                                            16.0),
                                                                    child: Text(
                                                                      () {
                                                                        if (widget!.posicion ==
                                                                            1) {
                                                                          return 'Atacante';
                                                                        } else if (widget!.posicion ==
                                                                            2) {
                                                                          return 'Centrocampista';
                                                                        } else if (widget!.posicion ==
                                                                            3) {
                                                                          return 'Defensor';
                                                                        } else if (widget!.posicion ==
                                                                            4) {
                                                                          return 'Portero';
                                                                        } else {
                                                                          return ' ';
                                                                        }
                                                                      }(),
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .override(
                                                                            font:
                                                                                GoogleFonts.inter(
                                                                              fontWeight: FontWeight.w600,
                                                                              fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                            ),
                                                                            fontSize:
                                                                                16.0,
                                                                            letterSpacing:
                                                                                0.0,
                                                                            fontWeight:
                                                                                FontWeight.w600,
                                                                            fontStyle:
                                                                                FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                          ),
                                                                    ),
                                                                  ),
                                                                  Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0.0,
                                                                            0.0,
                                                                            10.0,
                                                                            8.0),
                                                                    child: Text(
                                                                      'Pie Dominante',
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .labelMedium
                                                                          .override(
                                                                            font:
                                                                                GoogleFonts.inter(
                                                                              fontWeight: FlutterFlowTheme.of(context).labelMedium.fontWeight,
                                                                              fontStyle: FlutterFlowTheme.of(context).labelMedium.fontStyle,
                                                                            ),
                                                                            letterSpacing:
                                                                                0.0,
                                                                            fontWeight:
                                                                                FlutterFlowTheme.of(context).labelMedium.fontWeight,
                                                                            fontStyle:
                                                                                FlutterFlowTheme.of(context).labelMedium.fontStyle,
                                                                          ),
                                                                    ),
                                                                  ),
                                                                  Text(
                                                                    valueOrDefault<
                                                                        String>(
                                                                      containerJugadoresRow
                                                                          ?.pieDominante,
                                                                      'Diestro',
                                                                    ),
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .override(
                                                                          font:
                                                                              GoogleFonts.inter(
                                                                            fontWeight:
                                                                                FontWeight.w600,
                                                                            fontStyle:
                                                                                FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                          ),
                                                                          fontSize:
                                                                              infoFontSize,
                                                                          letterSpacing:
                                                                              0.0,
                                                                          fontWeight:
                                                                              FontWeight.w600,
                                                                          fontStyle: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .fontStyle,
                                                                        ),
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                  Column(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    children: [
                                                      SizedBox(
                                                        width: 150.0,
                                                        child: Divider(
                                                          thickness: 2.0,
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .alternate,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                  Container(
                                                    width: 324.7,
                                                    height: 352.83,
                                                    decoration: BoxDecoration(
                                                      color: FlutterFlowTheme
                                                              .of(context)
                                                          .secondaryBackground,
                                                    ),
                                                    child:
                                                        SingleChildScrollView(
                                                      child: Column(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        children: [
                                                          Align(
                                                            alignment:
                                                                AlignmentDirectional(
                                                                    0.0, 0.0),
                                                            child: Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          10.0,
                                                                          0.0,
                                                                          14.0),
                                                              child: Text(
                                                                'Partidos',
                                                                textAlign:
                                                                    TextAlign
                                                                        .center,
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .override(
                                                                      font: GoogleFonts
                                                                          .inter(
                                                                        fontWeight:
                                                                            FontWeight.w600,
                                                                        fontStyle: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .fontStyle,
                                                                      ),
                                                                      fontSize:
                                                                          18.0,
                                                                      letterSpacing:
                                                                          0.0,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w600,
                                                                      fontStyle: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .fontStyle,
                                                                    ),
                                                              ),
                                                            ),
                                                          ),
                                                          Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        0.0,
                                                                        0.0,
                                                                        0.0,
                                                                        16.0),
                                                            child: Row(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .spaceBetween,
                                                              children: [
                                                                Column(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  children: [
                                                                    Text(
                                                                      'Convocados',
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .override(
                                                                            font:
                                                                                GoogleFonts.inter(
                                                                              fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                              fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                            ),
                                                                            letterSpacing:
                                                                                0.0,
                                                                            fontWeight:
                                                                                FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                            fontStyle:
                                                                                FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                          ),
                                                                    ),
                                                                    Text(
                                                                      'dato',
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .override(
                                                                            font:
                                                                                GoogleFonts.inter(
                                                                              fontWeight: FontWeight.w600,
                                                                              fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                            ),
                                                                            fontSize:
                                                                                16.0,
                                                                            letterSpacing:
                                                                                0.0,
                                                                            fontWeight:
                                                                                FontWeight.w600,
                                                                            fontStyle:
                                                                                FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                          ),
                                                                    ),
                                                                  ],
                                                                ),
                                                                Column(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  children: [
                                                                    Text(
                                                                      'Titular',
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .override(
                                                                            font:
                                                                                GoogleFonts.inter(
                                                                              fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                              fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                            ),
                                                                            letterSpacing:
                                                                                0.0,
                                                                            fontWeight:
                                                                                FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                            fontStyle:
                                                                                FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                          ),
                                                                    ),
                                                                    Text(
                                                                      'dato',
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .override(
                                                                            font:
                                                                                GoogleFonts.inter(
                                                                              fontWeight: FontWeight.w600,
                                                                              fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                            ),
                                                                            fontSize:
                                                                                16.0,
                                                                            letterSpacing:
                                                                                0.0,
                                                                            fontWeight:
                                                                                FontWeight.w600,
                                                                            fontStyle:
                                                                                FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                          ),
                                                                    ),
                                                                  ],
                                                                ),
                                                                Column(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  children: [
                                                                    Text(
                                                                      'Suplente',
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .override(
                                                                            font:
                                                                                GoogleFonts.inter(
                                                                              fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                              fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                            ),
                                                                            letterSpacing:
                                                                                0.0,
                                                                            fontWeight:
                                                                                FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                            fontStyle:
                                                                                FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                          ),
                                                                    ),
                                                                    Text(
                                                                      'dato',
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .override(
                                                                            font:
                                                                                GoogleFonts.inter(
                                                                              fontWeight: FontWeight.w600,
                                                                              fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                            ),
                                                                            fontSize:
                                                                                16.0,
                                                                            letterSpacing:
                                                                                0.0,
                                                                            fontWeight:
                                                                                FontWeight.w600,
                                                                            fontStyle:
                                                                                FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                          ),
                                                                    ),
                                                                  ],
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                          Align(
                                                            alignment:
                                                                AlignmentDirectional(
                                                                    0.0, 0.0),
                                                            child: Column(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .center,
                                                              children: [
                                                                Align(
                                                                  alignment:
                                                                      AlignmentDirectional(
                                                                          0.0,
                                                                          0.0),
                                                                  child:
                                                                      Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0.0,
                                                                            0.0,
                                                                            0.0,
                                                                            16.0),
                                                                    child: Row(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      mainAxisAlignment:
                                                                          MainAxisAlignment
                                                                              .spaceAround,
                                                                      children: [
                                                                        Column(
                                                                          mainAxisSize:
                                                                              MainAxisSize.max,
                                                                          children: [
                                                                            Text(
                                                                              'Jugados',
                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                    font: GoogleFonts.inter(
                                                                                      fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                      fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                    ),
                                                                                    letterSpacing: 0.0,
                                                                                    fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                    fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                  ),
                                                                            ),
                                                                            Text(
                                                                              'dato',
                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                    font: GoogleFonts.inter(
                                                                                      fontWeight: FontWeight.w600,
                                                                                      fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                    ),
                                                                                    fontSize: infoFontSize,
                                                                                    letterSpacing: 0.0,
                                                                                    fontWeight: FontWeight.w600,
                                                                                    fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                  ),
                                                                            ),
                                                                          ],
                                                                        ),
                                                                        Column(
                                                                          mainAxisSize:
                                                                              MainAxisSize.max,
                                                                          children: [
                                                                            Text(
                                                                              'Total Goles',
                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                    font: GoogleFonts.inter(
                                                                                      fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                      fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                    ),
                                                                                    letterSpacing: 0.0,
                                                                                    fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                    fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                  ),
                                                                            ),
                                                                            Text(
                                                                              'dato',
                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                    font: GoogleFonts.inter(
                                                                                      fontWeight: FontWeight.w600,
                                                                                      fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                    ),
                                                                                    fontSize: infoFontSize,
                                                                                    letterSpacing: 0.0,
                                                                                    fontWeight: FontWeight.w600,
                                                                                    fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                  ),
                                                                            ),
                                                                          ],
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  ),
                                                                ),
                                                                SizedBox(
                                                                  width: 150.0,
                                                                  child:
                                                                      Divider(
                                                                    thickness:
                                                                        2.0,
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .alternate,
                                                                  ),
                                                                ),
                                                                Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          10.0,
                                                                          0.0,
                                                                          14.0),
                                                                  child: Text(
                                                                    'Tarjetas',
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .override(
                                                                          font:
                                                                              GoogleFonts.inter(
                                                                            fontWeight:
                                                                                FontWeight.w600,
                                                                            fontStyle:
                                                                                FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                          ),
                                                                          fontSize:
                                                                              18.0,
                                                                          letterSpacing:
                                                                              0.0,
                                                                          fontWeight:
                                                                              FontWeight.w600,
                                                                          fontStyle: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .fontStyle,
                                                                        ),
                                                                  ),
                                                                ),
                                                                Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          0.0,
                                                                          10.0),
                                                                  child: Row(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    mainAxisAlignment:
                                                                        MainAxisAlignment
                                                                            .spaceEvenly,
                                                                    children: [
                                                                      Column(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        children: [
                                                                          Padding(
                                                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                                                0.0,
                                                                                0.0,
                                                                                0.0,
                                                                                10.0),
                                                                            child:
                                                                                Text(
                                                                              'Tarjetas Amarillas',
                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                    font: GoogleFonts.inter(
                                                                                      fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                      fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                    ),
                                                                                    letterSpacing: 0.0,
                                                                                    fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                    fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                  ),
                                                                            ),
                                                                          ),
                                                                          Container(
                                                                            width:
                                                                                20.0,
                                                                            height:
                                                                                24.0,
                                                                            decoration:
                                                                                BoxDecoration(
                                                                              color: Color(0xFFFBFB03),
                                                                              borderRadius: BorderRadius.only(
                                                                                bottomLeft: Radius.circular(8.0),
                                                                                bottomRight: Radius.circular(8.0),
                                                                                topLeft: Radius.circular(8.0),
                                                                                topRight: Radius.circular(8.0),
                                                                              ),
                                                                            ),
                                                                          ),
                                                                          Padding(
                                                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                                                0.0,
                                                                                10.0,
                                                                                0.0,
                                                                                0.0),
                                                                            child:
                                                                                Text(
                                                                              'dato',
                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                    font: GoogleFonts.inter(
                                                                                      fontWeight: FontWeight.w600,
                                                                                      fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                    ),
                                                                                    fontSize: infoFontSize,
                                                                                    letterSpacing: 0.0,
                                                                                    fontWeight: FontWeight.w600,
                                                                                    fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                  ),
                                                                            ),
                                                                          ),
                                                                        ],
                                                                      ),
                                                                      Column(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        children: [
                                                                          Padding(
                                                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                                                0.0,
                                                                                0.0,
                                                                                0.0,
                                                                                10.0),
                                                                            child:
                                                                                Text(
                                                                              'Tarjetas Rojas',
                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                    font: GoogleFonts.inter(
                                                                                      fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                      fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                    ),
                                                                                    letterSpacing: 0.0,
                                                                                    fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                    fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                  ),
                                                                            ),
                                                                          ),
                                                                          Container(
                                                                            width:
                                                                                20.0,
                                                                            height:
                                                                                24.0,
                                                                            decoration:
                                                                                BoxDecoration(
                                                                              color: Color(0xFFF22626),
                                                                              borderRadius: BorderRadius.only(
                                                                                bottomLeft: Radius.circular(8.0),
                                                                                bottomRight: Radius.circular(8.0),
                                                                                topLeft: Radius.circular(8.0),
                                                                                topRight: Radius.circular(8.0),
                                                                              ),
                                                                            ),
                                                                          ),
                                                                          Padding(
                                                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                                                0.0,
                                                                                10.0,
                                                                                0.0,
                                                                                0.0),
                                                                            child:
                                                                                Text(
                                                                              'dato',
                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                    font: GoogleFonts.inter(
                                                                                      fontWeight: FontWeight.w600,
                                                                                      fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                    ),
                                                                                    fontSize: infoFontSize,
                                                                                    letterSpacing: 0.0,
                                                                                    fontWeight: FontWeight.w600,
                                                                                    fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                  ),
                                                                            ),
                                                                          ),
                                                                        ],
                                                                      ),
                                                                    ],
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                          Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        0.0,
                                                                        0.0,
                                                                        0.0,
                                                                        16.0),
                                                            child: Column(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .spaceEvenly,
                                                              children: [
                                                                Column(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  children: [
                                                                    Text(
                                                                      'Media Goles',
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .override(
                                                                            font:
                                                                                GoogleFonts.inter(
                                                                              fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                              fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                            ),
                                                                            letterSpacing:
                                                                                0.0,
                                                                            fontWeight:
                                                                                FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                            fontStyle:
                                                                                FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                          ),
                                                                    ),
                                                                    Text(
                                                                      'dato',
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .override(
                                                                            font:
                                                                                GoogleFonts.inter(
                                                                              fontWeight: FontWeight.w600,
                                                                              fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                            ),
                                                                            fontSize:
                                                                                16.0,
                                                                            letterSpacing:
                                                                                0.0,
                                                                            fontWeight:
                                                                                FontWeight.w600,
                                                                            fontStyle:
                                                                                FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                          ),
                                                                    ),
                                                                  ],
                                                                ),
                                                                SizedBox(
                                                                  width: 150.0,
                                                                  child:
                                                                      Divider(
                                                                    thickness:
                                                                        2.0,
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .alternate,
                                                                  ),
                                                                ),
                                                                Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          10.0,
                                                                          0.0,
                                                                          0.0),
                                                                  child: Text(
                                                                    'Evolucion Pases',
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .override(
                                                                          font:
                                                                              GoogleFonts.inter(
                                                                            fontWeight:
                                                                                FontWeight.w600,
                                                                            fontStyle:
                                                                                FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                          ),
                                                                          fontSize:
                                                                              18.0,
                                                                          letterSpacing:
                                                                              0.0,
                                                                          fontWeight:
                                                                              FontWeight.w600,
                                                                          fontStyle: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .fontStyle,
                                                                        ),
                                                                  ),
                                                                ),
                                                                SingleChildScrollView(
                                                                  scrollDirection:
                                                                      Axis.horizontal,
                                                                  child: Row(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    children: [
                                                                      Container(
                                                                        width: _model
                                                                            .anchograficopases
                                                                            ?.toDouble(),
                                                                        height:
                                                                            221.6,
                                                                        decoration:
                                                                            BoxDecoration(
                                                                          color:
                                                                              FlutterFlowTheme.of(context).secondaryBackground,
                                                                        ),
                                                                        child:
                                                                            Align(
                                                                          alignment: AlignmentDirectional(
                                                                              0.0,
                                                                              0.0),
                                                                          child:
                                                                              Container(
                                                                            width:
                                                                                MediaQuery.sizeOf(context).width * 1.0,
                                                                            height:
                                                                                182.9,
                                                                            child:
                                                                                FlutterFlowLineChart(
                                                                              data: [
                                                                                FFLineChartData(
                                                                                  xData: _model.indicePases,
                                                                                  yData: _model.pases.map((e) => e.toDouble()).toList(),
                                                                                  settings: LineChartBarData(
                                                                                    color: FlutterFlowTheme.of(context).primary,
                                                                                    dotData: FlDotData(show: true),
                                                                                    belowBarData: BarAreaData(show: false),
                                                                                  ),
                                                                                )
                                                                              ],
                                                                              chartStylingInfo: ChartStylingInfo(
                                                                                enableTooltip: true,
                                                                                tooltipBackgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                showGrid: true,
                                                                                borderColor: Color(0x5257636C),
                                                                                borderWidth: 6.0,
                                                                              ),
                                                                              axisBounds: AxisBounds(
                                                                                minY: 0.0,
                                                                                maxY: _model.pases.isNotEmpty ? _model.pases.reduce((a, b) => a > b ? a : b).toDouble() * 1.2 : 100.0,
                                                                              ),
                                                                              xAxisLabelInfo: AxisLabelInfo(
                                                                                showLabels: true,
                                                                                title: 'Fecha',
                                                                                titleTextStyle: TextStyle(
                                                                                  color: FlutterFlowTheme.of(context).primaryText,
                                                                                  fontSize: datosFontSize,
                                                                                ),
                                                                                labelTextStyle: TextStyle(
                                                                                  color: FlutterFlowTheme.of(context).primaryText,
                                                                                  fontSize: datosFontSize,
                                                                                ),
                                                                                labelInterval: 1.0,
                                                                                reservedSize: 40.0,
                                                                                getXTitlesWidget: (value, _) {
                                                                                  final index = value.toInt();
                                                                                  if (index >= 0 && index < _model.fechapase.length) {
                                                                                    return Text(
                                                                                      _model.fechapase[index],
                                                                                      style: TextStyle(
                                                                                        color: FlutterFlowTheme.of(context).primaryText,
                                                                                        fontSize: datosFontSize,
                                                                                      ),
                                                                                    );
                                                                                  }
                                                                                  return Text('');
                                                                                },
                                                                              ),
                                                                              yAxisLabelInfo: AxisLabelInfo(
                                                                                showLabels: true,
                                                                                labelTextStyle: GoogleFonts.roboto(
                                                                                  fontSize: datosFontSize,
                                                                                ),
                                                                                labelInterval: 10.0,
                                                                                reservedSize: 30.0,
                                                                              ),
                                                                            ),
                                                                          ).animateOnPageLoad(animationsMap['chartOnPageLoadAnimation1']!),
                                                                        ),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                          Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        0.0,
                                                                        0.0,
                                                                        0.0,
                                                                        16.0),
                                                            child: Column(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .spaceEvenly,
                                                              children: [
                                                                SizedBox(
                                                                  width: 150.0,
                                                                  child:
                                                                      Divider(
                                                                    thickness:
                                                                        2.0,
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .alternate,
                                                                  ),
                                                                ),
                                                                Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          10.0,
                                                                          0.0,
                                                                          0.0),
                                                                  child: Text(
                                                                    'Evolucion Tiro',
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .override(
                                                                          font:
                                                                              GoogleFonts.inter(
                                                                            fontWeight:
                                                                                FontWeight.w600,
                                                                            fontStyle:
                                                                                FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                          ),
                                                                          fontSize:
                                                                              18.0,
                                                                          letterSpacing:
                                                                              0.0,
                                                                          fontWeight:
                                                                              FontWeight.w600,
                                                                          fontStyle: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .fontStyle,
                                                                        ),
                                                                  ),
                                                                ),
                                                                SingleChildScrollView(
                                                                  scrollDirection:
                                                                      Axis.horizontal,
                                                                  child: Row(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    children: [
                                                                      Container(
                                                                        width: _model
                                                                            .anchograficotiro
                                                                            ?.toDouble(),
                                                                        height:
                                                                            221.6,
                                                                        decoration:
                                                                            BoxDecoration(
                                                                          color:
                                                                              FlutterFlowTheme.of(context).secondaryBackground,
                                                                        ),
                                                                        child:
                                                                            Align(
                                                                          alignment: AlignmentDirectional(
                                                                              0.0,
                                                                              0.0),
                                                                          child:
                                                                              Container(
                                                                            width:
                                                                                MediaQuery.sizeOf(context).width * 1.0,
                                                                            height:
                                                                                182.9,
                                                                            child:
                                                                                FlutterFlowLineChart(
                                                                              data: [
                                                                                FFLineChartData(
                                                                                  xData: _model.indiceTiro,
                                                                                  yData: _model.tiro.map((e) => e.toDouble()).toList(),
                                                                                  settings: LineChartBarData(
                                                                                    color: FlutterFlowTheme.of(context).primary,
                                                                                    dotData: FlDotData(show: true),
                                                                                    belowBarData: BarAreaData(show: false),
                                                                                  ),
                                                                                )
                                                                              ],
                                                                              chartStylingInfo: ChartStylingInfo(
                                                                                enableTooltip: true,
                                                                                tooltipBackgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                showGrid: true,
                                                                                borderColor: Color(0x5257636C),
                                                                                borderWidth: 6.0,
                                                                              ),
                                                                              axisBounds: AxisBounds(
                                                                                minY: 0.0,
                                                                                maxY: _model.tiro.isNotEmpty ? _model.tiro.reduce((a, b) => a > b ? a : b).toDouble() * 1.2 : 100.0,
                                                                              ),
                                                                              xAxisLabelInfo: AxisLabelInfo(
                                                                                showLabels: true,
                                                                                title: 'Fecha',
                                                                                titleTextStyle: TextStyle(
                                                                                  color: FlutterFlowTheme.of(context).primaryText,
                                                                                  fontSize: datosFontSize,
                                                                                ),
                                                                                labelTextStyle: TextStyle(
                                                                                  color: FlutterFlowTheme.of(context).primaryText,
                                                                                  fontSize: datosFontSize,
                                                                                ),
                                                                                labelInterval: 1.0,
                                                                                reservedSize: 40.0,
                                                                                getXTitlesWidget: (value, _) {
                                                                                  final index = value.toInt();
                                                                                  if (index >= 0 && index < _model.fechatiro.length) {
                                                                                    return Text(
                                                                                      _model.fechatiro[index],
                                                                                      style: TextStyle(
                                                                                        color: FlutterFlowTheme.of(context).primaryText,
                                                                                        fontSize: datosFontSize,
                                                                                      ),
                                                                                    );
                                                                                  }
                                                                                  return Text('');
                                                                                },
                                                                              ),
                                                                              yAxisLabelInfo: AxisLabelInfo(
                                                                                showLabels: true,
                                                                                labelTextStyle: GoogleFonts.roboto(
                                                                                  fontSize: datosFontSize,
                                                                                ),
                                                                                labelInterval: 10.0,
                                                                                reservedSize: 30.0,
                                                                              ),
                                                                            ),
                                                                          ).animateOnPageLoad(animationsMap['chartOnPageLoadAnimation2']!),
                                                                        ),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                          Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        0.0,
                                                                        0.0,
                                                                        0.0,
                                                                        16.0),
                                                            child: Column(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .spaceEvenly,
                                                              children: [
                                                                SizedBox(
                                                                  width: 150.0,
                                                                  child:
                                                                      Divider(
                                                                    thickness:
                                                                        2.0,
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .alternate,
                                                                  ),
                                                                ),
                                                                Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          10.0,
                                                                          0.0,
                                                                          0.0),
                                                                  child: Text(
                                                                    'Evolucion Velocidad',
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .override(
                                                                          font:
                                                                              GoogleFonts.inter(
                                                                            fontWeight:
                                                                                FontWeight.w600,
                                                                            fontStyle:
                                                                                FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                          ),
                                                                          fontSize:
                                                                              18.0,
                                                                          letterSpacing:
                                                                              0.0,
                                                                          fontWeight:
                                                                              FontWeight.w600,
                                                                          fontStyle: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .fontStyle,
                                                                        ),
                                                                  ),
                                                                ),
                                                                SingleChildScrollView(
                                                                  scrollDirection:
                                                                      Axis.horizontal,
                                                                  child: Row(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    children: [
                                                                      Container(
                                                                        width: _model
                                                                            .anchograficovelocidad
                                                                            ?.toDouble(),
                                                                        height:
                                                                            221.6,
                                                                        decoration:
                                                                            BoxDecoration(
                                                                          color:
                                                                              FlutterFlowTheme.of(context).secondaryBackground,
                                                                        ),
                                                                        child:
                                                                            Align(
                                                                          alignment: AlignmentDirectional(
                                                                              0.0,
                                                                              0.0),
                                                                          child:
                                                                              Container(
                                                                            width:
                                                                                MediaQuery.sizeOf(context).width * 1.0,
                                                                            height:
                                                                                182.9,
                                                                            child:
                                                                                FlutterFlowLineChart(
                                                                              data: [
                                                                                FFLineChartData(
                                                                                  xData: _model.indiceVelocidad,
                                                                                  yData: _model.velocidad,
                                                                                  settings: LineChartBarData(
                                                                                    color: FlutterFlowTheme.of(context).primary,
                                                                                    dotData: FlDotData(show: true),
                                                                                    belowBarData: BarAreaData(show: false),
                                                                                  ),
                                                                                )
                                                                              ],
                                                                              chartStylingInfo: ChartStylingInfo(
                                                                                enableTooltip: true,
                                                                                tooltipBackgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                showGrid: true,
                                                                                borderColor: Color(0x5257636C),
                                                                                borderWidth: 6.0,
                                                                              ),
                                                                              axisBounds: AxisBounds(
                                                                                minY: 0.0,
                                                                                maxY: _model.velocidad.isNotEmpty ? _model.velocidad.reduce((a, b) => a > b ? a : b) * 1.2 : 15.0,
                                                                              ),
                                                                              xAxisLabelInfo: AxisLabelInfo(
                                                                                showLabels: true,
                                                                                title: 'Fecha',
                                                                                titleTextStyle: TextStyle(
                                                                                  color: FlutterFlowTheme.of(context).primaryText,
                                                                                  fontSize: datosFontSize,
                                                                                ),
                                                                                labelTextStyle: TextStyle(
                                                                                  color: FlutterFlowTheme.of(context).primaryText,
                                                                                  fontSize: datosFontSize,
                                                                                ),
                                                                                labelInterval: 1.0,
                                                                                reservedSize: 40.0,
                                                                                getXTitlesWidget: (value, _) {
                                                                                  final index = value.toInt();
                                                                                  if (index >= 0 && index < _model.fechavelocidad.length) {
                                                                                    return Text(
                                                                                      _model.fechavelocidad[index],
                                                                                      style: TextStyle(
                                                                                        color: FlutterFlowTheme.of(context).primaryText,
                                                                                        fontSize: datosFontSize,
                                                                                      ),
                                                                                    );
                                                                                  }
                                                                                  return Text('');
                                                                                },
                                                                              ),
                                                                              yAxisLabelInfo: AxisLabelInfo(
                                                                                showLabels: true,
                                                                                labelTextStyle: GoogleFonts.roboto(
                                                                                  fontSize: datosFontSize,
                                                                                ),
                                                                                labelInterval: 1.0,
                                                                                reservedSize: 30.0,
                                                                              ),
                                                                            ),
                                                                          ).animateOnPageLoad(animationsMap['chartOnPageLoadAnimation3']!),
                                                                        ),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                          Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        0.0,
                                                                        0.0,
                                                                        0.0,
                                                                        16.0),
                                                            child: Column(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .spaceEvenly,
                                                              children: [
                                                                SizedBox(
                                                                  width: 150.0,
                                                                  child:
                                                                      Divider(
                                                                    thickness:
                                                                        2.0,
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .alternate,
                                                                  ),
                                                                ),
                                                                Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          10.0,
                                                                          0.0,
                                                                          0.0),
                                                                  child: Text(
                                                                    'Evolucion Regate',
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .override(
                                                                          font:
                                                                              GoogleFonts.inter(
                                                                            fontWeight:
                                                                                FontWeight.w600,
                                                                            fontStyle:
                                                                                FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                          ),
                                                                          fontSize:
                                                                              18.0,
                                                                          letterSpacing:
                                                                              0.0,
                                                                          fontWeight:
                                                                              FontWeight.w600,
                                                                          fontStyle: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .fontStyle,
                                                                        ),
                                                                  ),
                                                                ),
                                                                SingleChildScrollView(
                                                                  scrollDirection:
                                                                      Axis.horizontal,
                                                                  child: Row(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    children: [
                                                                      Container(
                                                                        width: _model
                                                                            .anchograficoregate
                                                                            ?.toDouble(),
                                                                        height:
                                                                            221.6,
                                                                        decoration:
                                                                            BoxDecoration(
                                                                          color:
                                                                              FlutterFlowTheme.of(context).secondaryBackground,
                                                                        ),
                                                                        child:
                                                                            Align(
                                                                          alignment: AlignmentDirectional(
                                                                              0.0,
                                                                              0.0),
                                                                          child:
                                                                              Container(
                                                                            width:
                                                                                MediaQuery.sizeOf(context).width * 1.0,
                                                                            height:
                                                                                182.9,
                                                                            child:
                                                                                FlutterFlowLineChart(
                                                                              data: [
                                                                                FFLineChartData(
                                                                                  xData: _model.indiceRegate,
                                                                                  yData: _model.regatetotal,
                                                                                  settings: LineChartBarData(
                                                                                    color: FlutterFlowTheme.of(context).primary,
                                                                                    dotData: FlDotData(show: true),
                                                                                    belowBarData: BarAreaData(show: false),
                                                                                  ),
                                                                                )
                                                                              ],
                                                                              chartStylingInfo: ChartStylingInfo(
                                                                                enableTooltip: true,
                                                                                tooltipBackgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                showGrid: true,
                                                                                borderColor: Color(0x5257636C),
                                                                                borderWidth: 6.0,
                                                                              ),
                                                                              axisBounds: AxisBounds(
                                                                                minY: 0.0,
                                                                                maxY: _model.regatetotal.isNotEmpty ? _model.regatetotal.reduce((a, b) => a > b ? a : b) * 1.2 : 15.0,
                                                                              ),
                                                                              xAxisLabelInfo: AxisLabelInfo(
                                                                                showLabels: true,
                                                                                title: 'Fecha',
                                                                                titleTextStyle: TextStyle(
                                                                                  color: FlutterFlowTheme.of(context).primaryText,
                                                                                  fontSize: datosFontSize,
                                                                                ),
                                                                                labelTextStyle: TextStyle(
                                                                                  color: FlutterFlowTheme.of(context).primaryText,
                                                                                  fontSize: datosFontSize,
                                                                                ),
                                                                                labelInterval: 1.0,
                                                                                reservedSize: 40.0,
                                                                                getXTitlesWidget: (value, _) {
                                                                                  final index = value.toInt();
                                                                                  if (index >= 0 && index < _model.fecharegate.length) {
                                                                                    return Text(
                                                                                      _model.fecharegate[index],
                                                                                      style: TextStyle(
                                                                                        color: FlutterFlowTheme.of(context).primaryText,
                                                                                        fontSize: datosFontSize,
                                                                                      ),
                                                                                    );
                                                                                  }
                                                                                  return Text('');
                                                                                },
                                                                              ),
                                                                              yAxisLabelInfo: AxisLabelInfo(
                                                                                showLabels: true,
                                                                                labelTextStyle: GoogleFonts.roboto(
                                                                                  fontSize: datosFontSize,
                                                                                ),
                                                                                labelInterval: 1.0,
                                                                                reservedSize: 30.0,
                                                                              ),
                                                                            ),
                                                                          ).animateOnPageLoad(animationsMap['chartOnPageLoadAnimation4']!),
                                                                        ),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                      Align(
                        alignment: AlignmentDirectional(0.0, 1.0),
                        child: wrapWithModel(
                          model: _model.navbarequiposModel,
                          updateCallback: () => safeSetState(() {}),
                          child: NavbarequiposWidget(),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
