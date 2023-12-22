import 'package:app_dev_final/main.dart';
import 'package:app_dev_final/pages/question_two.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:golden_toolkit/golden_toolkit.dart';

import '../widget_test.dart';
void main() {
  setUpAll(() => {
    loadAppFonts()
    });
  testWidgets('Golden test', (tester) async {
final builder = DeviceBuilder()
      ..overrideDevicesForAllScenarios(devices: [
        Device.phone,
        Device.iphone11,
        Device.tabletPortrait,
        Device.tabletLandscape,
      ])
      ..addScenario(
        widget: UiScreen(),
      );
      await tester.pumpDeviceBuilder(
        builder,
        wrapper: materialAppWrapper(
          theme: ThemeData.light(),
          platform: TargetPlatform.android
        )
      );

       await screenMatchesGolden(tester, 'flutter_demo_page_multiple_scenarios');

    
     await tester.pumpWidget(UiScreen());
    // await expectLater(find.byType(MyApp),
    //                   matchesGoldenFile('main.png'));
  });
}
