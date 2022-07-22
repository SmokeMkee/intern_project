part of 'bloc_product_details.dart';

abstract class EventBlocDetails{}

class EventProductDetails extends EventBlocDetails {
  EventProductDetails(this.id);
  final int id;
}


