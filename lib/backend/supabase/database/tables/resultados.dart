import '../database.dart';

class ResultadosTable extends SupabaseTable<ResultadosRow> {
  @override
  String get tableName => 'RESULTADOS';

  @override
  ResultadosRow createRow(Map<String, dynamic> data) => ResultadosRow(data);
}

class ResultadosRow extends SupabaseDataRow {
  ResultadosRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => ResultadosTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  int? get idEquipo => getField<int>('id_equipo');
  set idEquipo(int? value) => setField<int>('id_equipo', value);

  String? get temporada => getField<String>('temporada');
  set temporada(String? value) => setField<String>('temporada', value);

  String? get competicion => getField<String>('competicion');
  set competicion(String? value) => setField<String>('competicion', value);

  int? get jornada => getField<int>('Jornada');
  set jornada(int? value) => setField<int>('Jornada', value);

  DateTime? get fecha => getField<DateTime>('Fecha');
  set fecha(DateTime? value) => setField<DateTime>('Fecha', value);

  bool? get finalizado => getField<bool>('finalizado');
  set finalizado(bool? value) => setField<bool>('finalizado', value);

  String? get clubLocal => getField<String>('club_Local');
  set clubLocal(String? value) => setField<String>('club_Local', value);

  String? get clubVisitante => getField<String>('club_Visitante');
  set clubVisitante(String? value) => setField<String>('club_Visitante', value);

  int? get golesEquipoLocal => getField<int>('GolesEquipo_Local');
  set golesEquipoLocal(int? value) => setField<int>('GolesEquipo_Local', value);

  int? get golesEquipoVisitante => getField<int>('GolesEquipo_Visitante');
  set golesEquipoVisitante(int? value) =>
      setField<int>('GolesEquipo_Visitante', value);

  String? get iogoclubLocal => getField<String>('iogoclub_local');
  set iogoclubLocal(String? value) => setField<String>('iogoclub_local', value);

  String? get logoclubVisitante => getField<String>('logoclub_visitante');
  set logoclubVisitante(String? value) =>
      setField<String>('logoclub_visitante', value);

  PostgresTime? get hora => getField<PostgresTime>('hora');
  set hora(PostgresTime? value) => setField<PostgresTime>('hora', value);

  List<int> get convocados => getListField<int>('convocados');
  set convocados(List<int>? value) => setListField<int>('convocados', value);

  DateTime? get timestampInicio => getField<DateTime>('timestamp_inicio');
  set timestampInicio(DateTime? value) =>
      setField<DateTime>('timestamp_inicio', value);

  int? get halfNumber => getField<int>('half_number');
  set halfNumber(int? value) => setField<int>('half_number', value);

  int? get ultimaParteFinalizada => getField<int>('ultima_parte_finalizada');
  set ultimaParteFinalizada(int? value) =>
      setField<int>('ultima_parte_finalizada', value);

  List<int> get amarilla => getListField<int>('Amarilla');
  set amarilla(List<int>? value) => setListField<int>('Amarilla', value);

  List<int> get roja => getListField<int>('Roja');
  set roja(List<int>? value) => setListField<int>('Roja', value);

  bool? get federacion => getField<bool>('federacion');
  set federacion(bool? value) => setField<bool>('federacion', value);
}
