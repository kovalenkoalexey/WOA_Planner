class FlightRoute {
  String _routeName;
  String _description;
  String _date;
  String _fuel;
  String _map;

  FlightRoute(this._routeName, this._description, this._date, this._fuel, this._map);

  String get description => _description;

  String get routeName => _routeName;

  String get date => _date;

  String get fuel => _fuel;

  String get map => _map;
}