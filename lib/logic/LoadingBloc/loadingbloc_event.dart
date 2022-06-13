part of 'loadingbloc_bloc.dart';

@immutable
abstract class LoadingblocEvent {}

class CircularLoadingEvent extends LoadingblocEvent{
  final bool isLoading;

  CircularLoadingEvent({required this.isLoading});

}
class CircularOtpPhoneEvent extends LoadingblocEvent{
  final bool isOtpLoading;

  CircularOtpPhoneEvent({required this.isOtpLoading});

}
class CircularOtpVerifyEvent extends LoadingblocEvent{
  final bool isOtpVerify;

  CircularOtpVerifyEvent({ required this.isOtpVerify});
}
