import 'dart:convert';

import 'package:flutter_application_cubit/model/data_model.dart';
import 'package:http/http.dart' as http;

class DataServices {
  String basUrl = 'https://0e6fc782-90fd-41ed-940a-1bcf4002771b.mock.pstmn.io/';

 Future <List<DataModel>> getInfo() async {
    var apiUrl = 'getPlaces';

    http.Response res = await http.get(Uri.parse(basUrl + apiUrl));

    try {
      if (res.statusCode == 200) {
        List<dynamic> list = json.decode(res.body);
        print(list);
        return list.map((e) => DataModel.fromJson(e)).toList();
      }else{
        return <DataModel> [];
      }
    } catch (e) {
      print(e);
      return <DataModel>[];
    }
  }
}
