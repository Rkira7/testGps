import 'package:flutter/material.dart';
import 'screens/screen.dart';

void main() {
  runApp(
      MultiBlocProvider(
        providers: [
          BlocProvider(create: (context)=> GpsBloc())
        ],
        child: const GpsApp()));
}

class GpsApp extends StatelessWidget {

  const GpsApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'GPS APP',
      home: GpsAccessScreen()
    );
  }
}
