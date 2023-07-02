import 'package:amazon_clone_f/common/widgets/loader.dart';
import 'package:amazon_clone_f/features/home/services/home_services.dart';
import 'package:amazon_clone_f/features/product_details/screens/product_detail_screen.dart';
import 'package:flutter/material.dart';

import '../../../models/product.dart';

class DealOfDay extends StatefulWidget {
  const DealOfDay({Key? key}) : super(key: key);

  @override
  State<DealOfDay> createState() => _DealOfDayState();
}

class _DealOfDayState extends State<DealOfDay> {
  Product? product;
  final HomeServices homeServices=HomeServices();
  @override
  void initState(){
    super.initState();
    fetchDealOfDay();
  }
  void fetchDealOfDay() async{
     product=await homeServices.fetchDealOfDay(context: context);
     setState(() {});
  }
  void navigateToDetailScreen(){
    Navigator.pushNamed(context, ProductDetailScreen.routeName,arguments: product);
  }

  @override
  Widget build(BuildContext context) {
     return //product==null?const Loader()://null means data is still getting fetched from api
    // product!.name.isEmpty?const SizedBox()://empty means data is fetched from api but no previous data =>no deal of the day
    GestureDetector(
      onTap:navigateToDetailScreen,
      child: Column(
        children: [
          Container(
            alignment: Alignment.topLeft,
            padding: const EdgeInsets.only(left:10,top:15),
            child: const Text('Deal of the day',style: TextStyle(
              fontSize:20,
            ),),
          ),
          Image.network('https://hips.hearstapps.com/hmg-prod/images/ana-de-armas-attends-the-hands-of-stone-photocall-during-news-photo-1662037905.jpg?crop=1xw:0.85616xh;center,top',
          height: 235,
            fit: BoxFit.fitHeight,
          ),
          // Image.network(product!.images[0],
          //   height: 235,
          //   fit: BoxFit.fitHeight,
          // ),
          Container(
            alignment: Alignment.topLeft,
            padding: const EdgeInsets.only(left: 15,),
          child:const Text('\$100',style:TextStyle(
            fontSize: 18,
             ),
          ),
          //   child: Text('\$${product?.price}',style:TextStyle(
          //     fontSize: 18,
          //   ),),
          ),
          Container(
            alignment: Alignment.topLeft,
            padding: const EdgeInsets.only(left: 15,top: 5,right: 40),
             child:const Text('Aamras🥭🥭🥭',maxLines: 2,overflow: TextOverflow.ellipsis,),
            //child: Text('${product?.name}',maxLines: 2,overflow: TextOverflow.ellipsis,),
          ),
          // SingleChildScrollView(
          //   scrollDirection: Axis.horizontal,
          //   child: Row(
          //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //     children: product!.images.map((e)=>Image.network(e,
          //       fit: BoxFit.fitWidth,width: 100,height: 100,)
          //       ,).toList(),
          //   ),
          // ),
          Container(
            padding: const EdgeInsets.symmetric(vertical: 15).copyWith(left: 15),
            alignment: Alignment.topLeft,
            child: Text('See all deals',
              style:TextStyle(
                color: Colors.cyan[800],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
