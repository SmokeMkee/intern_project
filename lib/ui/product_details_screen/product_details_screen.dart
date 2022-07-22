import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intern_project/bloc/product_details/bloc_product_details.dart';
import 'package:intern_project/constants/app_colors.dart';
import 'package:intern_project/ui/product_details_screen/widgets/produst_details_widget.dart';
import '../../generated/l10n.dart';

class ProductDetailsScreen extends StatelessWidget {
  const ProductDetailsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(S.of(context).productDetails),
        centerTitle: true,
        backgroundColor: AppColors.appBarBGColor,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8),
        child: BlocBuilder<BlocProductDetails, StateBlocProductDetails>(
          builder: (BuildContext context, state) {
            if (state is StateProductDetailsLoading) {
              return Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [CircularProgressIndicator()],
              );
            }
            if (state is StateProductDetailsError) {
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Flexible(
                    child: Text(S.of(context).error),
                  ),
                ],
              );
            }
            if (state is StateProductDetailsData) {
              return ProductDetailsWidget(
                productDetails: state.data,
              );
            }
            return const SizedBox.shrink();
          },
        ),
      ),
    );
  }
}
