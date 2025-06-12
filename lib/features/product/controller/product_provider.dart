import 'dart:developer';

import 'package:codeedex_test/data/api/urls.dart';
import 'package:codeedex_test/data/service/apiservice.dart';
import 'package:codeedex_test/features/home/model/product_model.dart';
import 'package:flutter/cupertino.dart';

class ProductProvider extends ChangeNotifier {
  

  ProductElement? product;
  getproduct(BuildContext context,int id)async {
    try {
      var res =  await Api.call(context, endpoint: '$getproductallUrl/$id', method: Method.get);
      if (res!=null) {
        product = ProductElement.fromJson(res['product']);
      } 
    } catch (e) {
      log('Something wrong $e');
    }finally{
      notifyListeners();
    }
  }
}