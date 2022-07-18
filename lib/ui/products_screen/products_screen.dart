import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intern_project/bloc/products/bloc_products.dart';
import 'package:intern_project/ui/products_screen/widgets/category_drop_down_menu.dart';
import 'package:intern_project/ui/products_screen/widgets/products_list.dart';
import 'package:intern_project/ui/products_screen/widgets/rating_drop_down_menu.dart';
import 'package:intern_project/ui/products_screen/widgets/sort_drop_down_menu.dart';

class ProductsScreen extends StatelessWidget {
  const ProductsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Products"),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SortDropDownMenu(),
           Row(
             mainAxisAlignment: MainAxisAlignment.spaceAround,
             children: const [
               CategoryDropDownMenu(),
               RatingDropDownMenu(),
             ],
           ),
            BlocBuilder<BlocProducts, StateBlocProducts>(
                builder: (context, state) {
              if (state is StateProductsLoading) {
                return Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [CircularProgressIndicator()],
                );
              }
              if (state is StateProductsError) {
                return Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Flexible(
                      child: Text('error'),
                    ),
                  ],
                );
              }
              if (state is StateProductsData) {
                return ProductsList(itemList: state.data);
              }
              return const SizedBox.shrink();
            })
          ],
        )
        );
  }
}
