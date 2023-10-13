import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../models/route.dart';
import '../../repository/route_repository.dart';

part 'routes_event.dart';
part 'routes_state.dart';

class RouteBloc extends Bloc<RoutesEvent, RoutesState> {
  final RouteRepository routeRepository;
  RouteBloc(this.routeRepository) : super(RoutesLoading()) {
    on<RoutesEvent>((event, emit) async{ final routes = await routeRepository.getRoutes();
    emit(RoutesLoading());
    if (event is RequestRoutesEvent) {
      if (event.query?.isNotEmpty == true)
      {final filtered = routes.where((FlightRoute route)
      => route.routeName.toLowerCase().contains(event.query!.toLowerCase())
      ).toList();
      emit(RoutesData(filtered));
      }
      else {
        emit(RoutesData(routes));
      }
    }
    });
  }
}
