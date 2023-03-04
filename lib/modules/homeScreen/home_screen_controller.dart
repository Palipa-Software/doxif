import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

import '../../shared/constants/data_model.dart';
import '../../shared/constants/firestore_service.dart';

class HomeScreenController extends GetxController {
  String sensorId = "";
  RxString nem = ''.obs;
  RxString query = "".obs;
  var searchText = ''.obs;
  RxList results = [].obs;
  var myDataList = <Data>[].obs;
  var firebaseAuth = FirebaseAuth.instance;
  FirestoreService firestoreService = FirestoreService();

  void initData() {
    final stream = firestoreService.getStreamData();
    stream.listen((event) {
      myDataList.assignAll(event);
      update();
    });
  }

  Future<void> search(String query) async {
    if (query.isEmpty) {
      results.clear();
    }

    searchText.value = query;

    if (searchText.value.length >= 1) {
      searchText.value = searchText.value
          .replaceRange(0, 1, searchText.value[0].toUpperCase());

      await FirebaseFirestore.instance
          .collection('allRegions')
          .doc(firebaseAuth.currentUser!.uid)
          .collection("regions")
          .where('regionName',
              isGreaterThanOrEqualTo: capitalize(searchText.value))
          .where('regionName', isLessThan: query + 'z')
          .get()
          .then((snapshot) {
        results.value = snapshot.docs;
      });
    }
  }

  String capitalize(String s) {
    if (s == null || s.isEmpty) {
      return s;
    }
    return s[0].toUpperCase() + s.substring(1);
  }

  @override
  void onInit() {
    initData();

    super.onInit();
  }
}
