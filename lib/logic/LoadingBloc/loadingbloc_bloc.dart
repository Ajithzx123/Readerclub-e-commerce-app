import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'loadingbloc_event.dart';
part 'loadingbloc_state.dart';

class LoadingblocBloc extends Bloc<LoadingblocEvent, LoadingblocState> {
  LoadingblocBloc() : super(LoadingblocInitial()) {
    on<LoadingblocEvent>((event, emit) {

    });

    on<CircularLoadingEvent>((event, emit) {
      event.isLoading ? emit(CircularLoadingState(isLoading: event.isLoading)) : emit(CircularNotLoading());
    });
    on<CircularOtpPhoneEvent>((event, emit) {
      event.isOtpLoading ? emit(CircularOtpPhoneState(isOtpLoading: event.isOtpLoading)) : emit(CircularNotLoading());
    });
    on<CircularOtpVerifyEvent>((event, emit){
      event.isOtpVerify ? emit(CircularOtpVerifyState(isotpVerify: event.isOtpVerify)) : emit(CircularNotLoading());
    });
  }
}
