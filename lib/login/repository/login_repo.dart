
import 'dart:convert';
import 'package:http/http.dart'as http;
import 'package:login_bloc/login/model/login_req_model.dart';
import 'package:login_bloc/login/model/login_res_model.dart';

class LoginRepo{



  Future<LoginResModel> login(String username,String password) async{
    LoginReqModel loginReqModel= LoginReqModel(username: username, password: password);
    var baseUrl = 'https://dummyjson.com/auth/login';
   

    var response = await http.post(Uri.parse(baseUrl), 
    headers: {'Content-Type': 'application/json'},
    body: jsonEncode(loginReqModel.toJson())
    
    );

    try {
      if(response.statusCode==200){
        var data = response.body;
        // print(data);
        var respBody= jsonDecode(data);

        return LoginResModel.fromJson(respBody);

        
      }
      else{
        print(response.statusCode);
        throw Exception('Invalid Credential ${response.statusCode}');

      } 
    } catch (e) {
      print(e); 
      throw Exception(e);
    }

  }



}