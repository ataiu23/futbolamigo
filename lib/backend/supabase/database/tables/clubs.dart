import '../database.dart';

class ClubsTable extends SupabaseTable<ClubsRow> {
  @override
  String get tableName => 'CLUBS';

  @override
  ClubsRow createRow(Map<String, dynamic> data) => ClubsRow(data);
}

class ClubsRow extends SupabaseDataRow {
  ClubsRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => ClubsTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  String? get nombreClub => getField<String>('nombre_club');
  set nombreClub(String? value) => setField<String>('nombre_club', value);

  int? get idFnf => getField<int>('id_fnf');
  set idFnf(int? value) => setField<int>('id_fnf', value);

  String? get logoEquipo => getField<String>('logo_equipo');
  set logoEquipo(String? value) => setField<String>('logo_equipo', value);
}
