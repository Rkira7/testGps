
import 'package:permission_handler/permission_handler.dart';

import 'blocs.dart';

part 'gps_event.dart';
part 'gps_state.dart';

class GpsBloc extends Bloc<GpsEvent, GpsState> {

  StreamSubscription? gpsServiceSubscription;

  GpsBloc() : super(const GpsState(isGpsEnabled: false, isGPSPermissionGrated: false)) {

    on<GpsPermissionEvent>((event, emit) {
      emit(state.copywith(
        isGpsEnabled: event.isGpsEnabled,
        isGPSPermissionGrated: event.isGpsPermissionGranted
      ));
    });
    _init();

  }
  Future<void> _init() async{
    //final isEnabled = await _checkGpsStatus();
    //final isGranted = await _isPermissionGranted();

    final gpsInitStatus = await Future.wait({
    _checkGpsStatus(),
    _isPermissionGranted()
    });

    //print("Esta activo el GPS $isEnabled, los permisis estan aceptados $isGranted");
    
    add(GpsPermissionEvent(
        isGpsEnabled: gpsInitStatus[0],
        isGpsPermissionGranted: gpsInitStatus[1]));
  }

  Future<bool> _isPermissionGranted () async{
    bool isGranted = await Permission.location.isGranted;
    return isGranted;
  }
  Future<bool> _checkGpsStatus () async {
    final isEnable = await Geolocator.isLocationServiceEnabled();

   gpsServiceSubscription =  Geolocator.getServiceStatusStream().listen((event) {
      final isEnabled = (event.index == 1)? true:false;
      add(GpsPermissionEvent(
          isGpsEnabled: isEnabled,
          isGpsPermissionGranted: state.isGPSPermissionGrated));
    });

    return isEnable;
  }

  Future<void> askGpsAccess ()async {
    final status = await Permission.location.request();

    switch( status) {

      case PermissionStatus.granted:
        add(GpsPermissionEvent(isGpsEnabled: state.isGPSPermissionGrated, isGpsPermissionGranted: true));
        break;
      case PermissionStatus.denied:
      case PermissionStatus.restricted:
      case PermissionStatus.limited:
      case PermissionStatus.permanentlyDenied:
        add(GpsPermissionEvent(isGpsEnabled: state.isGPSPermissionGrated, isGpsPermissionGranted: false));
        openAppSettings();

    }
  }

  @override
  Future<void> close() {
    gpsServiceSubscription?.cancel();
    return super.close();
  }

}
