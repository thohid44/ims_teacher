import 'dart:convert';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:imsteacher/Service/Api_url.dart';
import 'package:imsteacher/Utils/Constrans/pref_local_store_keys.dart';
import 'package:imsteacher/pages/Subject/model/subject_model.dart';

class SubjectController extends GetxController {
  List<Section> subjectList = <Section>[].obs;

  final _box = GetStorage();

  var url = ApiUrl.baseUrl;
  fetchSubject() async {
    var token = _box.read(LocalStoreKey.token);
    var response =
        await ApiUrl.userClient.get(Uri.parse("$url/sections"), headers: {
      'Accept': 'application/json',
      'Authorization': 'Bearer ' +token,
    });
    var jsonData = json.decode(response.body);
  print(jsonData); 
    if (response.statusCode == 200) {
      SubjectModel subject = SubjectModel.fromJson(jsonData);
      subjectList = subject.sections!;

      update();
    }
  }
}
