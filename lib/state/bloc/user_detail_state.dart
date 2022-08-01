import 'package:ecom_registration/model%20/user.dart';
import 'package:equatable/equatable.dart';

class UserDetailsState extends Equatable{

  const UserDetailsState () ;

  @override
  List<Object> get props =>[];
}


class UserDetailInitial extends UserDetailsState{}
class UserDetailLoading extends UserDetailsState{}
class UserDetailLoaded extends UserDetailsState{
  final User user;
  const UserDetailLoaded(this.user);

  @override
  List<Object>  get props => [user];
}
class UserDetailFetchError extends UserDetailsState{}