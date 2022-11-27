# Getting started

This document assumes that you have a working Flutter (stable) environment. If you don't, [here's a link](https://docs.flutter.dev/get-started).

To get the app running, you will need do a few things first.

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

_Note: if you are setting up CI/CD, remember that `anilist_consts.dart` is excluded from version control._
