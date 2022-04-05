import 'package:flutter/material.dart';
import 'package:gpstest/screens/screen.dart';

class LoadingScreen extends StatelessWidget {
  const LoadingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
   return  Scaffold(
     body: BlocBuilder<GpsBloc, GpsState>(
       builder: (context, state){
         return state.isAllGranted
             ? const MapScreen()
             : const GpsAccessScreen();
       }
     ),
   );
  }
}
