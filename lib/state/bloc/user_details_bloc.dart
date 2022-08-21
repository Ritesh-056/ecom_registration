import 'dart:html';
import 'package:bloc/bloc.dart';
import 'package:ecom_registration/model%20/user.dart';
import 'package:ecom_registration/state/bloc/user_detail_event.dart';
import 'package:ecom_registration/state/bloc/user_detail_state.dart';

class UserDetailsBloc extends Bloc<UserDetailsEvent, UserDetailsState>{
  UserDetailsBloc() : super(UserDetailLoading()){
    on<UserDataFetchEvent>((event, emit) async{
       try{
         emit(UserDetailLoading());
         // final User user = new User();
         // emit(UserDetailLoaded(user));
       }catch (exception){
         emit(UserDetailFetchError(exception.toString()));
       }
    });

  }
}