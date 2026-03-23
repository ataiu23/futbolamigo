import '../database.dart';

class EquiposTable extends SupabaseTable<EquiposRow> {
  @override
  String get tableName => 'EQUIPOS';

  @override
  EquiposRow createRow(Map<String, dynamic> data) => EquiposRow(data);
}

class EquiposRow extends SupabaseDataRow {
  EquiposRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => EquiposTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  String? get nombreClub => getField<String>('nombre_club');
  set nombreClub(String? value) => setField<String>('nombre_club', value);

  String? get logoClub => getField<String>('logo_club');
  set logoClub(String? value) => setField<String>('logo_club', value);

  String? get imagenEquipo => getField<String>('imagen_equipo');
  set imagenEquipo(String? value) => setField<String>('imagen_equipo', value);

  String? get nombreEquipo => getField<String>('nombre_equipo');
  set nombreEquipo(String? value) => setField<String>('nombre_equipo', value);

  String? get entrenador1 => getField<String>('Entrenador1');
  set entrenador1(String? value) => setField<String>('Entrenador1', value);

  String? get entrenador2 => getField<String>('Entrenador2');
  set entrenador2(String? value) => setField<String>('Entrenador2', value);

  String? get entrenador3 => getField<String>('Entrenador3');
  set entrenador3(String? value) => setField<String>('Entrenador3', value);

  DateTime? get createdAt => getField<DateTime>('created_at');
  set createdAt(DateTime? value) => setField<DateTime>('created_at', value);

  bool? get operativo => getField<bool>('operativo');
  set operativo(bool? value) => setField<bool>('operativo', value);

  String? get modalidad => getField<String>('modalidad');
  set modalidad(String? value) => setField<String>('modalidad', value);
}
