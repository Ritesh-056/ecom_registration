import 'package:ecom_registration/app_const.dart';
import 'package:ecom_registration/screens/submit_details/details_constant.dart';
import 'package:ecom_registration/utils/functions/resuable_functions.dart';
import '../../../widgets/reusable_widgets.dart';
import '../../widgets/master_widgets.dart';
import 'package:flutter/material.dart';
import 'widgets/widgets_submitted_details.dart';


class UserDetailResponseScreen extends StatelessWidget {
  const UserDetailResponseScreen({Key? key})
      : super(
          key: key,
        );

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          physics: ScrollPhysics(),
          child: Container(
            child: Stack(
              children: [
                ImageContainer(),
                TopGreenContainer(context),
                ItemsContainer(context)
              ],
            ),
          ),
        ),
      ),
    );
  }


}
