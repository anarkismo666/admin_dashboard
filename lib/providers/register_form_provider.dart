
import 'package:flutter/material.dart';

class RegisterFormProvider extends ChangeNotifier{

    GlobalKey<FormState> formKey = GlobalKey<FormState>();
    
    String email='';
    String password ='';
    String name ='';

    validateForm(){
        if(formKey.currentState!.validate()){
            print("Formulario valido");
        }
        else
        {
            print("INVALID!!!");
        }

        print("Mail :"+email);
    }
}