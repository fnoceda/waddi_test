import 'package:equatable/equatable.dart';

class FailureModel extends Equatable {
  final int code; //200, etc
  final String message; //error or success message
  const FailureModel({
    required this.code,
    required this.message,
  });

  @override
  List<Object?> get props => [code, message];
  @override
  String toString() {
    return 'FailureModel(code: $code, message: $message)';
  }
}
