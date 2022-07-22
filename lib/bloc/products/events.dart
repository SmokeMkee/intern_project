part of 'bloc_products.dart';

abstract class EventBlocPersons {}

class EventProductsFilter extends EventBlocPersons {
  EventProductsFilter(this.sort, this.category, this.rate);
  final String? sort;
  final String? category;
  final String? rate;
}
