import 'package:amazon_clone_f/common/widgets/loader.dart';
import 'package:amazon_clone_f/constants/global_variables.dart';
import 'package:amazon_clone_f/features/account/services/account_services.dart';
import 'package:amazon_clone_f/features/account/widgets/single_product.dart';
import 'package:amazon_clone_f/features/home/order_details/screen/order_details.dart';
import 'package:flutter/material.dart';

import '../../../models/order.dart';

class Orders extends StatefulWidget {
  const Orders({Key? key}) : super(key: key);

  @override
  State<Orders> createState() => _OrdersState();
}

class _OrdersState extends State<Orders> {
  List<Order>? orders;
  final AccountServices accountServices=AccountServices();
  void initState(){
    super.initState();
    fetchOrders();
  }
  void fetchOrders() async{
    orders=await accountServices.fetchMyOrders(context);
    setState(() {

    });
  }

  @override
  Widget build(BuildContext context) {
    return orders==null?const Loader():
    Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              padding: EdgeInsets.only(left: 15),
              child: const Text('Your Orders',style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
              ),),
            ),
            Container(
              padding: EdgeInsets.only(right: 15),
              child: Text('See all',style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
                color: GlobalVariables.selectedNavBarColor,
              ),),
            ),
          ],
        ),
        //display orders
        Container(
          height: 170,
          padding:const EdgeInsets.only(left: 10,top: 20,right: 0),
          child: ListView.builder(scrollDirection:Axis.horizontal,
            itemCount: orders!.length,
            itemBuilder:((context,index){
               return GestureDetector(
                 onTap:(){
                   Navigator.pushNamed(context, OrderDetailScreen.routeName,arguments:orders![index] );
                 },
                   child: SingleProduct(image: orders![index].products[0].images[0],));
          }
          ),),
        ),
      ],
    );
  }
}
