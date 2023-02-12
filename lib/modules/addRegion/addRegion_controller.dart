import 'dart:convert';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:tutorai/shared/constants/colors.dart';
import 'package:tutorai/shared/constants/custom_firebase_manager.dart';
import 'package:tutorai/shared/constants/strings.dart';
import 'package:tutorai/shared/widgets/custom_add_region_button.dart';

class AddRegionController extends GetxController {
  final firestore = FirebaseFirestore.instance;
  final TextEditingController regionName = TextEditingController();
  RxString plantTypeFirst = "Biber".obs;
  RxString plantType = "".obs;
  RxString plantVariet = "".obs;
  RxString varietTomato = "Bitki Çeşidi".obs;
  RxString varietPepper = "Bitki Çeşidi".obs;
  RxString selectedDate = "".obs;
  Rx<File?> image = null.obs;
  String plantImage = "";
  RxString plantImagePath = "".obs;
  RxInt index = 0.obs;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  RxList<dynamic> deneme = [].obs;

  Stream<QuerySnapshot> getPlants() {
    var ref = firestore.collection("plantsType").snapshots();
    return ref;
  }

  Future<dynamic> addRegion() async {
    Map<String, dynamic> regions = {
      "regionName": regionName.text,
      "plantType": plantType.value,
      "plantVariet": plantVariet.value,
      "plantingDate": selectedDate.value,
      "sensorId": "222222",
    };
    CollectionReference addRegion = firestore
        .collection("users")
        .doc(_auth.currentUser?.uid)
        .collection("regions");

    var response = await addRegion.doc(regionName.text).set(regions);
    successDialog();
    return response;
  }

  void getImage() {
    plantImage = plantType.value.toLowerCase();
    switch (plantImage) {
      case "":
        {
          // plantImage = "";
          print("plantimage:$plantImage");
          print("1");
        }
        break;

      case "domates":
        {
          // plantImage = "domates";
          plantImagePath.value = "domates";
          print("plantimage:$plantImage");
          print("2");
        }
        break;

      case "biber":
        {
          // plantImage = "biber";
          plantImagePath.value = "biber";
          print("plantimage:$plantImage");
          print("3");
        }
        break;
      case "patlıcan":
        {
          // plantImage = "patlıcan";
          plantImagePath.value = "patlıcan";
          print("plantimage:$plantImage");
          print("4");
        }
        break;
      case "kabak":
        {
          // plantImage = "kabak";
          plantImagePath.value = "kabak";
          print("plantimage:$plantImage");
          print("5");
        }
        break;
      case "kavun":
        {
          // plantImage = "kavun";
          plantImagePath.value = "kavun";
          print("plantimage:$plantImage");
          print("6");
        }
        break;
      case "hıyar":
        {
          // plantImage = "hıyar";
          plantImagePath.value = "hıyar";
          print("plantimage:$plantImage");
          print("7");
        }
        break;

      default:
        {
          //statements;
        }
        break;
    }
  }

  @override
  Future<void> onInit() async {
    // TODO: implement onInit
    super.onInit();
    await getPlants();
  }
  // Future<void> pickImage() async {
  //   try {
  //     final pickedFile =
  //         await ImagePicker().pickImage(source: ImageSource.camera);
  //     if (pickedFile != null) {
  //       image.update(
  //         (val) {
  //           // val değeri bir önceki pathi tutuyor burada
  //           image = File(pickedFile.path).obs;
  //         },
  //       );
  //       print(image);
  //     }
  //     return;
  //   } on PlatformException {
  //     print("Error.");
  //   }
  // }

  void successDialog() {
    if (regionName.text.isNotEmpty &&
        plantType.isNotEmpty &&
        plantVariet.isNotEmpty &&
        selectedDate.isNotEmpty) {
      print(
        "Bölge Başarıyla Eklendi\nBölge İsmi:${regionName.text}\nBitki Türü:${plantType.value}\nBitki Çeşidi:${plantVariet.value}\nDikim Tarihi:${selectedDate.value}",
      );
      Get.defaultDialog(
        barrierDismissible: false,
        titlePadding: EdgeInsets.zero,
        title: "",
        middleText: "",
        content: Column(
          children: [
            Container(
              width: 100.w,
              height: 15.h,
              decoration: BoxDecoration(
                image: const DecorationImage(
                  image: AssetImage(
                    "assets/images/success-dialog-icon.png",
                  ),
                  filterQuality: FilterQuality.high,
                ),
                color: AppColors.appColor.withOpacity(.3),
                borderRadius: BorderRadius.circular(
                  16.sp,
                ),
              ),
            ),
            SizedBox(
              height: 1.h,
            ),
            Text(
              AppStrings.successDialogTitle,
              style: TextStyle(
                fontFamily: "Rubik Bold",
                fontSize: 12.sp,
              ),
            ),
            SizedBox(
              height: 2.h,
            ),
            Text(
              AppStrings.successDialogSubtitle,
              style: TextStyle(
                fontFamily: "Rubik Regular",
                // fontWeight: FontWeight.w100,
                fontSize: 11.sp,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: 3.h,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 2.w),
              child: CustomButton(
                func: () {
                  regionName.clear();
                  plantType.value = "";
                  plantVariet.value = "";
                  plantTypeFirst.value = "Bitki Türü";
                  varietTomato.value = "Bitki Çeşidi";
                  varietPepper.value = "Bitki Çeşidi";
                  selectedDate.value = "";
                  Get.back();
                },
                title: "Tamam",
                controller: this,
              ),
            )
          ],
        ),
      );
    } else {
      print(
        "Bölge Başarıyla Eklendi\nBölge İsmi:${regionName.text}\nBitki Türü:${plantType.value}\nBitki Çeşidi:${plantVariet.value}\nDikim Tarihi:${selectedDate.value}",
      );
      Get.snackbar("Title", "Message",
          backgroundColor: AppColors.appColor.withOpacity(.8),
          titleText: Text(
            AppStrings.errorTitle,
            style: TextStyle(
              fontFamily: "Rubik Bold",
              fontSize: 12.sp,
              color: AppColors.white,
            ),
          ),
          messageText: Text(
            AppStrings.errorSubtitle,
            style: TextStyle(
              fontSize: 10.sp,
              fontFamily: "Rubik Regular",
              color: AppColors.white,
            ),
          ));
    }
  }

