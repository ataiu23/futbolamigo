import '../database.dart';

class ClasificacionTable extends SupabaseTable<ClasificacionRow> {
  @override
  String get tableName => 'CLASIFICACION';

  @override
  ClasificacionRow createRow(Map<String, dynamic> data) =>
      ClasificacionRow(data);
}

class ClasificacionRow extends SupabaseDataRow {
  ClasificacionRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => ClasificacionTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  double? get idEquipo => getField<double>('id_equipo');
  set idEquipo(double? value) => setField<double>('id_equipo', value);

  String? get temporada => getField<String>('temporada');
  set temporada(String? value) => setField<String>('temporada', value);

  String? get competicion => getField<String>('competicion');
  set competicion(String? value) => setField<String>('competicion', value);

  String? get jornada => getField<String>('Jornada');
  set jornada(String? value) => setField<String>('Jornada', value);

  int? get posicion => getField<int>('posicion');
  set posicion(int? value) => setField<int>('posicion', value);

  String? get club => getField<String>('club');
  set club(String? value) => setField<String>('club', value);

  String? get logoEquipo => getField<String>('logo_equipo');
  set logoEquipo(String? value) => setField<String>('logo_equipo', value);

  int? get pjugado => getField<int>('Pjugado');
  set pjugado(int? value) => setField<int>('Pjugado', value);

  int? get pganado => getField<int>('Pganado');
  set pganado(int? value) => setField<int>('Pganado', value);

  int? get pempatado => getField<int>('Pempatado');
  set pempatado(int? value) => setField<int>('Pempatado', value);

  int? get pperdido => getField<int>('Pperdido');
  set pperdido(int? value) => setField<int>('Pperdido', value);

  int? get puntos => getField<int>('puntos');
  set puntos(int? value) => setField<int>('puntos', value);
}
