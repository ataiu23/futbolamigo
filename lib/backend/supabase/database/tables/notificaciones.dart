import '../database.dart';

class NotificacionesTable extends SupabaseTable<NotificacionesRow> {
  @override
  String get tableName => 'notificaciones';

  @override
  NotificacionesRow createRow(Map<String, dynamic> data) =>
      NotificacionesRow(data);
}

class NotificacionesRow extends SupabaseDataRow {
  NotificacionesRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => NotificacionesTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  int? get idEquipo => getField<int>('id_equipo');
  set idEquipo(int? value) => setField<int>('id_equipo', value);

  String? get useridEmisor => getField<String>('userid_emisor');
  set useridEmisor(String? value) => setField<String>('userid_emisor', value);

  String? get asunto => getField<String>('asunto');
  set asunto(String? value) => setField<String>('asunto', value);

  String? get texto => getField<String>('texto');
  set texto(String? value) => setField<String>('texto', value);

  String? get imageSent => getField<String>('image_sent');
  set imageSent(String? value) => setField<String>('image_sent', value);

  String? get pdf => getField<String>('pdf');
  set pdf(String? value) => setField<String>('pdf', value);

  String? get pdfFilename => getField<String>('pdf_filename');
  set pdfFilename(String? value) => setField<String>('pdf_filename', value);

  List<int> get destinatarios => getListField<int>('destinatarios');
  set destinatarios(List<int>? value) =>
      setListField<int>('destinatarios', value);

  List<int> get notificados => getListField<int>('notificados');
  set notificados(List<int>? value) => setListField<int>('notificados', value);
}
