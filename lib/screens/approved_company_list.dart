import 'package:ecom_registration/company_repositary/companies_repo.dart';
import 'package:ecom_registration/model%20/company.dart';
import 'package:ecom_registration/resources/widgets/master_widgets.dart';
import 'package:ecom_registration/resources/widgets/reusable_widgets.dart';
import 'package:ecom_registration/state/approved_bloc/approved_company_detail_event.dart';
import 'package:ecom_registration/state/approved_bloc/approved_company_detail_state.dart';
import 'package:ecom_registration/state/approved_bloc/approved_company_details_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'company_registration_detail_screen.dart';
import 'registration_page.dart';

class ApprovedCompanyListScreen extends StatefulWidget {
  const ApprovedCompanyListScreen({Key? key}) : super(key: key);

  @override
  _ApprovedCompanyListScreenState createState() => _ApprovedCompanyListScreenState();
}

class _ApprovedCompanyListScreenState extends State<ApprovedCompanyListScreen> {
  double itemGapSize = 8.0;
  double itemBlocGapSize = 16.0;
  final companyDetailsBloc = ApprovedCompanyDetailsBloc();


  @override
  void initState() {
    companyDetailsBloc.add(ApprovedCompanyDataFetchEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          body: Container(
            child: Stack(
              children: [
                ImageContainer(),
                TopGreenContainer(context),
                ItemsContainer()
              ],
            ),
          ),
        )
    );
  }

  Widget ItemsContainer() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        physics: ScrollPhysics(),
        child: Column(
          children: [
            TopElementsOfContainer(),
            MiddleElementsOfContainerCompany(),
            BlocProvider(
                create:(context) => companyDetailsBloc,
              child:BlocBuilder <ApprovedCompanyDetailsBloc, ApprovedCompanyDetailsState>(
                  builder: (context, state) {
                    if(state is ApprovedCompanyDetailLoading){
                      return _buildLoading(context);
                    }
                    else if (state is ApprovedCompanyDetailLoaded){
                      return _buildLoaded(context, state.company);
                    }
                    else if(state is ApprovedCompanyDetailFetchError){
                      return _buildError(context, state.error);
                    }
                    else{
                      return Container();
                    }
                  }
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget MiddleElementsOfContainerCompany() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        E_comRegistrationSizedVerticalBox(itemBlocGapSize),
        E_comRegistrationHeadings('E-COM'),
        E_comRegistrationHeadings('REGISTRATION'),
      ],
    );
  }


  Widget _buildError(BuildContext context, String errorMessage) {
    return Text('${errorMessage}');
  }


  Widget _buildLoading(BuildContext context) {
    return Center(
      child: Column(
        children: [
          CircularProgressIndicator(),
          SizedBox(height: 8.0,),
          Text('Loading...! Please wait.')
        ],
      ),
    );
  }


  Widget _buildLoaded(BuildContext context, List<Company>? company){
    return Container(
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: Colors.black12, width: 1),
          borderRadius: BorderRadius.all(Radius.circular(20.0)),
        ),
        padding: EdgeInsets.symmetric(vertical: 8.0),
        margin: EdgeInsets.symmetric(vertical: 34.0, horizontal: 4),
        child: ListView.builder(
            itemCount: company!.length,
            shrinkWrap: true,
            itemBuilder: (context, index) {
              return ListTile(
                leading:CircleAvatar(
                  child: Text(company[index].name[0]),
                ),
                title: Text(company[index].name),
                subtitle: Text(company[index].email),
                trailing: company[index].approved! ?E_comRegistrationNormalText(
                    'Verified', TextDecoration.underline):InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => CompanyRegistrationDetailScreen(
                              company: company[index],
                              companyRegisteredId:company[index].id,
                            )));
                  },
                  child: E_comRegistrationNormalText(
                      'Verify', TextDecoration.underline),
                ),
              );
            }));
  }

  @override
  void dispose() {
    super.dispose();
  }
}

