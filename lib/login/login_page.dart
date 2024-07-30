import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:login_bloc/login/bloc/login_bloc.dart';
import 'package:login_bloc/login/model/login_req_model.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});

  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login Page'),
      ),
      body: BlocBuilder<LoginBloc, LoginState>(
        builder: (context, state) {
          if(state is LoginInitialState) {
            return Padding(
            padding: const EdgeInsets.all(24.0),
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              TextField(
                controller: usernameController,
                decoration: const InputDecoration(hintText: 'username'),
              ),
              const SizedBox(
                height: 20,
              ),
              TextField(
                controller: passwordController,
                decoration: const InputDecoration(hintText: 'password'),
              ),
              const SizedBox(
                height: 20,
              ),
              ElevatedButton(
                  onPressed: () {
                    var req = LoginReqModel(
                        username: usernameController.text,
                        password: passwordController.text);
                    BlocProvider.of<LoginBloc>(context)
                        .add(LoginReqEvent(loginReqModel: req));
                  },
                  child: const Text('Login'))
            ]),
          );
          }
          else if(state is LoginLoadingState){
            return const Center(child: CircularProgressIndicator());
          }
          else if(state is LoginLoadedState){
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(state.loginResModel.firstName ?? ''),
                  Text(state.loginResModel.lastName ?? ''),
                  Text(state.loginResModel.email ?? ''),
                  Text(state.loginResModel.gender ?? ''),
                  // Image.network(state.loginResModel.image.toString())
                ],
              ),
            );
          }
          else if(state is LoginErrorState){
            return Center(child: Text(state.message ,style: const TextStyle(color: Colors.red),));
          }
          else{
            return Container();
          }
        },
      ),
    );
  }
}
