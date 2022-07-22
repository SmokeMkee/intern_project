
import 'package:flutter/foundation.dart';
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
        final result = await repo.filterByAscDesc( event.sort!);
        final sortedList = result.productList!.where((element) {
          if(event.category != "Category" && event.category != null){
            print(event.category);
            return element.category == event.category &&
                element.rating!.rate! > double.parse(event.rate!).floor();

          }else{
            return element.rating!.rate! > double.parse(event.rate!).floor();
          }
        }).toList();

        if (result.errorMessage != null) {
          emit(
            StateProductsError(error: result.errorMessage!),
          );
          return;
        }
        emit(
          StateProductsData(data: sortedList),
        );
      },
    );
  }

  final RepoProducts repo;
}
