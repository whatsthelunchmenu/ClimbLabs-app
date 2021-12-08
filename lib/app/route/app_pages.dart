import 'package:climb_labs/app/root.dart';
import 'package:climb_labs/app/ui/android/screens.dart' show Home;
import 'package:climb_labs/app/ui/android/search/search.dart';
import 'package:climb_labs/app/ui/android/search_detail/search_detail.dart';
import 'package:get/route_manager.dart';

part './app_routes.dart';

class AppPages {
  static final pages = [
    GetPage(name: Routes.ROOT, page: () => const Root()),
    GetPage(name: Routes.HOME, page: () => const Home()),
    GetPage(name: Routes.SEARCH, page: () => const Search()),
    GetPage(name: Routes.SEARCH_DETAIL, page: () => SearchDetail()),
  ];
}
