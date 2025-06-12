import 'package:codeedex_test/core/constants/appconstants.dart';
import 'package:codeedex_test/core/constants/appdiementions.dart';
import 'package:codeedex_test/core/theme/colors.dart';
import 'package:codeedex_test/features/home/controller/home_provider.dart';
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
  @override
  void initState() {
      context.read<HomeProvider>().getcategory(context);
    super.initState();
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
                  child: AppText(text: '3',style: TextStyle(color: AppColor.white,fontWeight: FontWeight.w400,fontSize: 10),),
                ),
              )
            ],
          )
        ],
      ),
      body: Consumer<HomeProvider>(
        builder: (context,state,child) {
          return SizedBox(
            width: double.infinity,
            height: double.infinity,
            child: Padding(
              padding:  EdgeInsets.all(Appdiementions.padding16),
              child: SingleChildScrollView(
                child: Column(
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
                                    AppText(text: 'Clearance\nSales',style: TextStyle(fontSize: 24,color: AppColor.white,fontWeight: FontWeight.w500),)
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
                        AppText(text: 'See All',style: TextStyle(color: AppColor.primarycolor),),
                      ],
                    ),
                    Appdiementions.gap,
                    SizedBox(
                      width: double.infinity,
                      height: 40,
                      child: Row(
                        children: [
                          Padding(
                                padding: const EdgeInsets.only(right:  8.0),
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: AppColor.white,
                                    borderRadius: BorderRadius.circular(Appdiementions.padding),
                                    border: Border.all(color: AppColor.black)
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(horizontal:  8.0),
                                    child: Center(child: AppText(text: state.categories![index],)),
                                  ),
                                ),
                              ),
                            
                          Expanded(
                            child: ListView.builder(
                              itemCount: state.categories?.length,
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (context, index) {
                              return Padding(
                                padding: const EdgeInsets.only(right:  8.0),
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: AppColor.white,
                                    borderRadius: BorderRadius.circular(Appdiementions.padding),
                                    border: Border.all(color: AppColor.black)
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(horizontal:  8.0),
                                    child: Center(child: AppText(text: state.categories![index],)),
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
                      height: 400,
                      width: double.infinity,
                      child: GridView.builder(
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,childAspectRatio: 1/1.3,mainAxisSpacing: Appdiementions.padding16,crossAxisSpacing: Appdiementions.padding16), itemBuilder: (context, index) {
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              child: Container(
                              decoration: BoxDecoration(
                                color: AppColor.bordercolor.withOpacity(0.4),
                                borderRadius: BorderRadius.circular(Appdiementions.padding16),
                             
                              ),
                              child: Center(child: SizedBox(
                                width: 100,
                                height: 100,
                                child: Image.network('https://atlas-content-cdn.pixelsquid.com/stock-images/iphone-15-pink-smartphone-camera-vnxB1W1-600.jpg',scale: 2,))),
                               
                              ),
                            ),
                            Appdiementions.gapSmall,
                            Column(
                              children: [
                                AppText(text: 'AirPods',style: TextStyle(color: AppColor.hintcolor,fontSize: 12),),
                                 AppText(text: '200',style: TextStyle(color: AppColor.black,fontSize: 14,fontWeight: FontWeight.w500),),
                              ],
                            ),
                           
                          ],
                        );
                      },),
                    )
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