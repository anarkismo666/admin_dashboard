
import 'package:admin_dashboard/router/auth_handlers.dart';
import 'package:admin_dashboard/router/no_page_handlers.dart';
import 'package:fluro/fluro.dart';

class Flororouter{
    static final FluroRouter router = FluroRouter();

    // RUTAS AUTH
    static String rootRoute = '/';
    static String loginRoute = '/auth/login';
    static String registerRoute = '/auth/register';

    // RUTAS DASHBOART
    static String dashboardRoute = '/dashboard';

    // CONFIGURACIÓN

    static void configureRoutes(){
        // DEFINICIONES DE AUTH ROUTES
        router.define(rootRoute, handler: AdminHandlers.login, transitionType: TransitionType.none);
        router.define(loginRoute, handler: AdminHandlers.login, transitionType: TransitionType.none);
        router.define(registerRoute, handler: AdminHandlers.register, transitionType: TransitionType.none);
        //404
        router.notFoundHandler = NoPageFoundHandler.nopagefound;
    }
}