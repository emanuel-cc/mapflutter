import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong/latlong.dart';
 
void main() => runApp(MyApp());
 
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: Mapa()
    );
  }
}

class Mapa extends StatefulWidget {
  @override
  _MapaState createState() => _MapaState();
}

class _MapaState extends State<Mapa> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Mapa'),
      ),
      body: FlutterMap(
        options: MapOptions(
          center: LatLng(51.5,-0.09),
          zoom: 13.0
        ),
        layers: [
          TileLayerOptions(
            urlTemplate: "https://api.mapbox.com/v4/"
            "{id}/{z}/{x}/{y}@2x.png?access_token={accessToken}",
            additionalOptions: {
              'accessToken':  'pk.eyJ1IjoiZW1hbnVlbDIyMTEiLCJhIjoiY2p6b2F2bHpoMGQxdjNocDRvMTlreHk0eiJ9.TiGJwVpLcdT3eAAmRgxyRg',
              'id': 'mapbox.streets'
            }
          ),
          MarkerLayerOptions(
            markers: [
              Marker(
                width: 80.0,
                height: 80.0,
                point: LatLng(51.5, -0.09),
                builder: (ctx)=>Container(
                  child:FlutterLogo()
                )
              )
            ]
          )
        ],
      ),
    );
  }
}