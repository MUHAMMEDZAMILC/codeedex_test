import 'package:codeedex_test/core/constants/appconstants.dart';
import 'package:codeedex_test/core/constants/appdiementions.dart';
import 'package:codeedex_test/core/theme/colors.dart';
import 'package:codeedex_test/features/home/controller/home_provider.dart';
import 'package:codeedex_test/features/home/model/product_model.dart';
import 'package:codeedex_test/features/product/view/product_screen.dart';
import 'package:codeedex_test/shared/apptext.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScree extends StatefulWidget {
  const HomeScree({super.key});

  @override
  State<HomeScree> createState() => _HomeScreeState();
}

class _HomeScreeState extends State<HomeScree> {
  TextEditingController searchCtrl = TextEditingController();
  bool ispageloading = true,productloading= false;
  @override
  void initState() {
    getdata();
       
    super.initState();
  }
  getdata()async{
      await   context.read<HomeProvider>().getcategory(context);
      await context.read<HomeProvider>().getproduct(context);
      ispageloading = false;
      setState(() {
        
      });

  }
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: AppText(text: 'Discover',),
        actionsPadding: EdgeInsets.all(Appdiementions.padding),
        actions: [
          Stack(
            children: [
              Container(
                width: 50,
                height: 50,
                decoration:BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: AppColor.bordercolor)
                ),
                child: Icon(Icons.shopping_bag_outlined),
              ),
              Positioned(
                top: 0,
                right: 0,
                child: CircleAvatar(
                  radius: 8,
                  backgroundColor: AppColor.primarycolor,
                  child: AppText(text: '3',color: AppColor.white,weight: FontWeight.w400,size: 10,),
                ),
              )
            ],
          )
        ],
      ),
      body: Consumer<HomeProvider>(
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
            child: Padding(
              padding:  EdgeInsets.all(Appdiementions.padding16),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    TextFormField(controller:searchCtrl,
                    
                    decoration: InputDecoration(
                      fillColor: AppColor.bordercolor.withOpacity(0.3),
                      filled: true,
                      hintText: 'Search',
                      hintStyle: TextStyle(
                        color: AppColor.hintcolor,
                        fontSize: 12,
                      ),
                      border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.circular(Appdiementions.padding16)
                      ),
                      suffixIcon: Icon(CupertinoIcons.search) 
                    ),),
                    Appdiementions.gap16,
                    Stack(
                      children: [
                        Container(
                          width: double.infinity,
                          height: 150,
                          decoration: BoxDecoration(
                            color: AppColor.primarycolor,
                            borderRadius: BorderRadius.circular(Appdiementions.padding16)
                          ),
                        ),
                        SizedBox(
                          width: double.infinity,
                          height: 150,
                          child: Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(Appdiementions.padding16),
                                child: Column(
                                  children: [
                                    AppText(text: 'Clearance\nSales',size: 24,color: AppColor.white,weight: FontWeight.w500,)
                                  ],
                                ),
                              ),
                              Expanded(child: SizedBox(
                                height: 400,
                                width: 400,
                                child: Center(child: Image.asset('assets/images/phone.png',height: 200,width: 200,fit: BoxFit.cover,))))
                            ],
                          ),
                          
                        ),
                      ],
                    ),
                    Appdiementions.gap16,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        AppText(text: 'Categories'),
                        AppText(text: 'See All',color: AppColor.primarycolor,),
                      ],
                    ),
                    Appdiementions.gap,
                    SizedBox(
                      width: double.infinity,
                      height: 30,
                      child: Row(
                        children: [
                          Padding(
                                padding: const EdgeInsets.only(right:  8.0),
                                child: GestureDetector(
                                  onTap: () async{
                                    productloading=true;
                                    setState(() {
                                      
                                    });
                                    await context.read<HomeProvider>().changecategory(context, 'All');
                                     productloading=false;
                                    setState(() {
                                      
                                    });
                                  },
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color:state.selectedcategory=='All'?AppColor.primarycolor: AppColor.white,
                                      borderRadius: BorderRadius.circular(Appdiementions.padding),
                                      border: Border.all(color:state.selectedcategory=='All'?Colors.transparent: AppColor.black)
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(horizontal:  12.0),
                                      child: Center(child: AppText(text: 'All',color: state.selectedcategory=='All'?AppColor.white:null,)),
                                    ),
                                  ),
                                ),
                              ),
                            
                          Expanded(
                            child: ListView.builder(
                              itemCount: state.categories?.length,
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (context, index) {
                              return Padding(
                                padding: const EdgeInsets.only(right:  12.0),
                                child: GestureDetector(
                                   onTap: () async{
                                     productloading=true;
                                    setState(() {
                                      
                                    });
                                    await 
                                    context.read<HomeProvider>().changecategory(context, state.categories![index],);
                                     productloading=false;
                                    setState(() {
                                      
                                    });
                                  },
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color: state.selectedcategory== state.categories![index]?AppColor.primarycolor: AppColor.white,
                                      borderRadius: BorderRadius.circular(Appdiementions.padding),
                                      border: Border.all(color:  state.selectedcategory== state.categories![index]?Colors.transparent:AppColor.black)
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(horizontal:  8.0),
                                      child: Center(child: AppText(text: state.categories![index],color: state.selectedcategory== state.categories![index]?AppColor.white:null,)),
                                    ),
                                  ),
                                ),
                              );
                            },),
                          ),
                        ],
                      ),
                    ),
                    Appdiementions.gap16,
                
                
                SizedBox(
                  child: GridView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 1 / 1.3,
                    mainAxisSpacing: Appdiementions.padding16,
                    crossAxisSpacing: Appdiementions.padding16,
                  ),
                  itemCount: state.products.length, 
                  itemBuilder: (context, index) {
                    ProductElement data = state.products[index];
                    return GestureDetector(
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => ProductScreen(productid: data.id!),));
                      },
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: Container(
                              decoration: BoxDecoration(
                                      color: AppColor.bordercolor.withOpacity(0.4),
                                      borderRadius: BorderRadius.circular(Appdiementions.padding16),
                              ),
                              child: Center(
                                      child: SizedBox(
                                        width: 100,
                                        height: 100,
                                        child: Image.network(
                      data.image??'https://static.vecteezy.com/system/resources/thumbnails/053/177/273/small/black-plastic-bottle-with-pump-top-for-liquid-skincare-products-free-png.png',
                      scale: 2,
                      errorBuilder: (context, error, stackTrace) => Image.network('https://static.vecteezy.com/system/resources/thumbnails/053/177/273/small/black-plastic-bottle-with-pump-top-for-liquid-skincare-products-free-png.png'),
                                        ),
                                      ),
                              ),
                            ),
                          ),
                          Appdiementions.gapSmall,
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              AppText(
                                      text: data.title??'',
                                      color: AppColor.hintcolor,
                                      maximumline: 2,
                                      size: 12,
                              ),
                              AppText(
                                      text: data.price.toString(),
                                      color: AppColor.black,
                                      size: 14,
                                      weight: FontWeight.w500,
                              ),
                            ],
                          ),
                        ],
                      ),
                    );
                  },
                ),
                
                ),
                
                  ],
                ),
              ),
            ),
          );
        }
      ),
    );
  }
}