Deployments
===

The [deploy](../.github/workflows/deploy.yml) workflow deploys every push to the `dev` branch to the Internal testing track on Google Play.

The [deploy_pr](../..github/workflows/deploy_pr.yml) workflow deploys every PR to a temporary page on Firebase Hosting, to provide a quick preview of the changes.

Secrets:

| Name | Purpose | Format |
| ---- | ------- | ------ |
| `ANILIST_CONSTS_DART` | Constants such as Cliend ID ([see sample](../lib/consts/anilist_consts.sample.dart)) | Base64 encoded Dart file |
| `FIREBASE_PROJECT_ID` | Used to deploy a preview build to Firebase Hosting (e.g. `yourapp-c778d`) | String |
| `FIREBASE_HOSTING_CREDENTIALS` | Service Account to authenticate preview deployments to Firebase Hosting ([see more](https://github.com/FirebaseExtended/action-hosting-deploy/blob/main/docs/service-account.md)) | Base64 encoded JSON |
| `GOOGLE_PLAY_JSON_KEY` | Service Account to authenticate Google Play deployments with Fastlane ([see more](https://docs.fastlane.tools/getting-started/android/setup#collect-your-google-credentials)) | Base64 encoded JSON |
| `KEY_PROPERTIES` | Holds alias and passwords for the upload key ([see sample](../android/key.properties.sample)) | Base64 encoded file contents |
| `UPLOAD_KEYSTORE` | Upload key for Google Play | Base64 encoded file |
