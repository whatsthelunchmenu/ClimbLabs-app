import 'package:climb_labs/app/root.dart';
import 'package:climb_labs/app/ui/android/screens.dart'
    show Home, Detail, Search, SearchDetail;
import 'package:get/route_manager.dart';

part './app_routes.dart';

class AppPages {
  static final pages = [
    GetPage(name: Routes.ROOT, page: () => const Root()),
    GetPage(name: Routes.HOME, page: () => const Home()),
    GetPage(name: Routes.DETAIL, page: () => const Detail()),
    GetPage(name: Routes.SEARCH, page: () => const Search()),
    GetPage(name: Routes.SEARCH_DETAIL, page: () => const SearchDetail()),
  ];
}
