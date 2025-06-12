import 'dart:developer';

import 'package:codeedex_test/data/api/urls.dart';
import 'package:codeedex_test/data/service/apiservice.dart';
import 'package:codeedex_test/features/home/model/product_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';

import '../model/category_model.dart';

class HomeProvider extends ChangeNotifier {

  List<String> categories = [];
  getcategory(BuildContext context) async {
    try {
      var res = await Api.call(
        context,
        endpoint: getcategoryUrl,
        method: Method.get,
      );
      if (res != null) {
        categories = Categorys.fromJson(res).categories ?? [];
       notifyListeners();
      }
    } catch (e) {
      log('Something wrong $e');
    }finally{
      notifyListeners();
    }
  }
  String? selectedcategory ='All';

  changecategory(BuildContext context,String category) async {
    selectedcategory = category;
    notifyListeners();
    await getproduct(context);
  }

  // product gettings 
  List<ProductElement> products = [];
  getproduct(BuildContext context) async {
    try {

      var url ='';
      if (selectedcategory =='All') {
        url = getproductallUrl;
      }else{
        url = '$getcategoryUrl?type=$selectedcategory';
      }
      var res = await Api.call(context, endpoint: url, method: Method.get);
      if (res!=null) {
        products = Product.fromJson(res).products??[];
      }
    } catch (e) {
      log('Something went wrong $e');
    }finally{
      notifyListeners();
    }
  }
  
}
