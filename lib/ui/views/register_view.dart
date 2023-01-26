
import 'package:admin_dashboard/providers/register_form_provider.dart';
import 'package:admin_dashboard/router/router.dart';
import 'package:admin_dashboard/ui/buttons/custom_outlined_button.dart';
import 'package:admin_dashboard/ui/buttons/link_text.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../inputs/custom_inputs.dart';

class RegisterView extends StatelessWidget {
  const RegisterView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create:(context) => RegisterFormProvider(),
      child: Builder(builder: (context) {

        final registerFormProvider = Provider.of<RegisterFormProvider>(context, listen: false);

        return Container(
              margin: const EdgeInsets.only(top: 100),
              padding: const EdgeInsets.symmetric(horizontal: 20),
              //color: Colors.red,
              child: Center(
                  child: ConstrainedBox(
                      constraints: const BoxConstraints(maxWidth: 370),
                      child: Form(
                          key: registerFormProvider.formKey,
                          child: Column(
                              children: [
                                  TextFormField(
                                      onChanged: (value) => registerFormProvider.name = value,
                                      validator:(value) {
                                          if(value==null || value.isEmpty) return "El nombre es obligatorio";
                                          return null;
                                      }, 
                                      style: const TextStyle(color: Colors.white),
                                      decoration: CustomInputs.loginInputDecoration(
                                          hint: 'Ingrese su nombre',
                                          label: 'Nombre',
                                          icon: Icons.supervised_user_circle_outlined)
                                  ),
                                  const SizedBox(height: 20,),
                                  TextFormField(
                                     validator: (value){
                                              if(!EmailValidator.validate(value??'')){
                                                  return "Email invalido";
                                              }
                                      },
                                      onChanged: (value) => registerFormProvider.email = value,
                                      style: const TextStyle(color: Colors.white),
                                      decoration: CustomInputs.loginInputDecoration(
                                          hint: 'Ingrese su correo',
                                          label: 'Email',
                                          icon: Icons.email_outlined)
                                  ),
                                  const SizedBox(height: 20,),
                                  TextFormField(
                                      onChanged: (value) => registerFormProvider.password = value,
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
                                   CustomOutlinedButton(
                                        onPressed: ()=>{
                                            registerFormProvider.validateForm()
                                        }, 
                                        text: 'Crear cuenta', 
                                        isFilled: true,
                                  ),
                                  const SizedBox(height: 20,),
                                  LinkText(
                                        text: "Ir a login", 
                                        onPressed: (){
                                            Navigator.pushNamed(context, Flororouter.loginRoute);
                                        },
                                  )
                                    
                              ],
                          )
                      ),
                  ),
              ),
          );
      },)
    );
  }
  
}