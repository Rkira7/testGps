part of 'gps_bloc.dart';

class GpsState extends Equatable {
  final bool isGpsEnabled;
  final bool isGPSPermissionGrated;

  bool get isAllGranted => isGpsEnabled && isGPSPermissionGrated;

  const GpsState({
    required this.isGpsEnabled,
    required this.isGPSPermissionGrated});

  GpsState copywith({
    bool? isGpsEnabled,
    bool? isGPSPermissionGrated
  }) => GpsState(
      isGpsEnabled: isGpsEnabled ?? this.isGpsEnabled,
      isGPSPermissionGrated: isGPSPermissionGrated ?? this.isGPSPermissionGrated);

  @override
  List<Object> get props => [isGpsEnabled, isGPSPermissionGrated];

  @override
  String toString () => "{isGpsEnabled: $isGpsEnabled, isGPSPermmissionGrated: $isGPSPermissionGrated}";
}


