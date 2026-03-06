import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';
import 'package:recipe_app_frontend/src/app.dart';
import 'package:recipe_app_frontend/src/state/recipe_store.dart';

void main() {
  testWidgets('App boots and shows Explore header', (WidgetTester tester) async {
    await tester.pumpWidget(
      ChangeNotifierProvider(
        create: (_) => RecipeStore()..init(),
        child: const RecipeApp(),
      ),
    );

    // Let initial build happen (store may still be initializing but UI should render).
    await tester.pump();

    expect(find.text('Explore Recipes'), findsOneWidget);
  });
}
