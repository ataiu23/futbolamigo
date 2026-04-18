import '/backend/supabase/supabase.dart';
import '/components/navbarequipos_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_timer.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:math';
import 'dart:ui';
import 'package:stop_watch_timer/stop_watch_timer.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'entrenamientopage_model.dart';
export 'entrenamientopage_model.dart';

class EntrenamientopageWidget extends StatefulWidget {
  const EntrenamientopageWidget({
    super.key,
    required this.listaequipo,
    required this.nombreequipo,
  });

  final int? listaequipo;
  final String? nombreequipo;

  static String routeName = 'Entrenamientopage';
  static String routePath = '/entrenamientopage';

  @override
  State<EntrenamientopageWidget> createState() =>
      _EntrenamientopageWidgetState();
}

class _EntrenamientopageWidgetState extends State<EntrenamientopageWidget>
    with TickerProviderStateMixin {
  late EntrenamientopageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  final animationsMap = <String, AnimationInfo>{};

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => EntrenamientopageModel());

    _model.tabBarController = TabController(
      vsync: this,
      length: 4,
      initialIndex: 0,
    )..addListener(() => safeSetState(() {}));

    animationsMap.addAll({
      'imageOnActionTriggerAnimation1': AnimationInfo(
        trigger: AnimationTrigger.onActionTrigger,
        applyInitialState: true,
        effectsBuilder: () => [
          ScaleEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 600.0.ms,
            begin: Offset(1.0, 1.0),
            end: Offset(1.5, 1.5),
          ),
        ],
      ),
      'imageOnActionTriggerAnimation2': AnimationInfo(
        trigger: AnimationTrigger.onActionTrigger,
        applyInitialState: true,
        effectsBuilder: () => [
          ScaleEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 600.0.ms,
            begin: Offset(1.0, 1.0),
            end: Offset(1.0, 1.0),
          ),
        ],
      ),
      'imageOnActionTriggerAnimation3': AnimationInfo(
        trigger: AnimationTrigger.onActionTrigger,
        applyInitialState: true,
        effectsBuilder: () => [
          ScaleEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 600.0.ms,
            begin: Offset(1.0, 1.0),
            end: Offset(1.0, 1.0),
          ),
        ],
      ),
      'imageOnActionTriggerAnimation4': AnimationInfo(
        trigger: AnimationTrigger.onActionTrigger,
        applyInitialState: true,
        effectsBuilder: () => [
          ScaleEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 600.0.ms,
            begin: Offset(1.0, 1.0),
            end: Offset(1.0, 1.0),
          ),
        ],
      ),
    });
    setupAnimations(
      animationsMap.values.where((anim) =>
          anim.trigger == AnimationTrigger.onActionTrigger ||
          !anim.applyInitialState),
      this,
    );

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
    final equipoFontSize = isSmallScreen ? 26.0 : 19.0;
    final timerFontSize = isSmallScreen ? 16.0 : 20.0;

    return FutureBuilder<List<JugadoresRow>>(
      future: JugadoresTable().queryRows(
        queryFn: (q) => q.eqOrNull(
          'idequipo_jugador',
          widget!.listaequipo,
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
        List<JugadoresRow> entrenamientopageJugadoresRowList = snapshot.data!;

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
                        child: Container(
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
                            alignment: AlignmentDirectional(0.0, -1.0),
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 40.0, 0.0, 80.0),
                              child: Container(
                                width: 340.0,
                                height: double.infinity,
                                decoration: BoxDecoration(
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                  borderRadius: BorderRadius.circular(30.0),
                                  shape: BoxShape.rectangle,
                                ),
                                child: Stack(
                                  children: [
                                    Align(
                                      alignment:
                                          AlignmentDirectional(0.0, -1.0),
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 8.0, 0.0, 20.0),
                                        child: Container(
                                          width: 320.0,
                                          height: 94.4,
                                          decoration: BoxDecoration(
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryBackground,
                                          ),
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 0.0, 0.0, 0.0),
                                            child: Stack(
                                              children: [
                                                Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment
                                                          .stretch,
                                                  children: [
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  0.0,
                                                                  0.0,
                                                                  8.0),
                                                      child: Text(
                                                        valueOrDefault<String>(
                                                          widget!.nombreequipo,
                                                          'nombre equipo',
                                                        ),
                                                        textAlign:
                                                            TextAlign.center,
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .override(
                                                                  font:
                                                                      GoogleFonts
                                                                          .inter(
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w600,
                                                                    fontStyle: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .fontStyle,
                                                                  ),
                                                                  fontSize:
                                                                      equipoFontSize,
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
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  0.0,
                                                                  0.0,
                                                                  5.0),
                                                      child: Text(
                                                        'Tipos de Entrenamiento',
                                                        maxLines: 1,
                                                        textAlign:
                                                            TextAlign.center,
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .override(
                                                                  font:
                                                                      GoogleFonts
                                                                          .inter(
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w600,
                                                                    fontStyle: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .fontStyle,
                                                                  ),
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
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Align(
                                      alignment: AlignmentDirectional(0.0, 0.0),
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 100.0, 0.0, 0.0),
                                        child: Column(
                                          children: [
                                            Align(
                                              alignment: Alignment(0.0, 0),
                                              child: TabBar(
                                                labelColor:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryText,
                                                unselectedLabelColor:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryText,
                                                labelStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .titleMedium
                                                        .override(
                                                          font: GoogleFonts
                                                              .interTight(
                                                            fontWeight:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .titleMedium
                                                                    .fontWeight,
                                                            fontStyle:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .titleMedium
                                                                    .fontStyle,
                                                          ),
                                                          fontSize: 18.0,
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .titleMedium
                                                                  .fontWeight,
                                                          fontStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .titleMedium
                                                                  .fontStyle,
                                                        ),
                                                unselectedLabelStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .titleMedium
                                                        .override(
                                                          font: GoogleFonts
                                                              .interTight(
                                                            fontWeight:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .titleMedium
                                                                    .fontWeight,
                                                            fontStyle:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .titleMedium
                                                                    .fontStyle,
                                                          ),
                                                          fontSize: 14.0,
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .titleMedium
                                                                  .fontWeight,
                                                          fontStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .titleMedium
                                                                  .fontStyle,
                                                        ),
                                                indicatorColor:
                                                    FlutterFlowTheme.of(context)
                                                        .primary,
                                                tabs: [
                                                  Tab(
                                                    text: 'Tiro',
                                                  ),
                                                  Tab(
                                                    text: 'Pase',
                                                  ),
                                                  Tab(
                                                    text: 'Vel.',
                                                  ),
                                                  Tab(
                                                    text: 'Reg.',
                                                  ),
                                                ],
                                                controller:
                                                    _model.tabBarController,
                                                onTap: (i) async {
                                                  [
                                                    () async {},
                                                    () async {},
                                                    () async {},
                                                    () async {}
                                                  ][i]();
                                                },
                                              ),
                                            ),
                                            Expanded(
                                              child: TabBarView(
                                                controller:
                                                    _model.tabBarController,
                                                children: [
                                                  Stack(
                                                    children: [
                                                      Align(
                                                        alignment:
                                                            AlignmentDirectional(
                                                                0.0, 1.0),
                                                        child: Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      0.0,
                                                                      0.0,
                                                                      0.0,
                                                                      4.0),
                                                          child: Stack(
                                                            alignment:
                                                                AlignmentDirectional(
                                                                    0.0, 1.0),
                                                            children: [
                                                              Align(
                                                                alignment:
                                                                    AlignmentDirectional(
                                                                        0.0,
                                                                        0.0),
                                                                child: Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          8.0,
                                                                          0.0,
                                                                          8.0,
                                                                          90.0),
                                                                  child:
                                                                      Container(
                                                                    width:
                                                                        336.0,
                                                                    height:
                                                                        415.7,
                                                                    decoration:
                                                                        BoxDecoration(
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .secondaryBackground,
                                                                      image:
                                                                          DecorationImage(
                                                                        fit: BoxFit
                                                                            .contain,
                                                                        image: Image
                                                                            .asset(
                                                                          'assets/images/tiros1.jpg',
                                                                        ).image,
                                                                      ),
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              24.0),
                                                                    ),
                                                                    child:
                                                                        Align(
                                                                      alignment:
                                                                          AlignmentDirectional(
                                                                              0.0,
                                                                              0.0),
                                                                      child:
                                                                          Stack(
                                                                        children: [
                                                                          Align(
                                                                            alignment:
                                                                                AlignmentDirectional(0.0, 1.0),
                                                                            child:
                                                                                Padding(
                                                                              padding: EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 10.0, 10.0),
                                                                              child: Builder(
                                                                                builder: (context) {
                                                                                  final jugadores = entrenamientopageJugadoresRowList.map((e) => e).toList();

                                                                                  return SingleChildScrollView(
                                                                                    scrollDirection: Axis.horizontal,
                                                                                    child: Row(
                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                      children: List.generate(jugadores.length, (jugadoresIndex) {
                                                                                        final jugadoresItem = jugadores[jugadoresIndex];
                                                                                        return Opacity(
                                                                                          opacity: _model.jugselgol == jugadoresItem.id ? 1.0 : 0.6,
                                                                                          child: InkWell(
                                                                                            splashColor: Colors.transparent,
                                                                                            focusColor: Colors.transparent,
                                                                                            hoverColor: Colors.transparent,
                                                                                            highlightColor: Colors.transparent,
                                                                                            onTap: () async {
                                                                                              _model.jugselgol = jugadoresItem.id;
                                                                                              safeSetState(() {});
                                                                                            },
                                                                                            child: ClipRRect(
                                                                                              borderRadius: BorderRadius.circular(8.0),
                                                                                              child: Image.network(
                                                                                                valueOrDefault<String>(
                                                                                                  jugadoresItem.fotoJugador,
                                                                                                  'https://ataiu.com/futbol/jugadores/fotos/nofoto.webp',
                                                                                                ),
                                                                                                width: _model.jugselgol == jugadoresItem.id ? 80.0 : 74.0,
                                                                                                height: _model.jugselgol == jugadoresItem.id ? 120.0 : 100.0,
                                                                                                fit: BoxFit.cover,
                                                                                              ),
                                                                                            ),
                                                                                          ).animateOnActionTrigger(
                                                                                            animationsMap['imageOnActionTriggerAnimation1']!,
                                                                                          ),
                                                                                        );
                                                                                      }),
                                                                                    ),
                                                                                  );
                                                                                },
                                                                              ),
                                                                            ),
                                                                          ),
                                                                          Align(
                                                                            alignment:
                                                                                AlignmentDirectional(0.0, -0.17),
                                                                            child:
                                                                                Row(
                                                                              mainAxisSize: MainAxisSize.max,
                                                                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                                                              children: [
                                                                                InkWell(
                                                                                  splashColor: Colors.transparent,
                                                                                  focusColor: Colors.transparent,
                                                                                  hoverColor: Colors.transparent,
                                                                                  highlightColor: Colors.transparent,
                                                                                  onTap: () async {
                                                                                    if (_model.jugselgol != null) {
                                                                                      if ((_model.gol1 != null) && (_model.gol1 == 20)) {
                                                                                        _model.gol1 = -20;
                                                                                        safeSetState(() {});
                                                                                        _model.golestotal = _model.golestotal! + -20;
                                                                                        safeSetState(() {});
                                                                                      } else if ((_model.gol1 != null) && (_model.gol1 == -20)) {
                                                                                        _model.gol1 = 0;
                                                                                        safeSetState(() {});
                                                                                      } else {
                                                                                        _model.gol1 = 20;
                                                                                        safeSetState(() {});
                                                                                        _model.golestotal = _model.golestotal! + 20;
                                                                                        safeSetState(() {});
                                                                                      }
                                                                                    }
                                                                                  },
                                                                                  child: Stack(
                                                                                    children: [
                                                                                      if (_model.gol1 == 0)
                                                                                        FaIcon(
                                                                                          FontAwesomeIcons.check,
                                                                                          color: Color(0x00057A16),
                                                                                          size: 50.0,
                                                                                        ),
                                                                                      if (_model.gol1 == 20)
                                                                                        FaIcon(
                                                                                          FontAwesomeIcons.check,
                                                                                          color: Color(0xFF057A16),
                                                                                          size: 50.0,
                                                                                        ),
                                                                                      if (_model.gol1 == -20)
                                                                                        Icon(
                                                                                          Icons.close,
                                                                                          color: Color(0xFFA93607),
                                                                                          size: 50.0,
                                                                                        ),
                                                                                    ],
                                                                                  ),
                                                                                ),
                                                                                InkWell(
                                                                                  splashColor: Colors.transparent,
                                                                                  focusColor: Colors.transparent,
                                                                                  hoverColor: Colors.transparent,
                                                                                  highlightColor: Colors.transparent,
                                                                                  onTap: () async {
                                                                                    if (_model.jugselgol != null) {
                                                                                      if ((_model.gol2 != null) && (_model.gol2 == 20)) {
                                                                                        _model.gol2 = -20;
                                                                                        safeSetState(() {});
                                                                                        _model.golestotal = _model.golestotal! + -20;
                                                                                        safeSetState(() {});
                                                                                      } else if ((_model.gol2 != null) && (_model.gol2 == -20)) {
                                                                                        _model.gol2 = 0;
                                                                                        safeSetState(() {});
                                                                                      } else {
                                                                                        _model.gol2 = 20;
                                                                                        safeSetState(() {});
                                                                                        _model.golestotal = _model.golestotal! + 20;
                                                                                        safeSetState(() {});
                                                                                      }
                                                                                    }
                                                                                  },
                                                                                  child: Stack(
                                                                                    children: [
                                                                                      if (_model.gol2 == 0)
                                                                                        FaIcon(
                                                                                          FontAwesomeIcons.check,
                                                                                          color: Color(0x00057A16),
                                                                                          size: 50.0,
                                                                                        ),
                                                                                      if (_model.gol2 == 20)
                                                                                        FaIcon(
                                                                                          FontAwesomeIcons.check,
                                                                                          color: Color(0xFF057A16),
                                                                                          size: 50.0,
                                                                                        ),
                                                                                      if (_model.gol2 == -20)
                                                                                        Icon(
                                                                                          Icons.close,
                                                                                          color: Color(0xFFA93607),
                                                                                          size: 50.0,
                                                                                        ),
                                                                                    ],
                                                                                  ),
                                                                                ),
                                                                                InkWell(
                                                                                  splashColor: Colors.transparent,
                                                                                  focusColor: Colors.transparent,
                                                                                  hoverColor: Colors.transparent,
                                                                                  highlightColor: Colors.transparent,
                                                                                  onTap: () async {
                                                                                    if (_model.jugselgol != null) {
                                                                                      if ((_model.gol3 != null) && (_model.gol3 == 20)) {
                                                                                        _model.gol3 = -20;
                                                                                        safeSetState(() {});
                                                                                        _model.golestotal = _model.golestotal! + -20;
                                                                                        safeSetState(() {});
                                                                                      } else if ((_model.gol3 != null) && (_model.gol3 == -20)) {
                                                                                        _model.gol3 = 0;
                                                                                        safeSetState(() {});
                                                                                      } else {
                                                                                        _model.gol3 = 20;
                                                                                        safeSetState(() {});
                                                                                        _model.golestotal = _model.golestotal! + 20;
                                                                                        safeSetState(() {});
                                                                                      }
                                                                                    }
                                                                                  },
                                                                                  child: Stack(
                                                                                    children: [
                                                                                      if (_model.gol3 == 0)
                                                                                        FaIcon(
                                                                                          FontAwesomeIcons.check,
                                                                                          color: Color(0x00057A16),
                                                                                          size: 50.0,
                                                                                        ),
                                                                                      if (_model.gol3 == 20)
                                                                                        FaIcon(
                                                                                          FontAwesomeIcons.check,
                                                                                          color: Color(0xFF057A16),
                                                                                          size: 50.0,
                                                                                        ),
                                                                                      if (_model.gol3 == -20)
                                                                                        Icon(
                                                                                          Icons.close,
                                                                                          color: Color(0xFFA93607),
                                                                                          size: 50.0,
                                                                                        ),
                                                                                    ],
                                                                                  ),
                                                                                ),
                                                                                InkWell(
                                                                                  splashColor: Colors.transparent,
                                                                                  focusColor: Colors.transparent,
                                                                                  hoverColor: Colors.transparent,
                                                                                  highlightColor: Colors.transparent,
                                                                                  onTap: () async {
                                                                                    if (_model.jugselgol != null) {
                                                                                      if ((_model.gol4 != null) && (_model.gol4 == 20)) {
                                                                                        _model.gol4 = -20;
                                                                                        safeSetState(() {});
                                                                                        _model.golestotal = _model.golestotal! + -20;
                                                                                        safeSetState(() {});
                                                                                      } else if ((_model.gol4 != null) && (_model.gol4 == -20)) {
                                                                                        _model.gol4 = 0;
                                                                                        safeSetState(() {});
                                                                                      } else {
                                                                                        _model.gol4 = 20;
                                                                                        safeSetState(() {});
                                                                                        _model.golestotal = _model.golestotal! + 20;
                                                                                        safeSetState(() {});
                                                                                      }
                                                                                    }
                                                                                  },
                                                                                  child: Stack(
                                                                                    children: [
                                                                                      if (_model.gol4 == 0)
                                                                                        FaIcon(
                                                                                          FontAwesomeIcons.check,
                                                                                          color: Color(0x00057A16),
                                                                                          size: 50.0,
                                                                                        ),
                                                                                      if (_model.gol4 == 20)
                                                                                        FaIcon(
                                                                                          FontAwesomeIcons.check,
                                                                                          color: Color(0xFF057A16),
                                                                                          size: 50.0,
                                                                                        ),
                                                                                      if (_model.gol4 == -20)
                                                                                        Icon(
                                                                                          Icons.close,
                                                                                          color: Color(0xFFA93607),
                                                                                          size: 50.0,
                                                                                        ),
                                                                                    ],
                                                                                  ),
                                                                                ),
                                                                                InkWell(
                                                                                  splashColor: Colors.transparent,
                                                                                  focusColor: Colors.transparent,
                                                                                  hoverColor: Colors.transparent,
                                                                                  highlightColor: Colors.transparent,
                                                                                  onTap: () async {
                                                                                    if (_model.jugselgol != null) {
                                                                                      if ((_model.gol5 != null) && (_model.gol5 == 20)) {
                                                                                        _model.gol5 = -20;
                                                                                        safeSetState(() {});
                                                                                        _model.golestotal = _model.golestotal! + -20;
                                                                                        safeSetState(() {});
                                                                                      } else if ((_model.gol5 != null) && (_model.gol5 == -20)) {
                                                                                        _model.gol5 = 0;
                                                                                        safeSetState(() {});
                                                                                      } else {
                                                                                        _model.gol5 = 20;
                                                                                        safeSetState(() {});
                                                                                        _model.golestotal = _model.golestotal! + 20;
                                                                                        safeSetState(() {});
                                                                                      }
                                                                                    }
                                                                                  },
                                                                                  child: Stack(
                                                                                    children: [
                                                                                      if (_model.gol5 == 0)
                                                                                        FaIcon(
                                                                                          FontAwesomeIcons.check,
                                                                                          color: Color(0x00057A16),
                                                                                          size: 50.0,
                                                                                        ),
                                                                                      if (_model.gol5 == 20)
                                                                                        FaIcon(
                                                                                          FontAwesomeIcons.check,
                                                                                          color: Color(0xFF057A16),
                                                                                          size: 50.0,
                                                                                        ),
                                                                                      if (_model.gol5 == -20)
                                                                                        Icon(
                                                                                          Icons.close,
                                                                                          color: Color(0xFFA93607),
                                                                                          size: 50.0,
                                                                                        ),
                                                                                    ],
                                                                                  ),
                                                                                ),
                                                                              ],
                                                                            ),
                                                                          ),
                                                                          Align(
                                                                            alignment:
                                                                                AlignmentDirectional(-0.04, -0.85),
                                                                            child:
                                                                                Container(
                                                                              width: 50.0,
                                                                              height: 30.0,
                                                                              decoration: BoxDecoration(
                                                                                color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                borderRadius: BorderRadius.only(
                                                                                  bottomLeft: Radius.circular(20.0),
                                                                                  bottomRight: Radius.circular(20.0),
                                                                                  topLeft: Radius.circular(20.0),
                                                                                  topRight: Radius.circular(20.0),
                                                                                ),
                                                                              ),
                                                                              child: Align(
                                                                                alignment: AlignmentDirectional(0.0, 0.0),
                                                                                child: Text(
                                                                                  _model.golestotal!.toString(),
                                                                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                        font: GoogleFonts.inter(
                                                                                          fontWeight: FontWeight.w800,
                                                                                          fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                        ),
                                                                                        fontSize: 16.0,
                                                                                        letterSpacing: 0.0,
                                                                                        fontWeight: FontWeight.w800,
                                                                                        fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                      ),
                                                                                ),
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        ],
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ),
                                                              ),
                                                              Align(
                                                                alignment:
                                                                    AlignmentDirectional(
                                                                        0.0,
                                                                        0.0),
                                                                child: Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          0.0,
                                                                          36.0),
                                                                  child: Row(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    mainAxisAlignment:
                                                                        MainAxisAlignment
                                                                            .center,
                                                                    children: [
                                                                      Align(
                                                                        alignment: AlignmentDirectional(
                                                                            0.0,
                                                                            1.0),
                                                                        child:
                                                                            FFButtonWidget(
                                                                          onPressed:
                                                                              () async {
                                                                            await EntrenamientosTable().insert({
                                                                              'id_equipo': widget!.listaequipo,
                                                                              'id_jugador': _model.jugselgol,
                                                                              'totalgoles': _model.golestotal,
                                                                            });
                                                                            _model.gol1 =
                                                                                0;
                                                                            _model.gol2 =
                                                                                0;
                                                                            _model.gol3 =
                                                                                0;
                                                                            _model.gol4 =
                                                                                0;
                                                                            _model.gol5 =
                                                                                0;
                                                                            _model.golestotal =
                                                                                0;
                                                                            safeSetState(() {});
                                                                          },
                                                                          text:
                                                                              'Guardar',
                                                                          options:
                                                                              FFButtonOptions(
                                                                            height:
                                                                                30.0,
                                                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                                                16.0,
                                                                                0.0,
                                                                                16.0,
                                                                                0.0),
                                                                            iconPadding: EdgeInsetsDirectional.fromSTEB(
                                                                                0.0,
                                                                                0.0,
                                                                                0.0,
                                                                                0.0),
                                                                            color:
                                                                                FlutterFlowTheme.of(context).primary,
                                                                            textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                                                                                  font: GoogleFonts.interTight(
                                                                                    fontWeight: FlutterFlowTheme.of(context).titleSmall.fontWeight,
                                                                                    fontStyle: FlutterFlowTheme.of(context).titleSmall.fontStyle,
                                                                                  ),
                                                                                  color: Colors.white,
                                                                                  letterSpacing: 0.0,
                                                                                  fontWeight: FlutterFlowTheme.of(context).titleSmall.fontWeight,
                                                                                  fontStyle: FlutterFlowTheme.of(context).titleSmall.fontStyle,
                                                                                ),
                                                                            elevation:
                                                                                0.0,
                                                                            borderRadius:
                                                                                BorderRadius.circular(22.0),
                                                                          ),
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
                                                    ],
                                                  ),
                                                  Stack(
                                                    children: [
                                                      Align(
                                                        alignment:
                                                            AlignmentDirectional(
                                                                0.0, 0.0),
                                                        child: Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      8.0,
                                                                      0.0,
                                                                      8.0,
                                                                      90.0),
                                                          child: Container(
                                                            width: 336.0,
                                                            height: 415.7,
                                                            decoration:
                                                                BoxDecoration(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .secondaryBackground,
                                                              image:
                                                                  DecorationImage(
                                                                fit: BoxFit
                                                                    .contain,
                                                                image:
                                                                    Image.asset(
                                                                  'assets/images/pase.webp',
                                                                ).image,
                                                              ),
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          24.0),
                                                            ),
                                                            child: Stack(
                                                              children: [
                                                                Stack(
                                                                  children: [
                                                                    Align(
                                                                      alignment:
                                                                          AlignmentDirectional(
                                                                              0.0,
                                                                              1.0),
                                                                      child:
                                                                          Padding(
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            10.0,
                                                                            0.0,
                                                                            10.0,
                                                                            10.0),
                                                                        child:
                                                                            Builder(
                                                                          builder:
                                                                              (context) {
                                                                            final jugadores =
                                                                                entrenamientopageJugadoresRowList.map((e) => e).toList();

                                                                            return SingleChildScrollView(
                                                                              scrollDirection: Axis.horizontal,
                                                                              child: Row(
                                                                                mainAxisSize: MainAxisSize.max,
                                                                                children: List.generate(jugadores.length, (jugadoresIndex) {
                                                                                  final jugadoresItem = jugadores[jugadoresIndex];
                                                                                  return Opacity(
                                                                                    opacity: _model.jugselpase == jugadoresItem.id ? 1.0 : 0.6,
                                                                                    child: InkWell(
                                                                                      splashColor: Colors.transparent,
                                                                                      focusColor: Colors.transparent,
                                                                                      hoverColor: Colors.transparent,
                                                                                      highlightColor: Colors.transparent,
                                                                                      onTap: () async {
                                                                                        _model.jugselpase = jugadoresItem.id;
                                                                                        safeSetState(() {});
                                                                                      },
                                                                                      child: ClipRRect(
                                                                                        borderRadius: BorderRadius.circular(8.0),
                                                                                        child: Image.network(
                                                                                          valueOrDefault<String>(
                                                                                            jugadoresItem.fotoJugador,
                                                                                            'https://ataiu.com/futbol/jugadores/fotos/nofoto.webp',
                                                                                          ),
                                                                                          width: _model.jugselpase == jugadoresItem.id ? 80.0 : 74.0,
                                                                                          height: _model.jugselpase == jugadoresItem.id ? 120.0 : 100.0,
                                                                                          fit: BoxFit.cover,
                                                                                        ),
                                                                                      ),
                                                                                    ).animateOnActionTrigger(
                                                                                      animationsMap['imageOnActionTriggerAnimation2']!,
                                                                                    ),
                                                                                  );
                                                                                }),
                                                                              ),
                                                                            );
                                                                          },
                                                                        ),
                                                                      ),
                                                                    ),
                                                                    Align(
                                                                      alignment:
                                                                          AlignmentDirectional(
                                                                              0.0,
                                                                              0.4),
                                                                      child:
                                                                          Padding(
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            20.0,
                                                                            0.0,
                                                                            24.0,
                                                                            0.0),
                                                                        child:
                                                                            Row(
                                                                          mainAxisSize:
                                                                              MainAxisSize.max,
                                                                          mainAxisAlignment:
                                                                              MainAxisAlignment.spaceBetween,
                                                                          children:
                                                                              [
                                                                            InkWell(
                                                                              splashColor: Colors.transparent,
                                                                              focusColor: Colors.transparent,
                                                                              hoverColor: Colors.transparent,
                                                                              highlightColor: Colors.transparent,
                                                                              onTap: () async {
                                                                                if (_model.jugselpase != null) {
                                                                                  if ((_model.pase1 != null) && (_model.pase1 == 20)) {
                                                                                    _model.pase1 = -20;
                                                                                    safeSetState(() {});
                                                                                    _model.pasestotal = _model.pasestotal! + -20;
                                                                                    safeSetState(() {});
                                                                                  } else if ((_model.pase1 != null) && (_model.pase1 == -20)) {
                                                                                    _model.pase1 = 0;
                                                                                    safeSetState(() {});
                                                                                  } else {
                                                                                    _model.pase1 = 20;
                                                                                    safeSetState(() {});
                                                                                    _model.pasestotal = _model.pasestotal! + 20;
                                                                                    safeSetState(() {});
                                                                                  }
                                                                                }
                                                                              },
                                                                              child: Stack(
                                                                                children: [
                                                                                  if (_model.pase1 == 0)
                                                                                    FaIcon(
                                                                                      FontAwesomeIcons.check,
                                                                                      color: Color(0x00057A16),
                                                                                      size: 50.0,
                                                                                    ),
                                                                                  if (_model.pase1 == 20)
                                                                                    FaIcon(
                                                                                      FontAwesomeIcons.check,
                                                                                      color: Color(0xFF057A16),
                                                                                      size: 50.0,
                                                                                    ),
                                                                                  if (_model.pase1 == -20)
                                                                                    Icon(
                                                                                      Icons.close,
                                                                                      color: Color(0xFFA93607),
                                                                                      size: 50.0,
                                                                                    ),
                                                                                ],
                                                                              ),
                                                                            ),
                                                                            InkWell(
                                                                              splashColor: Colors.transparent,
                                                                              focusColor: Colors.transparent,
                                                                              hoverColor: Colors.transparent,
                                                                              highlightColor: Colors.transparent,
                                                                              onTap: () async {
                                                                                if (_model.jugselpase != null) {
                                                                                  if ((_model.pase2 != null) && (_model.pase2 == 20)) {
                                                                                    _model.pase2 = -20;
                                                                                    safeSetState(() {});
                                                                                    _model.pasestotal = _model.pasestotal! + -20;
                                                                                    safeSetState(() {});
                                                                                  } else if ((_model.pase2 != null) && (_model.pase2 == -20)) {
                                                                                    _model.pase2 = 0;
                                                                                    safeSetState(() {});
                                                                                  } else {
                                                                                    _model.pase2 = 20;
                                                                                    safeSetState(() {});
                                                                                    _model.pasestotal = _model.pasestotal! + 20;
                                                                                    safeSetState(() {});
                                                                                  }
                                                                                }
                                                                              },
                                                                              child: Stack(
                                                                                children: [
                                                                                  if (_model.pase2 == 0)
                                                                                    FaIcon(
                                                                                      FontAwesomeIcons.check,
                                                                                      color: Color(0x00057A16),
                                                                                      size: 50.0,
                                                                                    ),
                                                                                  if (_model.pase2 == 20)
                                                                                    FaIcon(
                                                                                      FontAwesomeIcons.check,
                                                                                      color: Color(0xFF057A16),
                                                                                      size: 50.0,
                                                                                    ),
                                                                                  if (_model.pase2 == -20)
                                                                                    Icon(
                                                                                      Icons.close,
                                                                                      color: Color(0xFFA93607),
                                                                                      size: 50.0,
                                                                                    ),
                                                                                ],
                                                                              ),
                                                                            ),
                                                                          ].divide(SizedBox(width: 180.0)),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                    Align(
                                                                      alignment: AlignmentDirectional(
                                                                          -0.04,
                                                                          -0.85),
                                                                      child:
                                                                          Container(
                                                                        width:
                                                                            50.0,
                                                                        height:
                                                                            30.0,
                                                                        decoration:
                                                                            BoxDecoration(
                                                                          color:
                                                                              FlutterFlowTheme.of(context).secondaryBackground,
                                                                          borderRadius:
                                                                              BorderRadius.only(
                                                                            bottomLeft:
                                                                                Radius.circular(20.0),
                                                                            bottomRight:
                                                                                Radius.circular(20.0),
                                                                            topLeft:
                                                                                Radius.circular(20.0),
                                                                            topRight:
                                                                                Radius.circular(20.0),
                                                                          ),
                                                                        ),
                                                                        child:
                                                                            Align(
                                                                          alignment: AlignmentDirectional(
                                                                              0.0,
                                                                              0.0),
                                                                          child:
                                                                              Text(
                                                                            _model.pasestotal!.toString(),
                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                  font: GoogleFonts.inter(
                                                                                    fontWeight: FontWeight.w800,
                                                                                    fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                  ),
                                                                                  fontSize: 16.0,
                                                                                  letterSpacing: 0.0,
                                                                                  fontWeight: FontWeight.w800,
                                                                                  fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                ),
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ],
                                                                ),
                                                                Align(
                                                                  alignment:
                                                                      AlignmentDirectional(
                                                                          0.0,
                                                                          -0.17),
                                                                  child: Row(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    mainAxisAlignment:
                                                                        MainAxisAlignment
                                                                            .spaceEvenly,
                                                                    children: [
                                                                      InkWell(
                                                                        splashColor:
                                                                            Colors.transparent,
                                                                        focusColor:
                                                                            Colors.transparent,
                                                                        hoverColor:
                                                                            Colors.transparent,
                                                                        highlightColor:
                                                                            Colors.transparent,
                                                                        onTap:
                                                                            () async {
                                                                          if (_model.jugselpase !=
                                                                              null) {
                                                                            if ((_model.pase3 != null) &&
                                                                                (_model.pase3 == 20)) {
                                                                              _model.pase3 = -20;
                                                                              safeSetState(() {});
                                                                              _model.pasestotal = _model.pasestotal! + -20;
                                                                              safeSetState(() {});
                                                                            } else if ((_model.pase3 != null) && (_model.pase3 == -20)) {
                                                                              _model.pase3 = 0;
                                                                              safeSetState(() {});
                                                                            } else {
                                                                              _model.pase3 = 20;
                                                                              safeSetState(() {});
                                                                              _model.pasestotal = _model.pasestotal! + 20;
                                                                              safeSetState(() {});
                                                                            }
                                                                          }
                                                                        },
                                                                        child:
                                                                            Stack(
                                                                          children: [
                                                                            if (_model.pase3 ==
                                                                                0)
                                                                              FaIcon(
                                                                                FontAwesomeIcons.check,
                                                                                color: Color(0x00057A16),
                                                                                size: 50.0,
                                                                              ),
                                                                            if (_model.pase3 ==
                                                                                20)
                                                                              FaIcon(
                                                                                FontAwesomeIcons.check,
                                                                                color: Color(0xFF057A16),
                                                                                size: 50.0,
                                                                              ),
                                                                            if (_model.pase3 ==
                                                                                -20)
                                                                              Icon(
                                                                                Icons.close,
                                                                                color: Color(0xFFA93607),
                                                                                size: 50.0,
                                                                              ),
                                                                          ],
                                                                        ),
                                                                      ),
                                                                      InkWell(
                                                                        splashColor:
                                                                            Colors.transparent,
                                                                        focusColor:
                                                                            Colors.transparent,
                                                                        hoverColor:
                                                                            Colors.transparent,
                                                                        highlightColor:
                                                                            Colors.transparent,
                                                                        onTap:
                                                                            () async {
                                                                          if (_model.jugselpase !=
                                                                              null) {
                                                                            if ((_model.pase4 != null) &&
                                                                                (_model.pase4 == 20)) {
                                                                              _model.pase4 = -20;
                                                                              safeSetState(() {});
                                                                              _model.pasestotal = _model.pasestotal! + -20;
                                                                              safeSetState(() {});
                                                                            } else if ((_model.pase4 != null) && (_model.pase4 == -20)) {
                                                                              _model.pase4 = 0;
                                                                              safeSetState(() {});
                                                                            } else {
                                                                              _model.pase4 = 20;
                                                                              safeSetState(() {});
                                                                              _model.pasestotal = _model.pasestotal! + 20;
                                                                              safeSetState(() {});
                                                                            }
                                                                          }
                                                                        },
                                                                        child:
                                                                            Stack(
                                                                          children: [
                                                                            if (_model.pase4 ==
                                                                                0)
                                                                              FaIcon(
                                                                                FontAwesomeIcons.check,
                                                                                color: Color(0x00057A16),
                                                                                size: 50.0,
                                                                              ),
                                                                            if (_model.pase4 ==
                                                                                20)
                                                                              FaIcon(
                                                                                FontAwesomeIcons.check,
                                                                                color: Color(0xFF057A16),
                                                                                size: 50.0,
                                                                              ),
                                                                            if (_model.pase4 ==
                                                                                -20)
                                                                              Icon(
                                                                                Icons.close,
                                                                                color: Color(0xFFA93607),
                                                                                size: 50.0,
                                                                              ),
                                                                          ],
                                                                        ),
                                                                      ),
                                                                      InkWell(
                                                                        splashColor:
                                                                            Colors.transparent,
                                                                        focusColor:
                                                                            Colors.transparent,
                                                                        hoverColor:
                                                                            Colors.transparent,
                                                                        highlightColor:
                                                                            Colors.transparent,
                                                                        onTap:
                                                                            () async {
                                                                          if (_model.jugselpase !=
                                                                              null) {
                                                                            if ((_model.pase5 != null) &&
                                                                                (_model.pase5 == 20)) {
                                                                              _model.pase5 = -20;
                                                                              safeSetState(() {});
                                                                              _model.pasestotal = _model.pasestotal! + -20;
                                                                              safeSetState(() {});
                                                                            } else if ((_model.pase5 != null) && (_model.pase5 == -20)) {
                                                                              _model.pase5 = 0;
                                                                              safeSetState(() {});
                                                                            } else {
                                                                              _model.pase5 = 20;
                                                                              safeSetState(() {});
                                                                              _model.pasestotal = _model.pasestotal! + 20;
                                                                              safeSetState(() {});
                                                                            }
                                                                          }
                                                                        },
                                                                        child:
                                                                            Stack(
                                                                          children: [
                                                                            if (_model.pase5 ==
                                                                                0)
                                                                              FaIcon(
                                                                                FontAwesomeIcons.check,
                                                                                color: Color(0x00057A16),
                                                                                size: 50.0,
                                                                              ),
                                                                            if (_model.pase5 ==
                                                                                20)
                                                                              FaIcon(
                                                                                FontAwesomeIcons.check,
                                                                                color: Color(0xFF057A16),
                                                                                size: 50.0,
                                                                              ),
                                                                            if (_model.pase5 ==
                                                                                -20)
                                                                              Icon(
                                                                                Icons.close,
                                                                                color: Color(0xFFA93607),
                                                                                size: 50.0,
                                                                              ),
                                                                          ],
                                                                        ),
                                                                      ),
                                                                    ].divide(SizedBox(
                                                                        width:
                                                                            10.0)),
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                      Align(
                                                        alignment:
                                                            AlignmentDirectional(
                                                                0.0, 1.0),
                                                        child: Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      0.0,
                                                                      0.0,
                                                                      0.0,
                                                                      36.0),
                                                          child: Row(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .center,
                                                            children: [
                                                              FFButtonWidget(
                                                                onPressed:
                                                                    () async {
                                                                  await EntrenamientosTable()
                                                                      .insert({
                                                                    'id_equipo':
                                                                        widget!
                                                                            .listaequipo,
                                                                    'id_jugador':
                                                                        _model
                                                                            .jugselpase,
                                                                    'totalpases':
                                                                        _model
                                                                            .pasestotal,
                                                                  });
                                                                  _model.pase1 =
                                                                      0;
                                                                  _model.pase2 =
                                                                      0;
                                                                  _model.pase3 =
                                                                      0;
                                                                  _model.pase4 =
                                                                      0;
                                                                  _model.pase5 =
                                                                      0;
                                                                  _model.pasestotal =
                                                                      0;
                                                                  safeSetState(
                                                                      () {});
                                                                },
                                                                text: 'Guardar',
                                                                options:
                                                                    FFButtonOptions(
                                                                  height: 30.0,
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          16.0,
                                                                          0.0,
                                                                          16.0,
                                                                          0.0),
                                                                  iconPadding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          0.0,
                                                                          0.0),
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .primary,
                                                                  textStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .titleSmall
                                                                      .override(
                                                                        font: GoogleFonts
                                                                            .interTight(
                                                                          fontWeight: FlutterFlowTheme.of(context)
                                                                              .titleSmall
                                                                              .fontWeight,
                                                                          fontStyle: FlutterFlowTheme.of(context)
                                                                              .titleSmall
                                                                              .fontStyle,
                                                                        ),
                                                                        color: Colors
                                                                            .white,
                                                                        letterSpacing:
                                                                            0.0,
                                                                        fontWeight: FlutterFlowTheme.of(context)
                                                                            .titleSmall
                                                                            .fontWeight,
                                                                        fontStyle: FlutterFlowTheme.of(context)
                                                                            .titleSmall
                                                                            .fontStyle,
                                                                      ),
                                                                  elevation:
                                                                      0.0,
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              20.0),
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                  Stack(
                                                    children: [
                                                      Align(
                                                        alignment:
                                                            AlignmentDirectional(
                                                                0.0, 0.0),
                                                        child: Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      8.0,
                                                                      0.0,
                                                                      8.0,
                                                                      90.0),
                                                          child: Container(
                                                            width: 336.0,
                                                            height: 415.7,
                                                            decoration:
                                                                BoxDecoration(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .secondaryBackground,
                                                              image:
                                                                  DecorationImage(
                                                                fit: BoxFit
                                                                    .contain,
                                                                image:
                                                                    Image.asset(
                                                                  'assets/images/velocidad.webp',
                                                                ).image,
                                                              ),
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          24.0),
                                                            ),
                                                            child: Stack(
                                                              children: [
                                                                Stack(
                                                                  children: [
                                                                    Align(
                                                                      alignment:
                                                                          AlignmentDirectional(
                                                                              0.0,
                                                                              1.0),
                                                                      child:
                                                                          Padding(
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            10.0,
                                                                            0.0,
                                                                            10.0,
                                                                            10.0),
                                                                        child:
                                                                            Builder(
                                                                          builder:
                                                                              (context) {
                                                                            final jugadores =
                                                                                entrenamientopageJugadoresRowList.map((e) => e).toList();

                                                                            return SingleChildScrollView(
                                                                              scrollDirection: Axis.horizontal,
                                                                              child: Row(
                                                                                mainAxisSize: MainAxisSize.max,
                                                                                children: List.generate(jugadores.length, (jugadoresIndex) {
                                                                                  final jugadoresItem = jugadores[jugadoresIndex];
                                                                                  return Opacity(
                                                                                    opacity: _model.jugselvel == jugadoresItem.id ? 1.0 : 0.6,
                                                                                    child: InkWell(
                                                                                      splashColor: Colors.transparent,
                                                                                      focusColor: Colors.transparent,
                                                                                      hoverColor: Colors.transparent,
                                                                                      highlightColor: Colors.transparent,
                                                                                      onTap: () async {
                                                                                        _model.jugselvel = jugadoresItem.id;
                                                                                        safeSetState(() {});
                                                                                      },
                                                                                      child: ClipRRect(
                                                                                        borderRadius: BorderRadius.circular(8.0),
                                                                                        child: Image.network(
                                                                                          valueOrDefault<String>(
                                                                                            jugadoresItem.fotoJugador,
                                                                                            'https://ataiu.com/futbol/jugadores/fotos/nofoto.webp',
                                                                                          ),
                                                                                          width: _model.jugselvel == jugadoresItem.id ? 80.0 : 74.0,
                                                                                          height: _model.jugselvel == jugadoresItem.id ? 120.0 : 100.0,
                                                                                          fit: BoxFit.cover,
                                                                                        ),
                                                                                      ),
                                                                                    ).animateOnActionTrigger(
                                                                                      animationsMap['imageOnActionTriggerAnimation3']!,
                                                                                    ),
                                                                                  );
                                                                                }),
                                                                              ),
                                                                            );
                                                                          },
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ],
                                                                ),
                                                                Align(
                                                                  alignment:
                                                                      AlignmentDirectional(
                                                                          0.01,
                                                                          -0.61),
                                                                  child:
                                                                      Container(
                                                                    width:
                                                                        80.54,
                                                                    decoration:
                                                                        BoxDecoration(),
                                                                    child:
                                                                        FlutterFlowTimer(
                                                                      initialTime:
                                                                          _model
                                                                              .timerInitialTimeMs1,
                                                                      getDisplayTime:
                                                                          (value) =>
                                                                              StopWatchTimer.getDisplayTime(
                                                                        value,
                                                                        hours:
                                                                            false,
                                                                      ),
                                                                      controller:
                                                                          _model
                                                                              .timerController1,
                                                                      updateStateInterval:
                                                                          Duration(
                                                                              milliseconds: 1000),
                                                                      onChanged: (value,
                                                                          displayTime,
                                                                          shouldUpdate) {
                                                                        _model.timerMilliseconds1 =
                                                                            value;
                                                                        _model.timerValue1 =
                                                                            displayTime;
                                                                        if (shouldUpdate)
                                                                          safeSetState(
                                                                              () {});
                                                                      },
                                                                      textAlign:
                                                                          TextAlign
                                                                              .start,
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .headlineSmall
                                                                          .override(
                                                                            font:
                                                                                GoogleFonts.interTight(
                                                                              fontWeight: FontWeight.normal,
                                                                              fontStyle: FlutterFlowTheme.of(context).headlineSmall.fontStyle,
                                                                            ),
                                                                            color:
                                                                                FlutterFlowTheme.of(context).secondaryBackground,
                                                                            fontSize:
                                                                                timerFontSize,
                                                                            letterSpacing:
                                                                                0.0,
                                                                            fontWeight:
                                                                                FontWeight.normal,
                                                                            fontStyle:
                                                                                FlutterFlowTheme.of(context).headlineSmall.fontStyle,
                                                                          ),
                                                                    ),
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                      Align(
                                                        alignment:
                                                            AlignmentDirectional(
                                                                0.0, 1.0),
                                                        child: Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      0.0,
                                                                      0.0,
                                                                      0.0,
                                                                      40.0),
                                                          child: Row(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .spaceEvenly,
                                                            children: [
                                                              FFButtonWidget(
                                                                onPressed:
                                                                    () async {
                                                                  await EntrenamientosTable()
                                                                      .insert({
                                                                    'id_equipo':
                                                                        widget!
                                                                            .listaequipo,
                                                                    'id_jugador':
                                                                        _model
                                                                            .jugselvel,
                                                                    'velocidad': supaSerialize<
                                                                            DateTime>(
                                                                        DateTime.fromMillisecondsSinceEpoch(
                                                                            _model.timerMilliseconds1)),
                                                                  });
                                                                  _model
                                                                      .timerController1
                                                                      .onResetTimer();
                                                                },
                                                                text: 'Guardar',
                                                                options:
                                                                    FFButtonOptions(
                                                                  height: 30.0,
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          16.0,
                                                                          0.0,
                                                                          16.0,
                                                                          0.0),
                                                                  iconPadding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          0.0,
                                                                          0.0),
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .primary,
                                                                  textStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .titleSmall
                                                                      .override(
                                                                        font: GoogleFonts
                                                                            .interTight(
                                                                          fontWeight: FlutterFlowTheme.of(context)
                                                                              .titleSmall
                                                                              .fontWeight,
                                                                          fontStyle: FlutterFlowTheme.of(context)
                                                                              .titleSmall
                                                                              .fontStyle,
                                                                        ),
                                                                        color: Colors
                                                                            .white,
                                                                        letterSpacing:
                                                                            0.0,
                                                                        fontWeight: FlutterFlowTheme.of(context)
                                                                            .titleSmall
                                                                            .fontWeight,
                                                                        fontStyle: FlutterFlowTheme.of(context)
                                                                            .titleSmall
                                                                            .fontStyle,
                                                                      ),
                                                                  elevation:
                                                                      0.0,
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              22.0),
                                                                ),
                                                              ),
                                                              FFButtonWidget(
                                                                onPressed:
                                                                    () async {
                                                                  if (_model
                                                                          .jugselvel !=
                                                                      null) {
                                                                    _model
                                                                        .timerController1
                                                                        .onStartTimer();
                                                                  }
                                                                },
                                                                text: 'Start',
                                                                options:
                                                                    FFButtonOptions(
                                                                  height: 30.0,
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          16.0,
                                                                          0.0,
                                                                          16.0,
                                                                          0.0),
                                                                  iconPadding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          0.0,
                                                                          0.0),
                                                                  color: Color(
                                                                      0xFF11900B),
                                                                  textStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .titleSmall
                                                                      .override(
                                                                        font: GoogleFonts
                                                                            .interTight(
                                                                          fontWeight: FlutterFlowTheme.of(context)
                                                                              .titleSmall
                                                                              .fontWeight,
                                                                          fontStyle: FlutterFlowTheme.of(context)
                                                                              .titleSmall
                                                                              .fontStyle,
                                                                        ),
                                                                        color: Colors
                                                                            .white,
                                                                        letterSpacing:
                                                                            0.0,
                                                                        fontWeight: FlutterFlowTheme.of(context)
                                                                            .titleSmall
                                                                            .fontWeight,
                                                                        fontStyle: FlutterFlowTheme.of(context)
                                                                            .titleSmall
                                                                            .fontStyle,
                                                                      ),
                                                                  elevation:
                                                                      0.0,
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              24.0),
                                                                ),
                                                              ),
                                                              FFButtonWidget(
                                                                onPressed:
                                                                    () async {
                                                                  _model
                                                                      .timerController1
                                                                      .onStopTimer();
                                                                },
                                                                text: 'Stop',
                                                                options:
                                                                    FFButtonOptions(
                                                                  height: 30.0,
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          16.0,
                                                                          0.0,
                                                                          16.0,
                                                                          0.0),
                                                                  iconPadding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          0.0,
                                                                          0.0),
                                                                  color: Color(
                                                                      0xFFDF291B),
                                                                  textStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .titleSmall
                                                                      .override(
                                                                        font: GoogleFonts
                                                                            .interTight(
                                                                          fontWeight: FlutterFlowTheme.of(context)
                                                                              .titleSmall
                                                                              .fontWeight,
                                                                          fontStyle: FlutterFlowTheme.of(context)
                                                                              .titleSmall
                                                                              .fontStyle,
                                                                        ),
                                                                        color: Colors
                                                                            .white,
                                                                        letterSpacing:
                                                                            0.0,
                                                                        fontWeight: FlutterFlowTheme.of(context)
                                                                            .titleSmall
                                                                            .fontWeight,
                                                                        fontStyle: FlutterFlowTheme.of(context)
                                                                            .titleSmall
                                                                            .fontStyle,
                                                                      ),
                                                                  elevation:
                                                                      0.0,
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              24.0),
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                  Stack(
                                                    children: [
                                                      Align(
                                                        alignment:
                                                            AlignmentDirectional(
                                                                0.0, 0.0),
                                                        child: Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      8.0,
                                                                      0.0,
                                                                      8.0,
                                                                      90.0),
                                                          child: Container(
                                                            width: 336.0,
                                                            height: 415.7,
                                                            decoration:
                                                                BoxDecoration(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .secondaryBackground,
                                                              image:
                                                                  DecorationImage(
                                                                fit: BoxFit
                                                                    .contain,
                                                                image:
                                                                    Image.asset(
                                                                  'assets/images/regate.webp',
                                                                ).image,
                                                              ),
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          24.0),
                                                            ),
                                                            child: Stack(
                                                              children: [
                                                                Stack(
                                                                  children: [
                                                                    Align(
                                                                      alignment:
                                                                          AlignmentDirectional(
                                                                              0.0,
                                                                              1.0),
                                                                      child:
                                                                          Padding(
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            10.0,
                                                                            0.0,
                                                                            10.0,
                                                                            10.0),
                                                                        child:
                                                                            Builder(
                                                                          builder:
                                                                              (context) {
                                                                            final jugadores =
                                                                                entrenamientopageJugadoresRowList.map((e) => e).toList();

                                                                            return SingleChildScrollView(
                                                                              scrollDirection: Axis.horizontal,
                                                                              child: Row(
                                                                                mainAxisSize: MainAxisSize.max,
                                                                                children: List.generate(jugadores.length, (jugadoresIndex) {
                                                                                  final jugadoresItem = jugadores[jugadoresIndex];
                                                                                  return Opacity(
                                                                                    opacity: _model.jugselreg == jugadoresItem.id ? 1.0 : 0.6,
                                                                                    child: InkWell(
                                                                                      splashColor: Colors.transparent,
                                                                                      focusColor: Colors.transparent,
                                                                                      hoverColor: Colors.transparent,
                                                                                      highlightColor: Colors.transparent,
                                                                                      onTap: () async {
                                                                                        _model.jugselreg = jugadoresItem.id;
                                                                                        safeSetState(() {});
                                                                                      },
                                                                                      child: ClipRRect(
                                                                                        borderRadius: BorderRadius.circular(8.0),
                                                                                        child: Image.network(
                                                                                          valueOrDefault<String>(
                                                                                            jugadoresItem.fotoJugador,
                                                                                            'https://ataiu.com/futbol/jugadores/fotos/nofoto.webp',
                                                                                          ),
                                                                                          width: _model.jugselreg == jugadoresItem.id ? 80.0 : 74.0,
                                                                                          height: _model.jugselreg == jugadoresItem.id ? 120.0 : 100.0,
                                                                                          fit: BoxFit.cover,
                                                                                        ),
                                                                                      ),
                                                                                    ).animateOnActionTrigger(
                                                                                      animationsMap['imageOnActionTriggerAnimation4']!,
                                                                                    ),
                                                                                  );
                                                                                }),
                                                                              ),
                                                                            );
                                                                          },
                                                                        ),
                                                                      ),
                                                                    ),
                                                                    Align(
                                                                      alignment: AlignmentDirectional(
                                                                          0.67,
                                                                          -0.57),
                                                                      child:
                                                                          Container(
                                                                        width:
                                                                            73.4,
                                                                        decoration:
                                                                            BoxDecoration(),
                                                                        child:
                                                                            FlutterFlowTimer(
                                                                          initialTime:
                                                                              _model.timerInitialTimeMs2,
                                                                          getDisplayTime: (value) =>
                                                                              StopWatchTimer.getDisplayTime(
                                                                            value,
                                                                            hours:
                                                                                false,
                                                                          ),
                                                                          controller:
                                                                              _model.timerController2,
                                                                          updateStateInterval:
                                                                              Duration(milliseconds: 1000),
                                                                          onChanged: (value,
                                                                              displayTime,
                                                                              shouldUpdate) {
                                                                            _model.timerMilliseconds2 =
                                                                                value;
                                                                            _model.timerValue2 =
                                                                                displayTime;
                                                                            if (shouldUpdate)
                                                                              safeSetState(() {});
                                                                          },
                                                                          textAlign:
                                                                              TextAlign.start,
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .headlineSmall
                                                                              .override(
                                                                                font: GoogleFonts.interTight(
                                                                                  fontWeight: FontWeight.normal,
                                                                                  fontStyle: FlutterFlowTheme.of(context).headlineSmall.fontStyle,
                                                                                ),
                                                                                color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                fontSize: 18.0,
                                                                                letterSpacing: 0.0,
                                                                                fontWeight: FontWeight.normal,
                                                                                fontStyle: FlutterFlowTheme.of(context).headlineSmall.fontStyle,
                                                                              ),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ],
                                                                ),
                                                                Align(
                                                                  alignment:
                                                                      AlignmentDirectional(
                                                                          -0.67,
                                                                          -0.49),
                                                                  child:
                                                                      Container(
                                                                    width: 30.0,
                                                                    height:
                                                                        30.0,
                                                                    decoration:
                                                                        BoxDecoration(
                                                                      color: Colors
                                                                          .white,
                                                                      borderRadius:
                                                                          BorderRadius
                                                                              .only(
                                                                        bottomLeft:
                                                                            Radius.circular(20.0),
                                                                        bottomRight:
                                                                            Radius.circular(20.0),
                                                                        topLeft:
                                                                            Radius.circular(20.0),
                                                                        topRight:
                                                                            Radius.circular(20.0),
                                                                      ),
                                                                    ),
                                                                    child:
                                                                        Align(
                                                                      alignment:
                                                                          AlignmentDirectional(
                                                                              0.0,
                                                                              0.0),
                                                                      child:
                                                                          Text(
                                                                        valueOrDefault<
                                                                            String>(
                                                                          _model
                                                                              .conoderribado
                                                                              .toString(),
                                                                          '0',
                                                                        ),
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .override(
                                                                              font: GoogleFonts.inter(
                                                                                fontWeight: FontWeight.w800,
                                                                                fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                              ),
                                                                              fontSize: 18.0,
                                                                              letterSpacing: 0.0,
                                                                              fontWeight: FontWeight.w800,
                                                                              fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                            ),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ),
                                                                Align(
                                                                  alignment:
                                                                      AlignmentDirectional(
                                                                          -0.63,
                                                                          -0.79),
                                                                  child:
                                                                      InkWell(
                                                                    splashColor:
                                                                        Colors
                                                                            .transparent,
                                                                    focusColor:
                                                                        Colors
                                                                            .transparent,
                                                                    hoverColor:
                                                                        Colors
                                                                            .transparent,
                                                                    highlightColor:
                                                                        Colors
                                                                            .transparent,
                                                                    onTap:
                                                                        () async {
                                                                      if (_model
                                                                              .jugselreg !=
                                                                          null) {
                                                                        _model.conoderribado =
                                                                            _model.conoderribado +
                                                                                1;
                                                                        safeSetState(
                                                                            () {});
                                                                      }
                                                                    },
                                                                    child:
                                                                        Container(
                                                                      width:
                                                                          47.07,
                                                                      height:
                                                                          49.1,
                                                                      decoration:
                                                                          BoxDecoration(
                                                                        color: Color(
                                                                            0x00FFFFFF),
                                                                        borderRadius:
                                                                            BorderRadius.only(
                                                                          bottomLeft:
                                                                              Radius.circular(0.0),
                                                                          bottomRight:
                                                                              Radius.circular(0.0),
                                                                          topLeft:
                                                                              Radius.circular(0.0),
                                                                          topRight:
                                                                              Radius.circular(0.0),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                      Align(
                                                        alignment:
                                                            AlignmentDirectional(
                                                                0.0, 1.0),
                                                        child: Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      0.0,
                                                                      0.0,
                                                                      0.0,
                                                                      40.0),
                                                          child: Row(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .spaceEvenly,
                                                            children: [
                                                              FFButtonWidget(
                                                                onPressed:
                                                                    () async {
                                                                  await EntrenamientosTable()
                                                                      .insert({
                                                                    'id_equipo':
                                                                        widget!
                                                                            .listaequipo,
                                                                    'id_jugador':
                                                                        _model
                                                                            .jugselreg,
                                                                    'tiemporegate': supaSerialize<
                                                                            DateTime>(
                                                                        DateTime.fromMillisecondsSinceEpoch(
                                                                            _model.timerMilliseconds2)),
                                                                    'conoregate':
                                                                        _model
                                                                            .conoderribado,
                                                                  });
                                                                  _model
                                                                      .timerController2
                                                                      .onResetTimer();

                                                                  _model.conoderribado =
                                                                      0;
                                                                  safeSetState(
                                                                      () {});
                                                                },
                                                                text: 'Guardar',
                                                                options:
                                                                    FFButtonOptions(
                                                                  height: 30.0,
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          16.0,
                                                                          0.0,
                                                                          16.0,
                                                                          0.0),
                                                                  iconPadding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          0.0,
                                                                          0.0),
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .primary,
                                                                  textStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .titleSmall
                                                                      .override(
                                                                        font: GoogleFonts
                                                                            .interTight(
                                                                          fontWeight: FlutterFlowTheme.of(context)
                                                                              .titleSmall
                                                                              .fontWeight,
                                                                          fontStyle: FlutterFlowTheme.of(context)
                                                                              .titleSmall
                                                                              .fontStyle,
                                                                        ),
                                                                        color: Colors
                                                                            .white,
                                                                        letterSpacing:
                                                                            0.0,
                                                                        fontWeight: FlutterFlowTheme.of(context)
                                                                            .titleSmall
                                                                            .fontWeight,
                                                                        fontStyle: FlutterFlowTheme.of(context)
                                                                            .titleSmall
                                                                            .fontStyle,
                                                                      ),
                                                                  elevation:
                                                                      0.0,
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              22.0),
                                                                ),
                                                              ),
                                                              FFButtonWidget(
                                                                onPressed:
                                                                    () async {
                                                                  if (_model
                                                                          .jugselreg !=
                                                                      null) {
                                                                    _model
                                                                        .timerController2
                                                                        .onStartTimer();
                                                                  }
                                                                },
                                                                text: 'Start',
                                                                options:
                                                                    FFButtonOptions(
                                                                  height: 30.0,
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          16.0,
                                                                          0.0,
                                                                          16.0,
                                                                          0.0),
                                                                  iconPadding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          0.0,
                                                                          0.0),
                                                                  color: Color(
                                                                      0xFF11900B),
                                                                  textStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .titleSmall
                                                                      .override(
                                                                        font: GoogleFonts
                                                                            .interTight(
                                                                          fontWeight: FlutterFlowTheme.of(context)
                                                                              .titleSmall
                                                                              .fontWeight,
                                                                          fontStyle: FlutterFlowTheme.of(context)
                                                                              .titleSmall
                                                                              .fontStyle,
                                                                        ),
                                                                        color: Colors
                                                                            .white,
                                                                        letterSpacing:
                                                                            0.0,
                                                                        fontWeight: FlutterFlowTheme.of(context)
                                                                            .titleSmall
                                                                            .fontWeight,
                                                                        fontStyle: FlutterFlowTheme.of(context)
                                                                            .titleSmall
                                                                            .fontStyle,
                                                                      ),
                                                                  elevation:
                                                                      0.0,
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              24.0),
                                                                ),
                                                              ),
                                                              FFButtonWidget(
                                                                onPressed:
                                                                    () async {
                                                                  _model
                                                                      .timerController2
                                                                      .onStopTimer();
                                                                },
                                                                text: 'Stop',
                                                                options:
                                                                    FFButtonOptions(
                                                                  height: 30.0,
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          16.0,
                                                                          0.0,
                                                                          16.0,
                                                                          0.0),
                                                                  iconPadding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          0.0,
                                                                          0.0),
                                                                  color: Color(
                                                                      0xFFDF291B),
                                                                  textStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .titleSmall
                                                                      .override(
                                                                        font: GoogleFonts
                                                                            .interTight(
                                                                          fontWeight: FlutterFlowTheme.of(context)
                                                                              .titleSmall
                                                                              .fontWeight,
                                                                          fontStyle: FlutterFlowTheme.of(context)
                                                                              .titleSmall
                                                                              .fontStyle,
                                                                        ),
                                                                        color: Colors
                                                                            .white,
                                                                        letterSpacing:
                                                                            0.0,
                                                                        fontWeight: FlutterFlowTheme.of(context)
                                                                            .titleSmall
                                                                            .fontWeight,
                                                                        fontStyle: FlutterFlowTheme.of(context)
                                                                            .titleSmall
                                                                            .fontStyle,
                                                                      ),
                                                                  elevation:
                                                                      0.0,
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              24.0),
                                                                ),
                                                              ),
                                                            ],
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
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
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
