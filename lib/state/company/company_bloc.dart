import 'package:bloc/bloc.dart';

import '../../repositoy/companies_repo.dart';
import 'company_event.dart';
import 'company_state.dart';


class CompanyDetailsBloc extends Bloc<CompanyDetailsEvent, CompanyDetailsState> {
  CompanyDetailsBloc() : super(CompanyDetailLoading()) {
    
    final _companyDetailsApiRepository = CompanyDetailsApiRepository();
    
    on<CompanyDataFetchEvent>((event, emit) async {
      emit(CompanyDetailLoading());
      try {
        final companyListData = await _companyDetailsApiRepository.getCompanyDataList();
        emit(CompanyDetailLoaded(companyListData!));

      } catch (exception) {
        emit(CompanyDetailFetchError(exception.toString()));
      }
    });
  }
}
