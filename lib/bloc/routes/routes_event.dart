part of 'routes_bloc.dart';

@immutable
abstract class RoutesEvent {}

class RequestRoutesEvent extends RoutesEvent {
  final String? query;

  RequestRoutesEvent(this.query);
}
