part of 'api_bloc.dart';

@immutable
abstract class ApiState {}

class ApiInitial extends ApiState {}

class ApiLoading extends ApiState {}

class ApiSuccess extends ApiState {
  final String data;
  ApiSuccess(this.data);
}

class ApiFail extends ApiState {
  final String errorMsg;
  ApiFail(this.errorMsg);
}
