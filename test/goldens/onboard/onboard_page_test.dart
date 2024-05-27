import 'package:flutter/material.dart';
import 'package:golden_toolkit/golden_toolkit.dart';
import 'package:the_movies_api/presentation/onboard/views/onboard_page.dart';

void main() {
  testGoldens("OnboardPage testGoldens", (tester) async {
    //arrange
    await loadAppFonts();

    final builder = DeviceBuilder()
      //Informa que este teste vai ser em vários dispositivos
      ..overrideDevicesForAllScenarios(devices: [
        Device.phone,
        Device.iphone11,
        Device(name: "mega", size: Size(400, 600), textScale: 1.5),
      ])
      ..addScenario(
        //Adiciona um widget
        name: "OnboardPage",
        widget: OnboardPage(),
      );

    //act
    //Para testar em vários dispositivos
    await tester.pumpDeviceBuilder(builder);

    //assert
    await screenMatchesGolden(tester, "onboard_page");
  });
}
