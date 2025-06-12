import 'package:codeedex_test/features/cart/view/cart_screen.dart';
import 'package:codeedex_test/features/home/model/product_model.dart';
import 'package:flutter/cupertino.dart';

class CartProvider extends ChangeNotifier {
  

  List<ProductElement> cartproducts=[];
  addcart(BuildContext context,ProductElement product){
    if (cartproducts.any((element) => element.id == product.id,)) {
      snackBar(context, message: 'Already Added');
    }else{
      cartproducts.add(product);
    }
    notifyListeners();
  }
  removeprooduct(ProductElement product){
    cartproducts.remove(product);
    notifyListeners();
  }
}