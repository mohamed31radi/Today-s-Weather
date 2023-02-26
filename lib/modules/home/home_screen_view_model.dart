import 'package:location/location.dart';
import 'package:weather_to_day/base.dart';

class HomeViewModel<HomeNavigator> extends BaseViewModel {
  Location location = Location();
  PermissionStatus? permissionGranted;
  bool? serviceEnabled;
  LocationData? locationData;

  ///////////////////////////////
  void getCurrentLocation() async {
    var service = await isServiceEnabled();
    if (service == false) return;
    var permission = await isPermissionGranted();
    print('5555555555555555500');
    if (permission == false) return;
    print('44444444444444');

    locationData = await location.getLocation();
    print('_________________________________${locationData
        ?.longitude}________${locationData?.latitude}');
  }

  Future<bool> isServiceEnabled() async {
    serviceEnabled = await location.serviceEnabled();
    if (serviceEnabled == false) {
      serviceEnabled == location.requestService();
      return serviceEnabled!;
    } else {
      return serviceEnabled!;
    }
  }

  Future<bool> isPermissionGranted() async {
    permissionGranted = await location.hasPermission();
    if (permissionGranted == PermissionStatus.denied) {
      permissionGranted = await location.requestPermission();
      return permissionGranted == PermissionStatus.granted;
    } else {
      return permissionGranted == PermissionStatus.granted;
    }
  }
}
