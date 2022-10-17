import 'dart:developer';

import 'package:ecom_registration/app_const.dart';
import 'package:ecom_registration/helper/persistance_helper.dart';
import 'package:ecom_registration/model%20/company.dart';
import 'package:ecom_registration/screens/company_detail/company_detail_constant.dart';
import '../../../widgets/reusable_widgets.dart';
import '../../widgets/master_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../state/company/company_event.dart';
import '../../state/company/company_state.dart';
import '../../state/company/company_bloc.dart';
import 'screen_com_detail_screen.dart';

class CompanyRegistrationListScreen extends StatefulWidget {
  const CompanyRegistrationListScreen({Key? key}) : super(key: key);

  @override
  _CompanyRegistrationListScreenState createState() =>
      _CompanyRegistrationListScreenState();
}

class _CompanyRegistrationListScreenState
    extends State<CompanyRegistrationListScreen> {
  double itemGapSize = 8.0;
  double itemBlocGapSize = 16.0;
  final companyDetailsBloc = CompanyDetailsBloc();

  void getUserTokenFromLocalStorage() {
    SharePreferencesHelper().getUserPrefString(userTokenKey).then((value) {
      setState(() => userToken = value);
    }).catchError((err) {
      log("No any key ${userTokenKey}");
    });
  }

  @override
  void initState() {
    getUserTokenFromLocalStorage();
    companyDetailsBloc.add(CompanyDataFetchEvent());
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
    ));
  }

  Widget ItemsContainer() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        physics: ScrollPhysics(),
        child: Column(
          children: [
            TopElementsOfContainer(context),
            MiddleElementsOfContainerCompany(),
            BlocProvider(
              create: (context) => companyDetailsBloc,
              child: BlocBuilder<CompanyDetailsBloc, CompanyDetailsState>(
                  builder: (context, state) {
                if (state is CompanyDetailLoading) {
                  return _buildLoading(context);
                } else if (state is CompanyDetailLoaded) {
                  return _buildLoaded(context, state.company);
                } else if (state is CompanyDetailFetchError) {
                  return _buildError(context, state.error);
                } else {
                  return Container();
                }
              }),
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
    return Container(
      height: 200,
      child: Center(
        child: Text('${errorMessage}'),
      ),
    );
  }

  Widget _buildLoading(BuildContext context) {
    return Container(
      height: 400,
      color: Colors.white,
      child: Center(
        child: Column(
          children: [
            CircularProgressIndicator(),
            SizedBox(
              height: 8.0,
            ),
            Text(CompanyDetailConstant.loadingStr),
          ],
        ),
      ),
    );
  }

  Widget _buildLoaded(BuildContext context, List<Company>? company) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(
          color: Colors.black12,
          width: 1,
        ),
        borderRadius: BorderRadius.all(
          Radius.circular(
            20.0,
          ),
        ),
      ),
      padding: EdgeInsets.symmetric(
        vertical: 8.0,
      ),
      margin: EdgeInsets.symmetric(
        vertical: 34.0,
        horizontal: 4,
      ),
      child: ListView.builder(
        itemCount: company!.length,
        shrinkWrap: true,
        itemBuilder: (context, index) {
          return ListTile(
            leading: CircleAvatar(
              child: Text(company[index].name[0]),
            ),
            title: Text(company[index].name),
            subtitle: Text(company[index].email),
            trailing: company[index].approved!
                ? InkWell(
                    onTap: () => jumpToApprovalScreen(
                        context, company[index], company[index].id!, true),
                    child: E_comRegistrationNormalText(
                      'Verified',
                      TextDecoration.underline,
                    ),
                  )
                : InkWell(
                    onTap: () => jumpToApprovalScreen(
                        context, company[index], company[index].id!, false),
                    child: E_comRegistrationNormalText(
                      'Verify',
                      TextDecoration.underline,
                    ),
                  ),
          );
        },
      ),
    );
  }

  void jumpToApprovalScreen(BuildContext context, Company company,
      int registeredId, bool isVerified) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => CompanyRegistrationDetailScreen(
          company: company,
          companyRegisteredId: registeredId,
          isVerified: isVerified,
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
  }
}
