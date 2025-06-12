// ignore_for_file: deprecated_member_use

import 'package:codeedex_test/core/constants/appdiementions.dart';
import 'package:codeedex_test/core/theme/colors.dart';
import 'package:codeedex_test/features/cart/controller/car_provider.dart';
import 'package:codeedex_test/features/home/model/product_model.dart';
import 'package:codeedex_test/shared/apptext.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Consumer<CartProvider>(
        builder: (context,state,child) {
          if (state.cartproducts.isEmpty) {
            return SizedBox(
              width: double.infinity,
              height: double.infinity,
              child: Center(child: AppText(text: 'Product Not Found',weight: FontWeight.w500,),),
            );
          }
          return SizedBox(
            width: double.infinity,
            height: double.infinity,
            child: Padding(
              padding: const EdgeInsets.all(Appdiementions.padding16),
              child:ListView.builder(
                itemCount: state.cartproducts.length,
                itemBuilder: (context, index) {
                  ProductElement data = state.cartproducts[index];
                return Column(
                  children: [
                    Row(
                      children: [
                        Container(
                          height: 90,
                          width: 90,
                          decoration: BoxDecoration(
                            color: AppColor.bordercolor.withOpacity(0.4),
                            borderRadius: BorderRadius.circular(12)
                          ),
                          child: Image.network(
                      data.image ?? 'https://static.vecteezy.com/system/resources/thumbnails/053/177/273/small/black-plastic-bottle-with-pump-top-for-liquid-skincare-products-free-png.png',
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) {
                        return Image.network('https://static.vecteezy.com/system/resources/thumbnails/053/177/273/small/black-plastic-bottle-with-pump-top-for-liquid-skincare-products-free-png.png');
                      },
                    ), ),
                        Appdiementions.gaphori16,
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              AppText(text: data.title??'',maximumline: 1,weight: FontWeight.w500,),
                              Appdiementions.gap,
                              Row(
                                children: [
                                  AppText(text: '₹ 3000',weight: FontWeight.w600,),
          
                                  // Spacer(),
                                  Expanded(child: Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                        GestureDetector(
                                        onTap: () {
                                          if (data.quandity>1) {
                                                data.quandity--;
                                          setState(() {
                                            
                                          });
                                          }else{
                                            context.read<CartProvider>().removeprooduct(data);
                                            setState(() {
                                              
                                            });
                                          }
                                      

                                        },
                                        child: Container(
                                          height: 35,
                                          width: 35,
                                                  
                                          decoration: BoxDecoration(
                                            border: Border.all(color: AppColor.bordercolor,width: 0.5),
                                            borderRadius: BorderRadius.circular(8)
                                          ),
                                          child: Center(
                                            child: Icon(Icons.remove_outlined),
                                          ),
                                        ),
                                      )
                                      ,
                                      Appdiementions.gaphori,
                                      AppText(text: '${data.quandity}',weight: FontWeight.w600,),
                                      Appdiementions.gaphori,
                                      GestureDetector(
                                        onTap: () {
                                          data.quandity++;
                                          setState(() {
                                            
                                          });

                                        },
                                        child: Container(
                                          height: 35,
                                          width: 35,
                                          decoration: BoxDecoration(
                                            border: Border.all(color: AppColor.primarycolor.withOpacity(0.7),width: 0.5),
                                            borderRadius: BorderRadius.circular(8)
                                          ),
                                          child: Center(
                                            child: Icon(Icons.add,color: AppColor.primarycolor.withOpacity(0.7),),
                                          ),
                                        ),
                                      )
                                    ],
                                  ))
                                ],
                              )
                            ],
                          ),
                        ),
                     
                      ],
                    ),
                    Appdiementions.gap,
                       Divider(
                          color: AppColor.bordercolor.withOpacity(0.4),
                          thickness: 1,
                        ),
                        Appdiementions.gap,
                  ],
                );
              },)
            ),
          );
        }
      ),
    );
  }
}

snackBar(BuildContext context,
    {required String message,}) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: AppText(text: message)));
}