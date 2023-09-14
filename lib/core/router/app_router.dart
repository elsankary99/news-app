import 'package:auto_route/auto_route.dart';
import 'package:news_app/screen/view/braking_news_page.dart';
import 'package:news_app/screen/view/home/initial_page.dart';
import 'package:news_app/screen/view/news_details_page.dart';
import 'package:news_app/screen/view/recommendation_page.dart';
import 'package:news_app/screen/view/search_page.dart';

part 'app_router.gr.dart';

final router = AppRouter();

@AutoRouterConfig()
class AppRouter extends _$AppRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(page: InitialRoute.page, initial: true),
        AutoRoute(page: BreakingNewsRoute.page),
        AutoRoute(page: RecommendationRoute.page),
        AutoRoute(page: SearchRoute.page),
        AutoRoute(page: NewsDetailsRoute.page),
      ];
}
