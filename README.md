# Essy Creations — App ya Simu (Android & iPhone)

App hii inaonyesha tovuti ya **https://essycreations.co.tz** kama ilivyo, ndani ya app yenye icon na splash screen ya Essy Creations. Ina kitufe cha dhahabu **🔒 Admin Login** kona ya chini kulia, kinachompeleka admin moja kwa moja kwenye `https://essycreations.co.tz/login`.

## Kilichomo
- Tovuti nzima ndani ya app. Ukibadilisha kitu kwenye tovuti, app inabadilika yenyewe bila kuisasisha.
- Kitufe cha **Admin Login** kwenye kila ukurasa. Kinajificha ukiwa tayari kwenye `/login`, `/admin` au `/dashboard`.
- Viungo vya WhatsApp, simu, email na Instagram vinafunguka kwenye app husika ya simu.
- Kitufe cha "Back" cha Android kinarudi ukurasa uliopita badala ya kufunga app.
- Ukurasa wa "Hakuna mtandao" wenye kitufe cha kujaribu tena.
- Ruhusa ya kamera (kuscan QR getini) na kupakia faili (guest list).
- App ID: `tz.co.essycreations.app`

## Njia rahisi: kujenga APK bure kwa GitHub (bila kusakinisha chochote)
1. Fungua akaunti ya https://github.com (bure) na utengeneze repository mpya, mfano `essy-creations-app`.
2. Pakia (upload) faili zote za folda hii, ikiwemo folda iliyofichwa `.github`.
3. Nenda tab ya **Actions**. Build itaanza yenyewe; subiri kama dakika 5–10.
4. Fungua build iliyokamilika, kisha shuka chini kwenye **Artifacts** na upakue **EssyCreations-Android**.
5. Ndani yake kuna `EssyCreations.apk`. Itume kwenye simu ya Android, ifungue na uruhusu "Install unknown apps".

## Android kwa kompyuta (Android Studio)
```bash
npm install
npx cap sync android
npx cap open android      # Android Studio inafunguka → Build ▸ Build APK
```
Kwa **Google Play Store** utahitaji akaunti ya Google Play Developer (USD 25 mara moja) na kusaini app (Build ▸ Generate Signed Bundle).

## iPhone (iOS)
Apple inaruhusu kujenga app ya iPhone kwenye **Mac yenye Xcode** tu, na kuiweka kwenye iPhone halisi au App Store kunahitaji **Apple Developer Program (USD 99 kwa mwaka)**.
```bash
npm install
npx cap sync ios
npx cap open ios          # Xcode → chagua Team yako → Product ▸ Archive → App Store / TestFlight
```
GitHub Actions pia inajenga toleo la iOS Simulator ili kuthibitisha kuwa code inafanya kazi.

## Kubadilisha vitu
| Unataka kubadilisha | Faili |
|---|---|
| Anwani ya tovuti / jina la app | `capacitor.config.json` |
| Kitufe cha Admin (Android) | `android/app/src/main/assets/admin-button.js` |
| Kitufe cha Admin (iPhone) | `ios/App/App/SceneDelegate.swift` |
| Ukurasa wa "Hakuna mtandao" | `www/offline.html` |
| Icon / Splash | `assets/` kisha `npx capacitor-assets generate` |

Baada ya kubadilisha, endesha `npx cap sync`.
