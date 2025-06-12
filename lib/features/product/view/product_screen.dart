// ignore_for_file: deprecated_member_use

import 'package:codeedex_test/core/constants/appdiementions.dart';
import 'package:codeedex_test/core/theme/colors.dart';
import 'package:codeedex_test/features/cart/controller/car_provider.dart';
import 'package:codeedex_test/features/cart/view/cart_screen.dart';
import 'package:codeedex_test/features/product/controller/product_provider.dart';
import 'package:codeedex_test/shared/apptext.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProductScreen extends StatefulWidget {
  ProductScreen({super.key,required this.productid});
  int productid;
  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  bool ispageloading = true;
  @override
  void initState() {
    getproduct();
    super.initState();
  }
  getproduct() async {
    await context.read<ProductProvider>().getproduct(context, widget.productid);
    ispageloading = false;
    setState(() {
      
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        shadowColor: Colors.transparent,
        surfaceTintColor: Colors.transparent,
       
      ),
      body: Consumer<ProductProvider>(
        builder: (context,state,child) {
          if (ispageloading) {
            return SizedBox(
              width: double.infinity,
              height: double.infinity,
              child:  Center(
                child: CircularProgressIndicator(
                  strokeWidth: 6,
                  strokeCap: StrokeCap.round,
                  color: AppColor.primarycolor,
                  backgroundColor: AppColor.bordercolor.withOpacity(0.4),
                ),
              ),
            );
          }
          return SizedBox(
            width: double.infinity,
            height: double.infinity,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    color: AppColor.bordercolor.withOpacity(0.4),
                    width: double.infinity,
                    height: MediaQuery.of(context).size.height*0.6,
                    child: Image.network(
                      state.product!.image ?? 'https://static.vecteezy.com/system/resources/thumbnails/053/177/273/small/black-plastic-bottle-with-pump-top-for-liquid-skincare-products-free-png.png',
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) {
                        // Optionally, you can return a placeholder image widget here
                        return Image.network('https://static.vecteezy.com/system/resources/thumbnails/053/177/273/small/black-plastic-bottle-with-pump-top-for-liquid-skincare-products-free-png.png');
                      },
                    ),
                  ),
                  Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(topLeft: Radius.circular(16),topRight: Radius.circular(16)),
                      color: AppColor.white
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(Appdiementions.padding16),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Flexible(child: AppText(text: state.product?.title??'',weight: FontWeight.w600,size: 16,maximumline: 2,))
                            ],
                          ),
                          Appdiementions.gap,
                          AppText(text: state.product?.description??'',maximumline: 5,size: 12,weight: FontWeight.w400,color: AppColor.hintcolor,)
                          
                        ],
                      ),
                    ),
                        
                  )
                ],
              ),
            ),
          );
        }
      ),
      bottomNavigationBar: Container(
        height: 80,
        decoration: BoxDecoration(
          color: AppColor.white,
          border: Border(top: BorderSide(color: AppColor.bordercolor,width: 0.5))
        ),
        child: Padding(
          padding: const EdgeInsets.all(Appdiementions.padding16),
          child: Row(
            children: [
              Expanded(child: Center(child: AppText(text: '₹ ${context.watch<ProductProvider>().product?.price.toString()??'N/A'}',weight: FontWeight.w600,size: 16,))),
              Expanded(
                flex: 2,
                child: ElevatedButton(onPressed: () async{
                  context.read<CartProvider>().addcart(context, context.read<ProductProvider>().product!);
                Navigator.push(context, MaterialPageRoute(builder: (context) => CartScreen(),));
                            },style: ButtonStyle(
                backgroundColor: WidgetStatePropertyAll(AppColor.primarycolor),
                padding: WidgetStatePropertyAll(EdgeInsets.symmetric(horizontal:  16)),
                shape: WidgetStatePropertyAll(RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12.0)
                ))
                            ), child: AppText(text: 'Added to Cart',color: AppColor.white,weight: FontWeight.w400,),))
            ],
          ),
        ),
      ),
    );
  }
}