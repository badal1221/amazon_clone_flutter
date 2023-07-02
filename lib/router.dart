import 'package:amazon_clone_f/common/widgets/bottom_bar.dart';
import 'package:amazon_clone_f/features/home/screens/home_screen.dart';
import 'package:amazon_clone_f/features/auth/screens/auth_screen.dart';
import 'package:amazon_clone_f/models/product.dart';
import 'package:flutter/material.dart';
import 'features/address/screen/address_screen.dart';
import 'features/admin/screens/add_product_screen.dart';
import 'features/home/order_details/screen/order_details.dart';
import 'features/home/screens/category_deals_screen.dart';
import 'features/home/search/screens/search_screen.dart';
import 'features/product_details/screens/product_detail_screen.dart';
import 'models/order.dart';

Route<dynamic> generateRoute(RouteSettings routeSettings){
  switch(routeSettings.name){
    case AuthScreen.routeName:
      return MaterialPageRoute(settings:routeSettings,builder: (_)=>const AuthScreen()
      );
    case HomeScreen.routeName:
      return MaterialPageRoute(settings:routeSettings,builder: (_)=>const HomeScreen()
      );
    case BottomBar.routeName:
      return MaterialPageRoute(settings:routeSettings,builder: (_)=>const BottomBar()
      );
    case AddProductScreen.routeName:
      return MaterialPageRoute(settings:routeSettings,builder: (_)=>const AddProductScreen()
      );
    case CategoryDealScreen.routeName:
      var category=routeSettings.arguments as String;
      return MaterialPageRoute(settings:routeSettings,builder: (_)=>CategoryDealScreen(
        category:category,
      ),);
    case SearchScreen.routeName:
      var searchQuery=routeSettings.arguments as String;
      return MaterialPageRoute(settings:routeSettings,builder: (_)=>SearchScreen(
        searchQuery:searchQuery,
      ),);
    case ProductDetailScreen.routeName:
      var product=routeSettings.arguments as Product;
      return MaterialPageRoute(settings:routeSettings,builder: (_)=>ProductDetailScreen(
        product: product,
      ),);
    case AddressScreen.routeName:
      var totalAmount=routeSettings.arguments as String;
      return MaterialPageRoute(settings:routeSettings,builder: (_)=>AddressScreen(
        totalAmount: totalAmount,
      ),);
    case OrderDetailScreen.routeName:
      var order=routeSettings.arguments as Order;
      return MaterialPageRoute(settings:routeSettings,builder: (_)=>OrderDetailScreen(
        order:order,
      ),);
    default:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_)=>const Scaffold(
          body: Center(
            child: Text('Screen does not exist!'),
          ),
        )
      );
  }
}