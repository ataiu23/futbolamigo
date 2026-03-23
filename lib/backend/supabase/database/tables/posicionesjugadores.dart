import '../database.dart';

class PosicionesjugadoresTable extends SupabaseTable<PosicionesjugadoresRow> {
  @override
  String get tableName => 'posicionesjugadores';

  @override
  PosicionesjugadoresRow createRow(Map<String, dynamic> data) =>
      PosicionesjugadoresRow(data);
}

class PosicionesjugadoresRow extends SupabaseDataRow {
  PosicionesjugadoresRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => PosicionesjugadoresTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  String? get tipoposicion => getField<String>('tipoposicion');
  set tipoposicion(String? value) => setField<String>('tipoposicion', value);
}
