import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/routes/routes_bloc.dart';
import '../../details/route_details.dart';
import '../../models/route.dart';

class FlightRoutesListWidget extends StatefulWidget {
  @override
  _FlightRoutesListState createState() => _FlightRoutesListState();
}

class _FlightRoutesListState extends State<FlightRoutesListWidget> {
  final _searchController = TextEditingController();

  void _searchFlightRoutes() {
    final bloc = BlocProvider.of<RouteBloc>(context);
    final query = _searchController.text;
    bloc.add(RequestRoutesEvent(query));
  }

  @override
  void initState() {
    super.initState();

    _searchController.addListener(_searchFlightRoutes);
  }

  void _onRouteTap(FlightRoute route) {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => FlightRouteInfo(flightRoute: route)));
  }

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      BlocBuilder<RouteBloc, RoutesState>(
        builder: (context, state) {
          if (state is RoutesData) {
            return ListView.builder(
                padding: EdgeInsets.only(top: 70),
                keyboardDismissBehavior:
                    ScrollViewKeyboardDismissBehavior.onDrag,
                itemCount: state.routes.length,
                itemExtent: 163,
                itemBuilder: (BuildContext context, int index) {
                  final flightRoute = state.routes[index];
                  return Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 10),
                      child: Stack(children: [
                        Container(
                          padding: const EdgeInsets.symmetric(
                              vertical: 16, horizontal: 10),
                          decoration: BoxDecoration(
                              //color: Colors.white,
                              border: Border.all(
                                  color: Colors.black.withOpacity(0.2)),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.1),
                                  blurRadius: 8,
                                  offset: Offset(0, 2),
                                ),
                              ]),
                          clipBehavior: Clip.hardEdge,
                          child: Row(
                            children: [
                              // Image(image: AssetImage(movie.imageName)),
                              SizedBox(width: 15),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(width: 20),
                                    Text(
                                      flightRoute.date,
                                      style: TextStyle(color: Colors.grey),
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                    SizedBox(width: 5, height: 25),
                                    Text(
                                      flightRoute.routeName,
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold),
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                    SizedBox(
                                      width: 20,
                                      height: 15,
                                    ),
                                    Text(flightRoute.description,
                                        maxLines: 2,
                                        overflow: TextOverflow.ellipsis)
                                  ],
                                ),
                              ),
                              SizedBox(width: 10)
                            ],
                          ),
                        ),
                        Material(
                          color: Colors.transparent,
                          child: InkWell(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            onTap: () => _onRouteTap(flightRoute),
                          ),
                        )
                      ]));
                });
          }
          return Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
      Padding(
          padding: const EdgeInsets.all(10.0),
          child: TextField(
            controller: _searchController,
            decoration: InputDecoration(
                labelText: 'Поиск',
                filled: true,
                fillColor: Colors.white.withAlpha(235),
                border: OutlineInputBorder()),
          )),
    ]);
  }
}
