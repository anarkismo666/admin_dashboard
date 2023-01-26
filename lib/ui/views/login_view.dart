
import 'package:admin_dashboard/providers/auth_provider.dart';
import 'package:admin_dashboard/providers/login_form_provider.dart';
import 'package:admin_dashboard/router/router.dart';
import 'package:admin_dashboard/ui/buttons/custom_outlined_button.dart';
import 'package:admin_dashboard/ui/buttons/link_text.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../inputs/custom_inputs.dart';

class LoginView extends StatelessWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    
    final authProvider = Provider.of<AuthProvider>(context);
   
    return ChangeNotifierProvider(
      create: (context) => LoginFormProvider(),
      child: Builder(
          builder: (context){

              final loginFormProvider = Provider.of<LoginFormProvider>(context, listen: true);

              return Container(
                  margin: const EdgeInsets.only(top: 100),
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  //color: Colors.red,
                  child: Center(
                      child: ConstrainedBox(
                          constraints: const BoxConstraints(maxWidth: 370),
                          child: Form(
                              autovalidateMode: AutovalidateMode.always,
                              key: loginFormProvider.formKey,
                              child: Column(
                                  children: [
                                      TextFormField(
                                          validator: (value){
                                              if(!EmailValidator.validate(value??'')){
                                                  return "Email invalido";
                                              }
                                          },
                                          onChanged: (value) => loginFormProvider.email = value,
                                          style: const TextStyle(color: Colors.white),
                                          decoration: CustomInputs.loginInputDecoration(
                                              hint: 'Ingrese su correo',
                                              label: 'Email',
                                              icon: Icons.email_outlined)
                                      ),
            
                                      const SizedBox(height: 20,),
            
                                      TextFormField(
                                          onChanged: (value) => loginFormProvider.password = value,
                                          validator: (value){
                                              if(value == null || value.isEmpty){
                                                  return 'Ingrese una contraseña';
                                              }
            
                                              if( value.length<6){
                                                  return 'Ingrese una contraseña debe ser mayor a 6 caractéres';
                                              }
                                              
                                              return null; // significa valido
                                          },
                                          obscureText: true,
                                          style: const TextStyle(color: Colors.white),
                                          decoration: CustomInputs.loginInputDecoration(
                                              hint: 'Ingrese su password',
                                              label: 'Password',
                                              icon: Icons.lock_outline),
                                              maxLength: 8,
                                      ),
                                      const SizedBox(height: 20,),
                                      CustomOutlinedButton(onPressed: (){
                                            final isValid = loginFormProvider.validateForm();
                                            if(isValid){
                                              authProvider.login(loginFormProvider.email, loginFormProvider.password);
                                            }
                                          }, text: 'INGRESAR', isFilled: true,),
                                      const SizedBox(height: 20,),
                                      LinkText(
                                          text: "Nueva cuenta", 
                                          onPressed: (){ 
                                              Navigator.pushNamed(context, Flororouter.registerRoute);
                                              //print("IR A REGISTRO");
                                          },
                                      )
                                        
                                  ],
                              )
                          ),
                      ),
                  ),
              );
          }
      
      )
    );
  }
  
}