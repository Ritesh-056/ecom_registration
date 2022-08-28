import 'package:ecom_registration/model%20/company.dart';
import 'package:equatable/equatable.dart';

class ApprovedCompanyDetailsState extends Equatable {
  const ApprovedCompanyDetailsState();

  @override
  List<Object> get props => [];
}

class ApprovedCompanyDetailInitial extends ApprovedCompanyDetailsState {}

class ApprovedCompanyDetailLoading extends ApprovedCompanyDetailsState {}

class ApprovedCompanyDetailLoaded extends ApprovedCompanyDetailsState {
  final List<Company>? company;
  const ApprovedCompanyDetailLoaded(this.company);

  @override
  List<Object> get props => [company!];
}

class ApprovedCompanyDetailFetchError extends ApprovedCompanyDetailsState {
  final String error;

  const ApprovedCompanyDetailFetchError(this.error);

  @override
  List<Object> get props => [error];
}
