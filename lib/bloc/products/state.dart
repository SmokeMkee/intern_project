part of 'bloc_products.dart';

abstract class StateBlocProducts {}

class StateProductsInitial extends StateBlocProducts {}

class StateProductsLoading extends StateBlocProducts {}

class StateProductsData extends StateBlocProducts {
  StateProductsData({
    required this.data,
  });
  final List<Products> data;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is StateProductsData &&
          runtimeType == other.runtimeType &&
          data == other.data;

  @override
  int get hashCode => data.hashCode;
}

class StateProductsError extends StateBlocProducts {
  StateProductsError({
    required this.error,
  });
  final String error;
}
