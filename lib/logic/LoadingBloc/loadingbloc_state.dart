part of 'loadingbloc_bloc.dart';

@immutable
abstract class LoadingblocState {}

class LoadingblocInitial extends LoadingblocState {}

class CircularLoadingState extends LoadingblocState{
  final bool isLoading;

  CircularLoadingState({required this.isLoading});

}

class CircularOtpPhoneState extends LoadingblocState{
  final bool isOtpLoading;

  CircularOtpPhoneState({required this.isOtpLoading});

}
class CircularOtpVerifyState extends LoadingblocState{
  final bool isotpVerify;

  CircularOtpVerifyState({ required this.isotpVerify});
}
class CircularNotLoading extends LoadingblocState{}
