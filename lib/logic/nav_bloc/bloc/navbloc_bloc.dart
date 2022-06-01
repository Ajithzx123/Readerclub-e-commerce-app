import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'navbloc_event.dart';
part 'navbloc_state.dart';

class NavblocBloc extends Bloc<NavblocEvent, NavblocState> {
  NavblocBloc() : super(NavblocInitial()) {
    on<NavblocEvent>((event, emit) {});
    on<NavRegorSignEvent>((event, emit) => emit(RegOrSignState()));
    on<NavToRegScreenEvent>((event, emit) => emit(NavToRegState()));
    on<NavToAdminScreenEvent>((event, emit) => emit(NavToAdminState()));
    on<NavToSignInScreenEvent>((event, emit) => emit(NavToSingInState()));
    on<BackToRegOrSignEvent>((event, emit) => emit(BackToRegorSignstate()));
    on<PrevPageViewEvent>((event, emit) => emit(PrevPageViewState()));
    on<NextPageViewEvent>((event, emit) => emit(NextPageViewState()));
    on<NavToHomeScrenEvent>((event, emit) => emit(NavToHomeScreenState()));
  }
}
