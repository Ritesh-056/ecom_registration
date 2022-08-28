import 'package:bloc/bloc.dart';
import 'package:ecom_registration/company_repositary/approved_companies_repo.dart';
import 'package:ecom_registration/state/approved_bloc/approved_company_detail_event.dart';
import 'package:ecom_registration/state/approved_bloc/approved_company_detail_state.dart';


class ApprovedCompanyDetailsBloc extends Bloc<ApprovedCompanyDetailsEvent, ApprovedCompanyDetailsState> {
  ApprovedCompanyDetailsBloc() : super(ApprovedCompanyDetailLoading()) {
    
    final _approvedCompanyDetailsApiRepository = ApprovedCompanyDetailsApiRepository();
    
    on<ApprovedCompanyDataFetchEvent>((event, emit) async {
      emit(ApprovedCompanyDetailLoading());
      try {
        final approvedCompanyListData = await _approvedCompanyDetailsApiRepository.getApprovedCompaniesList();
        emit(ApprovedCompanyDetailLoaded(approvedCompanyListData!));

      } catch (exception) {
        emit(ApprovedCompanyDetailFetchError(exception.toString()));
      }
    });
  }
}
