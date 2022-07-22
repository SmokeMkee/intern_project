import 'package:flutter/material.dart';
import 'package:intern_project/constants/app_colors.dart';
import 'package:intern_project/constants/app_styles.dart';

import '../../../dto/products.dart';

class ProductDetailsWidget extends StatelessWidget {
  const ProductDetailsWidget({Key? key, required this.productDetails})
      : super(key: key);
  final Products productDetails;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              productDetails.title!,
              textAlign: TextAlign.center,
              style: AppStyles.s14w500,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              child: Image.network(productDetails.image!),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  padding:
                      const EdgeInsets.symmetric(vertical: 6, horizontal: 12),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: AppColors.ratingContainerBGColor,
                  ),
                  child: Text(
                    productDetails.rating!.rate.toString(),
                    style: AppStyles.s16w500,
                  ),
                ),
                Text(
                  productDetails.price.toString(),
                  style: AppStyles.s16w700,
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Text(productDetails.description!,
                textAlign: TextAlign.center, style: AppStyles.s14w500),
          ],
        ),
      ),
    );
  }
}
