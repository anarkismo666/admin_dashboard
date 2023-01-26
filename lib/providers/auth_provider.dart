
import 'package:flutter/material.dart';

class AuthProvider extends ChangeNotifier{
    String? _token;

    login(String email, String password){
        //TODO: Petición http
        _token = 'jdgsjd27t278egdwg';
        print("Almacenar JWT: $_token");
        //TODO: Navegar a dashbord
        notifyListeners();
    }
}