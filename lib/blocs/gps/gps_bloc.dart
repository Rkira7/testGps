import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'gps_event.dart';
part 'gps_state.dart';

class GpsBloc extends Bloc<GpsEvent, GpsState> {
  GpsBloc() : super(const GpsState(isGpsEnabled: false, isGPSPermissionGrated: false)) {

    on<GpsPermissionEvent>((event, emit) {
      emit(state.copywith(
        isGpsEnabled: event.isGpsEnabled,
        isGPSPermissionGrated: event.isGpsPermissionGranted
      ));
    });

  }
}
