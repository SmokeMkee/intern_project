part of 'bloc_products.dart';

abstract class EventBlocPersons {}

class EventProductsFilter extends EventBlocPersons {
  EventProductsFilter(this.sort, this.category, this.rate);
  final String? sort;
  final String? category;
  final String? rate;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is EventProductsFilter &&
          runtimeType == other.runtimeType &&
          sort == other.sort &&
          category == other.category &&
          rate == other.rate;

  @override
  int get hashCode => sort.hashCode ^ category.hashCode ^ rate.hashCode;
}
