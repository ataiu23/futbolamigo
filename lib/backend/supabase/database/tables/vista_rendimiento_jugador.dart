import '../database.dart';

class VistaRendimientoJugadorTable
    extends SupabaseTable<VistaRendimientoJugadorRow> {
  @override
  String get tableName => 'vista_rendimiento_jugador';

  @override
  VistaRendimientoJugadorRow createRow(Map<String, dynamic> data) =>
      VistaRendimientoJugadorRow(data);
}

class VistaRendimientoJugadorRow extends SupabaseDataRow {
  VistaRendimientoJugadorRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => VistaRendimientoJugadorTable();

  int? get idJugador => getField<int>('id_jugador');
  set idJugador(int? value) => setField<int>('id_jugador', value);

  int? get idEquipo => getField<int>('id_equipo');
  set idEquipo(int? value) => setField<int>('id_equipo', value);

  int? get totalgolesMedia => getField<int>('totalgoles_media');
  set totalgolesMedia(int? value) => setField<int>('totalgoles_media', value);

  int? get totalpasesMedia => getField<int>('totalpases_media');
  set totalpasesMedia(int? value) => setField<int>('totalpases_media', value);

  int? get totalvelocidadMedia => getField<int>('totalvelocidad_media');
  set totalvelocidadMedia(int? value) =>
      setField<int>('totalvelocidad_media', value);

  int? get totalregateMedia => getField<int>('totalregate_media');
  set totalregateMedia(int? value) => setField<int>('totalregate_media', value);

  int? get mediaFinal => getField<int>('media_final');
  set mediaFinal(int? value) => setField<int>('media_final', value);
}
