part of 'navbloc_bloc.dart';

@immutable
abstract class NavblocState {}

class NavblocInitial extends NavblocState {}

class RegOrSignState extends NavblocState {}

class NavToAdminState extends NavblocState {}

class NavToRegState extends NavblocState {}

class NavToSingInState extends NavblocState {}

class BackToRegorSignstate extends NavblocState {}

class PrevPageViewState extends NavblocState {}

class NextPageViewState extends NavblocState {}
