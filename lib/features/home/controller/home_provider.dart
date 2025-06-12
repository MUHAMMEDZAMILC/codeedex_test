import 'dart:developer';

import 'package:codeedex_test/data/api/urls.dart';
import 'package:codeedex_test/data/service/apiservice.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';

import '../model/category_model.dart';

class HomeProvider extends ChangeNotifier {

  List<String>? categories = [];
  getcategory(BuildContext context) async {
    try {
      var res = await Api.call(
        context,
        endpoint: getcategoryUrl,
        method: Method.get,
      );
      if (res != null) {
        categories = Categorys.fromJson(res).categories ?? [];
        if (categories!.isNotEmpty) {
           selectedcategory = categories?.first;
        }
       notifyListeners();
      }
    } catch (e) {
      log('Something wrong $e');
    }
  }
  String? selectedcategory;


}
