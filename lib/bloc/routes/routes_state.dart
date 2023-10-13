part of 'routes_bloc.dart';

@immutable
abstract class RoutesState {}
@immutable
class RoutesLoading extends RoutesState {}
class RoutesData extends RoutesState{
  final List<FlightRoute> routes;

  RoutesData(this.routes);
}
