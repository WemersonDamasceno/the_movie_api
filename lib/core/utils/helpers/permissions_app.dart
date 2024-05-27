import 'package:configcat_client/configcat_client.dart';
import 'package:the_movies_api/core/utils/enums/feature_flags_enum.dart';

class PermissionsApp {
  Future<bool> isFeatureEnabled(FeatureFlagsEnum featureFlag) async {
    final client = ConfigCatClient.get(
      sdkKey: 'YOUR_SDK_KEY',
      options: ConfigCatOptions(
        logger: ConfigCatLogger(level: LogLevel.info),
      ),
    );

    final result = await client.getValue(
      key: featureFlag.value,
      defaultValue: false,
    );

    return result;
  }
}