  List<String> plants = [
    "Bitki Türü",
    "Domates",
    "Biber",
    "Patlıcan",
    "Hıyar",
    "Kabak",
    "Kavun"
  ];
  List<String> tomatoVariet = [
    "Bitki Çeşidi",
    "E-Z Tohumculuk",
    "Asgen Tohum",
    "Syngenta",
    "Nunhems",
    "Petektar",
    "Gento",
    "Multi",
    "Motto",
    "Hazera",
    "Seminis",
    "Axia Tohum",
    "Tofida",
    "AG Tohum",
    "Yüksel",
    "Hasel",
    "Genetika",
    "Seraseed",
    "Proto",
    "Manier",
    "Santagro",
    "Troya",
    "Beyaz Tohum",
    "Amc Tr",
    "Antema",
    "İntfa",
    "Agromar",
    "South Fidagro",
    "Tasaco",
    "Genagri",
    "Anamas",
    "Sakata",
    "Vilmorin Anadolu Tohum",
    "Argeto",
    "Sinerji Tohum",
    "Titiz Agro",
    "Çağdaş",
    "2000 Tarım",
    "Hmclause",
    "İngsseeds",
    "Aroma",
    "Detay",
    "Antalya Tarım Tohum",
    "Ngsseeds",
    "Dane Tohum",
    "Hektaş",
    "Rijkzwaan",
    "SFT Tarım",
    "Fito",
  ];

  List<String> pepperVariet = [
    "Bitki Çeşidi",
    "Kimera",
    "Yalçın",
    "30 - 55",
    "Kanyon",
    "Kumsal",
    "Reis",
    "Safran",
    "Samuray",
    "37 - 42",
    "Habib",
    "Kalouthca",
    "Urartu",
    "Uygar",
    "Kapizera",
    "Bellisa(35 508)",
    "Serenad",
    "Artis",
    "Aydemir",
    "Capitol",
    "Diyar",
    "Florita",
    "Cakabey",
    "Kasaba",
    "Odin",
    "Demirbilek",
    "Yükselince",
    "Özgülcan",
    "Emre",
    "Atlantis",
    "Assia",
    "Lotus Pailin",
    "Uslu",
    "Demrisa",
    "Flinta",
    "Leyla",
    "Balca",
    "Cömert",
    "Efes",
    "Erciyes",
    "Mert",
    "Mertcan",
    "Mutlu",
    "S2",
    "Spice",
    "Şölen",
    "Zarif",
    "Vural",
    "Topkapı",
    "Lodos",
    "Efsun",
    "A-Z 20",
    "Bafra",
    "Akra",
    "Pars",
    "Efests",
    "Erciyes Rene",
    "Neyzen",
    "Balamir",
    "Benino",
    "Doğanay",
    "Mızrak",
    "Mostar",
    "Desna",
    "Ergenekon",
    "Kundu",
    "Ozan",
    "Punto",
    "Yurt",
    "Tubby",
    "Bade",
    "Toprido",
    "Efendi",
    "Armada",
    "Dilber",
    "Doddo",
    "Zafer",
    "Tesla",
    "Sumo",
    "İstek",
    "Nundol NUN 3171",
    "Sobek",
    "Köyüm",
    "Buket",
    "Üçburun",
    "Dilek",
    "Elmas",
    "Muzzo",
    "Efebey",
    "Hyffae",
    "Negro",
    "Taco",
    "Çoban",
    "Erdem",
    "Ertuğrul",
    "Fortune",
    "Harman",
    "Hayat",
    "HT 10",
    "İlbay",
    "Kılçık Plus",
    "Kılıç",
    "Muluk",
    "Nare",
    "Nova",
    "Odin Plus",
    "Olca",
    "Özen",
    "Pusula",
    "Rüzgar",
    "Takıl",
    "Tanaz",
    "Varol",
    "Briot",
    "Ersan",
    "Hunty",
    "Heves",
    "Jalomex",
    "Macarino",
    "Saruhan",
    "Yerebakan",
    "Al-han",
    "Alperen",
    "İdolisa",
    "Meydan",
    "Redlion",
    "Savarona",
    "SF 549",
    "Simena",
    "Zaruri",
    "Kibar",
    "Turkuaz",
    "Üçağız",
    "ASG 407",
    "Egeli",
    "Kasırga",
    "Kingbel",
    "Kupa",
    "Lotus LT34",
    "A 3055",
    "Bingo",
    "Hotstar",
    "Irmak",
    "Klas",
    "Lidya",
    "Oyunbozan",
    "Papel",
    "Sharlo",
    "Şahin",
    "Yaman",
    "Yelken",
    "Zıpkın",
  ];
}
