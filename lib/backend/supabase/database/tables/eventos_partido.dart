import '../database.dart';

class EventosPartidoTable extends SupabaseTable<EventosPartidoRow> {
  @override
  String get tableName => 'Eventos_partido';

  @override
  EventosPartidoRow createRow(Map<String, dynamic> data) =>
      EventosPartidoRow(data);
}

class EventosPartidoRow extends SupabaseDataRow {
  EventosPartidoRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => EventosPartidoTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  int? get idPartido => getField<int>('id_partido');
  set idPartido(int? value) => setField<int>('id_partido', value);

  String? get tipoEvento => getField<String>('tipo_evento');
  set tipoEvento(String? value) => setField<String>('tipo_evento', value);

  String? get counter => getField<String>('counter');
  set counter(String? value) => setField<String>('counter', value);

  int? get jugadoramigo => getField<int>('jugadoramigo');
  set jugadoramigo(int? value) => setField<int>('jugadoramigo', value);

  String? get jugadorGolAmigo => getField<String>('JugadorGolAmigo');
  set jugadorGolAmigo(String? value) =>
      setField<String>('JugadorGolAmigo', value);
}
