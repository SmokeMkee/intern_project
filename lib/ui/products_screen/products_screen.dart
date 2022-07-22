import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intern_project/bloc/products/bloc_products.dart';
import 'package:intern_project/constants/app_colors.dart';
import 'package:intern_project/ui/products_screen/widgets/category_drop_down_menu.dart';
import 'package:intern_project/ui/products_screen/widgets/products_list.dart';
import 'package:intern_project/ui/products_screen/widgets/rating_drop_down_menu.dart';
import 'package:intern_project/ui/products_screen/widgets/sort_drop_down_menu.dart';

import '../../generated/l10n.dart';

class ProductsScreen extends StatefulWidget {
  const ProductsScreen({Key? key}) : super(key: key);

  @override
  State<ProductsScreen> createState() => _ProductsScreenState();
}

class _ProductsScreenState extends State<ProductsScreen> {
  String category = 'Category';
  String sort = 'asc';
  String rate = '1';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(S.of(context).products),
        centerTitle: true,
        backgroundColor: AppColors.bgColorAppBar,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            decoration: const BoxDecoration(
              color: AppColors.productFilterBGColor,
            ),
            child: Column(
              children: [
                SortDropDownMenu(
                  onChanged: (value) {
                    if (value != null) {
                      setState(
                        () {
                          sort = value;
                        },
                      );
                      BlocProvider.of<BlocProducts>(context).add(
                        EventProductsFilter(sort, category, rate),
                      );
                    }
                  },
                  selectedValue: sort,
                ),
                const Divider(
                  height: 3,
                  thickness: 2,
                  color: AppColors.productFilterDivider,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    CategoryDropDownMenu(
                      onChanged: (value) {
                        if (value != null) {
                          setState(
                            () {
                              category = value;
                            },
                          );
                          BlocProvider.of<BlocProducts>(context)
                              .add(EventProductsFilter(sort, category, rate));
                        }
                      },
                      selectedValue: category,
                    ),
                    RatingDropDownMenu(
                      onChanged: (value) {
                        if (value != null) {
                          setState(
                            () {
                              rate = value;
                            },
                          );
                          BlocProvider.of<BlocProducts>(context).add(
                            EventProductsFilter(sort, category, rate),
                          );
                        }
                      },
                      selectedValue: rate,
                    ),
                  ],
                ),
              ],
            ),
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
                  children: [
                    Flexible(
                      child: Text(S.of(context).error),
                    ),
                  ],
                );
              }
              if (state is StateProductsData) {
                return ProductsList(itemList: state.data);
              }
              return const SizedBox.shrink();
            },
          ),
        ],
      ),
    );
  }
}
