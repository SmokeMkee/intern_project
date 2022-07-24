part of 'bloc_product_details.dart';

abstract class EventBlocDetails {}

class EventProductDetails extends EventBlocDetails {
  EventProductDetails(this.id);
  final int id;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is EventProductDetails &&
          runtimeType == other.runtimeType &&
          id == other.id;

  @override
  int get hashCode => id.hashCode;
}
