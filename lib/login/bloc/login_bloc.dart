import 'package:bloc/bloc.dart';
import 'package:login_bloc/login/model/login_res_model.dart';
import 'package:meta/meta.dart';

import '../model/login_req_model.dart';
import '../repository/login_repo.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(LoginInitialState()) {
    on<LoginReqEvent>((event, emit) async{
      emit(LoginLoadingState());


      try{

      LoginResModel loginRespModel =  await LoginRepo().login(event.loginReqModel.username?? "", event.loginReqModel?.password?? "");

      emit(LoginLoadedState(loginResModel: loginRespModel));

      }
      catch(e){
        emit(LoginErrorState(message: e.toString()));
      }




    });
  }
}
