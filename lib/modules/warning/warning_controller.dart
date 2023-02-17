import 'package:get/get.dart';

class WarningController extends GetxController {
  RxList warningList = [
    {
      "title": "1 Nolu Arazi İçin Uyarı",
      "subtitle": "1 nolu arazinizde düşük sıcaklık, cam seranızda yüksek nem",
      "ic_path": "sun",
    },
    {
      "title": "3 Nolu Arazi İçin Uyarı",
      "subtitle": "3 Nolu Arazinizde ilaçlama faaliyeti yapmayın.",
      "ic_path": "wind-2",
    },
    {
      "title": "2 Nolu Arazi İçin Uyarı",
      "subtitle": "2 Nolu Araziniz için kuvvetli rüzgar uyarısı.",
      "ic_path": "wind",
    },
    {
      "title": "4 Nolu Arazi İçin Uyarı",
      "subtitle": "4 Nolu Araziniz için yüksek sıcaklık uyarısı.",
      "ic_path": "high_temperature",
    },
    {
      "title": "5 Nolu Arazi İçin Uyarı",
      "subtitle": "5 Nolu Araziniz için yüksek nem uyarısı.",
      "ic_path": "high_humidity",
    }
  ].obs;
}
