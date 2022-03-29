import 'package:flutter/material.dart';
import 'package:gpstest/screens/screen.dart';

const probarcopy = TextStyle(fontSize: 25, fontWeight: FontWeight.w300);


class GpsAccessScreen extends StatelessWidget {
  const GpsAccessScreen({Key? key}) : super(key: key);

   @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
            child: BlocBuilder<GpsBloc, GpsState>(
              builder: (context, state) {
                debugPrint(state.toString());
                return state.isGpsEnabled
                    ?const _EnableGPSMessage()
                    :const _AccessButtom();
              },
            )));
  }
}

class _AccessButtom extends StatelessWidget {
  const _AccessButtom({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text("Es necesario el acceso a GPS"),
        MaterialButton(
            child: Text("Solicitar Acceso",
                style: probarcopy.copyWith(fontSize: 20, color: Colors.white)),
            color: Colors.black,
            shape: const StadiumBorder(),
            elevation: 0,
            splashColor: Colors.transparent,
            onPressed: () {
              //TODO: por hacer
            })
      ],
    );
  }
}

class _EnableGPSMessage extends StatelessWidget {
  const _EnableGPSMessage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Text("Debe de habilitar el GPS",
        style: probarcopy);
  }
}
