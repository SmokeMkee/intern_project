import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intern_project/bloc/product_details/bloc_product_details.dart';
import 'package:intern_project/constants/app_colors.dart';
import '../../../dto/products.dart';
import '../../../generated/l10n.dart';

class ProductsList extends StatelessWidget {
  const ProductsList({Key? key, required this.itemList}) : super(key: key);
  final List<Products> itemList;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        scrollDirection: Axis.vertical,
        itemCount: itemList.length,
        itemBuilder: (BuildContext context, int index) {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
            child: Card(
              elevation: 6,
              color: AppColors.productCardBGColor,
              shape: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5),
                  borderSide: BorderSide.none),
              child: InkWell(
                onTap: () {
                  BlocProvider.of<BlocProductDetails>(context).add(
                    EventProductDetails(itemList[index].id!),
                  );
                  Navigator.of(context).pushNamed(
                      '/auth_screen/navigation_bar/products/product_details');
                },
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                  child: Row(
                    children: [
                      CircleAvatar(
                        backgroundImage: NetworkImage(itemList[index].image!),
                        radius: 40,
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text(
                              itemList[index].title!,
                              overflow: TextOverflow.ellipsis,
                              softWrap: true,
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Row(
                              children: [
                                Expanded(
                                  child: Text(
                                    "${S.of(context).price}${itemList[index].price}",
                                    overflow: TextOverflow.ellipsis,
                                    softWrap: true,
                                  ),
                                ),
                                Text(
                                  '${S.of(context).rating} ${itemList[index].rating!.rate}',
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      const Icon(
                        Icons.arrow_forward_ios_rounded,
                        size: 27,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
