import 'package:amazon_clone_f/common/widgets/stars.dart';
import 'package:flutter/material.dart';
import '../../../../models/product.dart';

class SearchedProduct extends StatelessWidget {
  final Product product;
  const SearchedProduct({Key? key, required this.product}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    double totalRating = 0;
    for (int i = 0; i < product.rating!.length; i++) {
      totalRating += product.rating![i].rating;
    }
    double avgRating = 0;
    if (totalRating != 0) {
      avgRating = totalRating / product.rating!.length;
    }

    final width=MediaQuery.of(context).size.width;
    return Column(
      children: [
        Container(
          padding:const EdgeInsets.symmetric(horizontal: 10,vertical:1),
          child: Row(
            children: [
              Image.network(
                product.images[0],
                fit: BoxFit.contain,
                height: width/3,
                width: width/3,
              ),
              Column(
                children: [
                  Container(
                    width: 2*width/3-20,
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Text(
                      product.name,
                      style: const TextStyle(
                        fontSize: 16,
                      ),
                      maxLines: 2,
                    ),
                  ),
                  Container(
                    width: 2*width/3-20,
                    padding: const EdgeInsets.only(left: 10, top: 5),
                    child: Stars(
                      rating: avgRating,
                    ),
                  ),
                  Container(
                    width: 2*width/3-20,
                    padding: const EdgeInsets.only(left: 10, top: 5),
                    child: Text(
                      '\$${product.price}',
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                      maxLines: 2,
                    ),
                  ),
                  Container(
                    width: 2*width/3-20,
                    padding: const EdgeInsets.only(left: 10),
                    child: const Text(
                      'Eligible for Free Shipping',
                    ),
                  ),
                  Container(
                    width: 2*width/3-20,
                    padding: const EdgeInsets.only(left: 10, top: 5),
                    child: const Text(
                      'In Stock',
                      style: TextStyle(
                        color: Colors.teal,
                      ),
                      maxLines: 2,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        const Divider(),
      ],
    );
  }
}
