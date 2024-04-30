import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';

class glob extends GetxController {
  final RxBool _is_loading = true.obs;
  final RxDouble _latti = 0.0.obs;
  final RxDouble _longi = 0.0.obs;

  RxBool checkload() => _is_loading;
  RxDouble getlatti() => _latti;
  RxDouble getlongi() => _longi;

  @override
  void onInit() {
    if (_is_loading.isTrue) {
      getlocation();
    }
    super.onInit();
    if(_is_loading.isFalse){}
  }

  void getlocation() async {
    bool isservice;
    LocationPermission lp;
    isservice = await Geolocator.isLocationServiceEnabled();
//check location service
    if (!isservice) {
      return Future.error("Location is not enabled");
    }

    //check loacation enabled
    lp = await Geolocator.checkPermission();
    if (lp == LocationPermission.deniedForever) {
      return Future.error("Location denied");
    }

    if (lp == LocationPermission.denied) {
      lp = await Geolocator.requestPermission();
      if (lp == LocationPermission.denied) {
        return Future.error("LOcaion denied");
      }
    }

    //get current position return
    return await Geolocator.getCurrentPosition(
            desiredAccuracy: LocationAccuracy.high)
        .then((value) {
      _latti.value = value.latitude;
      _longi.value = value.longitude;
      _is_loading.value = false;
    });
  }
}
