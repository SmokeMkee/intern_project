part of 'bloc_products.dart';

abstract class EventBlocPersons {}

class EventProductsFilter extends EventBlocPersons {
  EventProductsFilter(this.name);
  final String name;
}
