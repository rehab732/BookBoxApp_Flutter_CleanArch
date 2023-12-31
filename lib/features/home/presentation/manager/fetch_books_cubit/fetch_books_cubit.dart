import 'package:bookbox/features/home/domain/entities/book_entity.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domain/use_cases/fetch_featuerd_books_use_case.dart';

part 'fetch_books_state.dart';

class FetchBooksCubit extends Cubit<FetchBooksState> {
  FetchBooksCubit(this.featuredBooksUseCase) : super(FetchBooksInitial());

  final FeachFeturedBooksUseCase featuredBooksUseCase;
  Future<void> fetchFeaturedBooks({int pageNumber = 0}) async {
    if (pageNumber == 0) {
      emit(FetchBooksLoading());
    } else {
      emit(FetchBooksPagenationLoading());
    }
    var result = await featuredBooksUseCase.call(pageNumber);
    result.fold((fauiler) {
      if (pageNumber == 0) {
        emit(FetchBooksFauiler(fauiler.message));
      } else {
        emit(FetchBooksPagenationFauiler(fauiler.message));
      }
    }, (books) {
      emit(FetchBooksSuccess(books));
    });
  }
}
