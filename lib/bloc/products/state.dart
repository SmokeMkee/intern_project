part of 'bloc_products.dart';





abstract class StateBlocProducts {}

class StateProductsInitial extends StateBlocProducts {}

class StateProductsLoading extends StateBlocProducts {}

class StateProductsData extends StateBlocProducts {
  StateProductsData({
    required this.data,
  });
  final List<Products> data;
}

class StateProductsError extends StateBlocProducts {
  StateProductsError({
    required this.error,
  });
  final String error;
}
