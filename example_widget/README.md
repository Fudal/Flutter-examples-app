## Get started
The application was expanded a bit more than the task required to introduce the proper file structure into the application, and to prepare this application (any application worth) for expansion and use of repository downloads. The application is also ready to introduce state management, e.g. through Bloc
## Translations
The application is adapted to two languages, PL and EN. If you want to add new values to the translation, you can add them to the right json file and then execute the command:
Run `flutter pub run easy_localization:generate -f keys -o locale_keys.g.dart -S assets/translations`
