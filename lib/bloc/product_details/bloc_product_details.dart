import 'package:flutter_bloc/flutter_bloc.dart';

import '../../dto/products.dart';
import '../../repo/repo_products.dart';

part 'state.dart';
part 'events.dart';

class BlocProductDetails
    extends Bloc<EventBlocDetails, StateBlocProductDetails> {
  BlocProductDetails({required this.repo})
      : super(StateProductDetailsInitial()) {
    on<EventProductDetails>(
      (event, emit) async {
        emit(StateProductDetailsLoading());
        final result = await repo.productDetails(event.id);
        if (result.errorMessage != null) {
          emit(
            StateProductDetailsError(error: result.errorMessage!),
          );
          return;
        }

        emit(
          StateProductDetailsData(data: result.productDetails!),
        );
      },
    );
  }

  final RepoProducts repo;
}
