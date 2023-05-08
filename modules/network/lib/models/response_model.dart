import 'package:equatable/equatable.dart';

class ResponseModel extends Equatable {
  final int code; //200, etc
  final String message; //error or success message
  final dynamic data;
  const ResponseModel({
    required this.code,
    required this.message,
    required this.data,
  });

  @override
  List<Object?> get props => [code, message];
  @override
  String toString() {
    return 'FailureModel(code: $code, message: $message, data: $data)';
  }
}
