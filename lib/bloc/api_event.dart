part of 'api_bloc.dart';

@immutable
abstract class ApiEvent {}

class GetDataEvent extends ApiEvent {
  final String key;
  GetDataEvent(this.key);
}
