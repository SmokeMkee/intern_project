
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:intern_project/dto/products.dart';

import '../../repo/repo_products.dart';

part 'state.dart';
part 'events.dart';


class BlocProducts extends Bloc<EventBlocPersons, StateBlocProducts> {
  BlocProducts({required this.repo}) : super(StateProductsInitial()) {
    on<EventProductsFilter>(
          (event, emit) async {
        emit(StateProductsLoading());
        final result = await repo.filterByAscDesc(event.name);
        if (result.errorMessage != null) {
          emit(
            StateProductsError(error: result.errorMessage!),
          );
          return;
        }
        emit(
          StateProductsData(data: result.productList!),
        );
      },
    );
  }

  final RepoProducts repo;
}
