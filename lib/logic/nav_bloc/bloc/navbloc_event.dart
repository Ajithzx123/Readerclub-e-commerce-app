part of 'navbloc_bloc.dart';

@immutable
abstract class NavblocEvent {}

class NavRegorSignEvent extends NavblocEvent {}

class NavToRegScreenEvent extends NavblocEvent {}

class NavToSignInScreenEvent extends NavblocEvent {}

class NavToAdminScreenEvent extends NavblocEvent {}

class BackToRegOrSignEvent extends NavblocEvent {}

class PrevPageViewEvent extends NavblocEvent {}

class NextPageViewEvent extends NavblocEvent {}

class NavToHomeScrenEvent extends NavblocEvent {}
