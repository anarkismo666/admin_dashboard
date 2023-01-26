

import 'package:admin_dashboard/providers/auth_provider.dart';
import 'package:flutter/material.dart';

class LoginFormProvider extends ChangeNotifier{

    // LLave global para control de formulario
    GlobalKey<FormState> formKey = GlobalKey<FormState>();

    // referencia al AuthProvider

    final AuthProvider authProvider;
    String email='';
    String password ='';

  LoginFormProvider(this.authProvider);

    validateForm(){
        if(formKey.currentState!.validate()){
            print("Formulario valido");
            print("Mail :"+email);
            print("Password :"+password);
            //  Prueba de auth
            authProvider.login(email, password);
        }
        else
        {
            print("INVALID!!!");
        }

        
    }

}