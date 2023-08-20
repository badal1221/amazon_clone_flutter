import 'package:amazon_clone_f/common/widgets/loader.dart';
import 'package:amazon_clone_f/features/admin/services/admin_services.dart';
import 'package:flutter/material.dart';

import '../model/sales.dart';

class AnalyticsScreen extends StatefulWidget {
  const AnalyticsScreen({Key? key}) : super(key: key);

  @override
  State<AnalyticsScreen> createState() => _AnalyticsScreenState();
}

class _AnalyticsScreenState extends State<AnalyticsScreen> {
  final AdminServices adminServices=AdminServices();
  int? totalSales;
  List<Sales>? earnings;
  @override
  void initState(){
    super.initState();
    getEarnings();
  }
  void getEarnings() async{
    var earningData=await adminServices.getEarnings(context);
    totalSales=earningData['totalEarnings'];
    earnings=earningData['sales'];
    setState(() {});
  }
  @override
  Widget build(BuildContext context) {
    return earnings==null||totalSales==null ? const Loader():
    Center(
        child: Text(
          'Total Sales:\$$totalSales',style: const TextStyle(fontSize: 20,fontWeight:FontWeight.bold),)
    );
  }
}
