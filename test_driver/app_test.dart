import 'package:flutter_driver/flutter_driver.dart';
import 'package:test/test.dart';

void main() {
  group('Flutter driver test App', () {
    final writeDataFinder = find.byValueKey("write_data");
    final addDataFinder = find.byValueKey("add_data");
    var dummy_data = "hello";

    FlutterDriver driver;

    setUpAll(() async {
      driver = await FlutterDriver.connect();
    });

    tearDownAll(() async {
      if (driver != null) {
        driver.close();
      }
    });
    test("check health", () async {
      Health health = await driver.checkHealth();
      print(health.status);
    });

    test("flutter drive test", () async {
      await driver.tap(writeDataFinder);
      await driver.enterText(dummy_data);
      await driver.screenshot();
      await driver.tap(addDataFinder);
      await driver.screenshot();
    });
  });
}
