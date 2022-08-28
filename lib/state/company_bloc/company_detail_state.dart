import 'package:ecom_registration/model%20/company.dart';
import 'package:equatable/equatable.dart';

class CompanyDetailsState extends Equatable {
  const CompanyDetailsState();

  @override
  List<Object> get props => [];
}

class CompanyDetailInitial extends CompanyDetailsState {}

class CompanyDetailLoading extends CompanyDetailsState {}

class CompanyDetailLoaded extends CompanyDetailsState {
  final List<Company>? company;
  const CompanyDetailLoaded(this.company);

  @override
  List<Object> get props => [company!];
}

class CompanyDetailFetchError extends CompanyDetailsState {
  final String error;

  const CompanyDetailFetchError(this.error);

  @override
  List<Object> get props => [error];
}
