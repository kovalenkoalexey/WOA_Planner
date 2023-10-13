import 'package:home_project_2/models/route.dart';

abstract class RouteRepository {
  Future<List<FlightRoute>> getRoutes();
}

class MockRouteRepository extends RouteRepository {
  @override
  Future<List<FlightRoute>> getRoutes() {
    return Future.delayed(
        Duration(seconds: 10),
        () => [
              FlightRoute('UNKL-UUEE', 'для Airbus A320', '26.05.2023',
                  '1000 kg', 'images/1.jpg'),
              FlightRoute('LTAI-VIDP', 'для Boeing 737-800', '26.05.2023',
                  '1200 kg', 'images/2.jpg'),
              FlightRoute('UUEE-OMDB', 'для Boeing 747-400', '26.05.2023',
                  '800 kg', 'images/3.jpg'),
              FlightRoute('LGAV-LGIR', 'для Embraer 145', '26.05.2023',
                  '900 kg', 'images/4.jpg'),
              FlightRoute('LOVI-LFMN', 'для Airbus A320', '26.05.2023',
                  '1500 kg', 'images/5.jpg'),
              FlightRoute('ULLI-UUWW', 'для Airbus A300B4-600', '26.05.2023',
                  '790 kg', 'images/6.jpg'),
              FlightRoute('UUWW-URSS', 'для Tupolev 154', '26.05.2023',
                  '110 kg', 'images/7.jpg'),
              FlightRoute('USTR-USRR', 'для Airbus A320', '26.05.2023',
                  '1200 kg', 'images/8.jpg'),
              FlightRoute('UHHH-UHWW', 'для Airbus A321', '26.05.2023',
                  '1600 kg', 'images/9.jpg')
            ]);
  }
}
