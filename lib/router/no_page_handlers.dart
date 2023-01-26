
import 'package:admin_dashboard/ui/views/no_page_view_found.dart';
import 'package:fluro/fluro.dart';

class NoPageFoundHandler{

  static Handler nopagefound = Handler(handlerFunc: (context, parameters){
      return const NoPageViewFound();
  },);

}