# Getting started

To get the app running, you will need do a few things first.

## Flutter Version Manager, Flutter SDK, tools

Aoba relies on [FVM](https://github.com/fluttertools/fvm) to ensure the use of a [specific Flutter version](../.fvm/fvm_config.json), and uses `flutter_gen` to generate constants for its assets.

1. [Install FVM](https://fvm.app/docs/getting_started/installation) if you don't already have it
2. Run `fvm install` in project directory
3. Install [flutter_gen](https://github.com/FlutterGen/flutter_gen): `fvm dart pub global activate flutter_gen`
4. Any time you need to run a `flutter` command, run it with FVM: `fvm flutter doctor`.

## Change the redirect URL Scheme

1. Open the [AndroidManifest](../android/app/src/main/AndroidManifest.xml) file and find the section configuring deep links. Replace the value of `android:scheme` from `aoba-anilist` to whatever else you like.
2. _TODO: Add iOS instructions whenever we implement auth on iOS_

## Register an app on AniList

1. Go to [Settings > Developer](https://anilist.co/settings/developer) on AniList
2. Click `Create New Client` and give it a name
3. Enter the following redirect URL, while replacing the host with the one you chose in the previous section: `your-host://app/redirect`. So for example, while the original was `aoba-anilist://app/redirect`, your version should look like `suzaku://app/redirect`.
4. Save

## Use your Client ID

1. Create a copy of [anilist_consts.sample.dart](../lib/consts/anilist_consts.sample.dart) and rename it to `anilist_consts.dart`
2. Change `clientId` to the Client ID you got from AniList when you created your app in the previous section

_Note: `anilist_consts.dart` is excluded from version control._

## Run code generation

### MacOS/Linux
`./run gen` or `./run gen watch`

### Windows:
`./run.bat gen` or `./run.bat gen watch`

All of these scripts run build_runner under the hood.