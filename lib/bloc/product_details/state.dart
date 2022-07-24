part of 'bloc_product_details.dart';

abstract class StateBlocProductDetails {}

class StateProductDetailsInitial extends StateBlocProductDetails {}

class StateProductDetailsLoading extends StateBlocProductDetails {}

class StateProductDetailsData extends StateBlocProductDetails {
  StateProductDetailsData({
    required this.data,
  });
  final Products data;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is StateProductDetailsData &&
          runtimeType == other.runtimeType &&
          data == other.data;

  @override
  int get hashCode => data.hashCode;
}

class StateProductDetailsError extends StateBlocProductDetails {
  StateProductDetailsError({
    required this.error,
  });
  final String error;
}
