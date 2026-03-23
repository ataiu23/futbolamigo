import '../database.dart';

class JaviTable extends SupabaseTable<JaviRow> {
  @override
  String get tableName => 'javi';

  @override
  JaviRow createRow(Map<String, dynamic> data) => JaviRow(data);
}

class JaviRow extends SupabaseDataRow {
  JaviRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => JaviTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  String? get texto => getField<String>('texto');
  set texto(String? value) => setField<String>('texto', value);
}
