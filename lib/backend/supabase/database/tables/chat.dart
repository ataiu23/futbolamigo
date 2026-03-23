import '../database.dart';

class ChatTable extends SupabaseTable<ChatRow> {
  @override
  String get tableName => 'Chat';

  @override
  ChatRow createRow(Map<String, dynamic> data) => ChatRow(data);
}

class ChatRow extends SupabaseDataRow {
  ChatRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => ChatTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  int? get idequipo => getField<int>('idequipo');
  set idequipo(int? value) => setField<int>('idequipo', value);

  String? get userid => getField<String>('userid');
  set userid(String? value) => setField<String>('userid', value);

  String? get mensaje => getField<String>('mensaje');
  set mensaje(String? value) => setField<String>('mensaje', value);

  String? get imageSent => getField<String>('image_sent');
  set imageSent(String? value) => setField<String>('image_sent', value);

  String? get pdf => getField<String>('pdf');
  set pdf(String? value) => setField<String>('pdf', value);

  String? get pdfFilename => getField<String>('pdf_filename');
  set pdfFilename(String? value) => setField<String>('pdf_filename', value);
}
