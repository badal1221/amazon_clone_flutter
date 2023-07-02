import 'package:amazon_clone_f/common/widgets/loader.dart';
import 'package:amazon_clone_f/features/account/widgets/single_product.dart';
import 'package:amazon_clone_f/features/admin/services/admin_services.dart';
import 'package:amazon_clone_f/features/home/order_details/screen/order_details.dart';
import 'package:flutter/material.dart';

import '../../../models/order.dart';

class OrdersScreen extends StatefulWidget {
  const OrdersScreen({Key? key}) : super(key: key);

  @override
  State<OrdersScreen> createState() => _OrdersScreenState();
}

class _OrdersScreenState extends State<OrdersScreen> {
  final AdminServices adminServices=AdminServices();
  List<Order>? orderList=[];
  @override
  void initState(){
    super.initState();
    fetchAllOrders();
  }
  void fetchAllOrders()async{
    orderList=await adminServices.fetchAllOrders(context);
    setState(() {});
  }
  @override
  Widget build(BuildContext context) {
    return orderList==null?const Loader():
    GridView.builder(
        itemCount:orderList!.length ,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount:2),
        itemBuilder: (context,index){
          final orderData=orderList![index];
          return GestureDetector(
            onTap:(){
              Navigator.pushNamed(context,OrderDetailScreen.routeName,arguments: orderData);
            },
            child: SizedBox(height: 140,child: SingleProduct(image:orderData.products[0].images[0],
               ),
            ),
          );
        },
    );
  }
}
