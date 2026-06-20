import 'package:dio/dio.dart';

class YesNoAnswer {
  final _dio = Dio();

  Future<void> getAnswer() async {
    final response = await _dio.get('https://yesno.wtf/api');
  }
}
