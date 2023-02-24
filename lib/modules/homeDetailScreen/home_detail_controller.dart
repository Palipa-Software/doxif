import 'package:firebase_database/firebase_database.dart';
import 'package:get/get.dart';

class HomeDetailController extends GetxController {
  var selectedItem = "Sıcaklık".obs;
  var selectedItem2 = "Şimdi".obs;
  RxString vpd = "".obs;
  RxString soilTemp = "".obs;
  RxString day = "".obs;
  RxString month = "".obs;
  RxString year = "".obs;
  RxString dewPoint = "".obs;
  RxString soilMoisture = "".obs;
  RxString light = "".obs;
  RxString leafTemp = "".obs;
  final databaseRef = FirebaseDatabase.instance.ref("SNB/1222104");

  var items =
      ["Sıcaklık", "Nem", "Işık", "Yaprak Sıcaklığı", "VPD Değerleri"].obs;
  var items2 = ["Şimdi", "7 günlük"].obs;

  void onItemSelected(String newValue) {
    selectedItem(newValue);
  }

  void onItemSelected2(String newValue) {
    selectedItem2(newValue);
  }

  @override
  void onInit() {
    databaseRef.child('vpd').onValue.listen((event) {
      vpd.value = event.snapshot.value.toString();
    });
    databaseRef.child('toprakSic').onValue.listen((event) {
      soilTemp.value = event.snapshot.value.toString();
    });
    databaseRef.child('cigNoktasi').onValue.listen((event) {
      dewPoint.value = event.snapshot.value.toString();
    });
    databaseRef.child('toprakNem').onValue.listen((event) {
      soilMoisture.value = event.snapshot.value.toString();
    });
    databaseRef.child('isik').onValue.listen((event) {
      light.value = event.snapshot.value.toString();
    });
    databaseRef.child('yapSic').onValue.listen((event) {
      leafTemp.value = event.snapshot.value.toString();
    });
    databaseRef.child('gun').onValue.listen((event) {
      day.value = event.snapshot.value.toString();
    });
    databaseRef.child('ay').onValue.listen((event) {
      month.value = event.snapshot.value.toString();
    });
    databaseRef.child('yil').onValue.listen((event) {
      year.value = event.snapshot.value.toString();
    });
  }

  var isOpen = true.obs;
  var isList = true.obs;
}
