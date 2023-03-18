import 'dart:convert';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:imsteacher/Service/Api_url.dart';
import 'package:imsteacher/Utils/Constrans/pref_local_store_keys.dart';

import '../model/student_wise_atten_model.dart';

class StudentWiseController extends GetxController {
  var isLoad = false.obs;

  final _box = GetStorage();

  var url = ApiUrl.baseUrl;

  fetchStudent() async {
    var token = _box.read(LocalStoreKey.token);
    print(token);
    try {
      String url2 =
          '$url/student-wise-attendance?studentId=UHS23SSC012&month=03&year=2023';

      var response = await ApiUrl.userClient.get(Uri.parse(url2), headers: {
        'Accept': 'application/json',
        'Authorization': 'Bearer ' + token,
      });

      var data = json.decode(response.body);
      print(data);
      if (response.statusCode == 200) {
        isLoad(true);
        update();
        return StudentWiseAttenModel.fromJson(data);
      } else {
        return null;
      }
    } catch (e) {
      print(e.toString());
    }
    update();
  }
}
