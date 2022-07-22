import 'package:flutter/foundation.dart';
import 'package:intern_project/dto/products.dart';

import 'api.dart';

class RepoProducts {
  RepoProducts({required this.api});
  final Api api;
  Future<ResultRepoProducts> filterByAscDesc(String sort) async {
    try {
      final result = await api.dio.get(
        '?sort=$sort',
      );
      final List productListJson = result.data ?? [];
      final productList = productListJson
          .map(
            (e) => Products.fromJson(e),
          )
          .toList();
      return ResultRepoProducts(productList: productList);
    } catch (error) {
      if (kDebugMode) {
        print("Error : $error");
      }
      return ResultRepoProducts(errorMessage: "");
    }
  }

  Future<ResultRepoProducts> productDetails(int id) async {
    try {
      final result = await api.dio.get(
        '/$id',
      );
      final productDetailsJson = result.data;

      final productDetails = Products.fromJson(productDetailsJson);
      return ResultRepoProducts(productDetails: productDetails);
    } catch (error) {
      if (kDebugMode) {
        print("Error : $error");
      }
      return ResultRepoProducts(errorMessage: "");
    }
  }
}

class ResultRepoProducts {
  ResultRepoProducts({
    this.productDetails,
    this.errorMessage,
    this.productList,
  });

  final String? errorMessage;
  final List<Products>? productList;
  final Products? productDetails;
}
