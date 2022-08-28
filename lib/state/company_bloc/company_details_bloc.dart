import 'package:bloc/bloc.dart';
import 'package:ecom_registration/company_repositary/companies_repo.dart';
import 'company_detail_event.dart';
import 'company_detail_state.dart';


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
