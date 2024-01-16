import 'package:notes_app/resource/enums_manager.dart';

class ApiResponseModel {
  ApiStatus status;
  int? stateCode;
  dynamic data;
  String message;
  List<String>? errors;
  int? totalPages;

  ApiResponseModel(
      {required this.status,
      this.data,
      this.message = '',
      this.stateCode,
      this.totalPages,
      this.errors = const []});
}
