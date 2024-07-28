// language_data.dart
// The file contains the initializations and the data for every language.
// (main.dart) -> (settings_functionality.dart) -> (languages_implementation.dart) -> .

// Define the enum for language options
enum LanguageOption { english, german, french, spanish, italian, greek, romanian, chinese, japanese, korean }

final Map<LanguageOption, String> languageOptions = { // TODO: Make sure they're correct
  LanguageOption.english: "English",
  LanguageOption.german: "Deutsch",
  LanguageOption.french: "Français",
  LanguageOption.spanish: "Español",
  LanguageOption.italian: "Italiano",
  LanguageOption.greek: "Ελληνικά",
  LanguageOption.romanian: "Română",
  LanguageOption.chinese: "中國人",
  LanguageOption.japanese: "日本語",
  LanguageOption.korean: "한국어",
};

class LanguageData { // TODO: Finish all these
  static final Map<String, Map<String, String>> _localizedValues = {
    // english, deutsch, french, spanish, italian, greek, romanian, chinese, japanese, korean
    "en": { // Native translator
      "timer": "Timer",
      "settings": "Settings",
      "setting1": "Themes",
      "setting2": "Languages",
      "setting3": "Exit",
      "language": "",
      "chooseTheme": "",
      "chooseLanguage": "",
      "exitSettings": "",
      "addNote": "Add a note",
      "enterTitle": "Enter note title",
      "enterTitleHint": "My Diary",
      "cancelTitle": "Cancel",
      "confirmTitle": "Confirm",
      "newNoteGoBack": "Go Back",
      "newNoteSaveTitle": "Save Title",
      "newNoteEditTitle": "Edit Title",
      "newNoteTextHint": "Date 25/07/2024\n\nYesterday, I began studying flutter and dart..."
    },
    
    "de": {
      "timer": "",
      "settings": "",
      "setting1": "",
      "setting2": "",
      "setting3": "",
      "language": "",
      "chooseTheme": "",
      "chooseLanguage": "",
      "exitSettings": "",
      "addNote": "",
      "enterTitle": "",
      "enterTitleHint": "",
      "cancelTitle": "",
      "confirmTitle": "",
      "newNoteGoBack": "",
      "newNoteSaveTitle": "",
      "newNoteEditTitle": "",
      "newNoteTextHint": ""
    },

    "fr": {
      "timer": "",
      "settings": "",
      "setting1": "",
      "setting2": "",
      "setting3": "",
      "language": "",
      "chooseTheme": "",
      "chooseLanguage": "",
      "exitSettings": "",
      "addNote": "",
      "enterTitle": "",
      "enterTitleHint": "",
      "cancelTitle": "",
      "confirmTitle": "",
      "newNoteGoBack": "",
      "newNoteSaveTitle": "",
      "newNoteEditTitle": "",
      "newNoteTextHint": ""
    },

    "es": {
      "timer": "",
      "settings": "",
      "setting1": "",
      "setting2": "",
      "setting3": "",
      "language": "",
      "chooseTheme": "",
      "chooseLanguage": "",
      "exitSettings": "",
      "addNote": "",
      "enterTitle": "",
      "enterTitleHint": "",
      "cancelTitle": "",
      "confirmTitle": "",
      "newNoteGoBack": "",
      "newNoteSaveTitle": "",
      "newNoteEditTitle": "",
      "newNoteTextHint": ""
    },

    "it": {
      "timer": "",
      "settings": "",
      "setting1": "",
      "setting2": "",
      "setting3": "",
      "language": "",
      "chooseTheme": "",
      "chooseLanguage": "",
      "exitSettings": "",
      "addNote": "",
      "enterTitle": "",
      "enterTitleHint": "",
      "cancelTitle": "",
      "confirmTitle": "",
      "newNoteGoBack": "",
      "newNoteSaveTitle": "",
      "newNoteEditTitle": "",
      "newNoteTextHint": ""
    },

    "gr": { // Native translator
      "timer": "Χρονόμετρο",
      "settings": "Ρυθμίσεις",
      "setting1": "Θέματα", // TODO: should I have the setting(k) or the "chooseTheme", "chooseLanguage" etc? I mean what was their purpose?
      "setting2": "Γλώσσες", // They don"t make sense and seem like they"re just duplicates
      "setting3": "Έξοδος",
      "language": "",
      "chooseTheme": "",
      "chooseLanguage": "",
      "exitSettings": "",
      "addNote": "Προσθέστε μία σημείωση",
      "enterTitle": "Επιλέξτε έναν τίτλο",
      "enterTitleHint": "Το ημερολόγιό μου",
      "cancelTitle": "Ακύρωση",
      "confirmTitle": "Συνέχεια",
      "newNoteGoBack": "Πίσω",
      "newNoteSaveTitle": "Αποθήκευση τίτλου",
      "newNoteEditTitle": "Επεξεργασία τίτλου",
      "newNoteTextHint": "Ημερομηνία: 25/07/2024\n\nΧθες, ξεκίνησα να διαβάσω flutter και dart..."
    },

    "ro": { // Native translator
      "timer": "Temporizator",
      "settings": "Setări",
      "setting1": "Teme",
      "setting2": "Limbi",
      "setting3": "Ieșire",
      "language": "",
      "chooseTheme": "",
      "chooseLanguage": "",
      "exitSettings": "",
      "addNote": "Adaugă notiță",
      "enterTitle": "Introdu Titlul notiței",
      "enterTitleHint": "Jurnalul meu",
      "cancelTitle": "Șterge",
      "confirmTitle": "Confirmare",
      "newNoteGoBack": "Înapoi",
      "newNoteSaveTitle": "Salvează titlul",
      "newNoteEditTitle": "Editează titlul",
      "newNoteTextHint": "Data 26/07/24\n\nIeri, am început să învăț..."
    },

    "cn": {
      "timer": "",
      "settings": "",
      "setting1": "",
      "setting2": "",
      "setting3": "",
      "language": "",
      "chooseTheme": "",
      "chooseLanguage": "",
      "exitSettings": "",
      "addNote": "",
      "enterTitle": "",
      "enterTitleHint": "",
      "cancelTitle": "",
      "confirmTitle": "",
      "newNoteGoBack": "",
      "newNoteEditTitle": "",
      "newNoteTextHint": ""
    },

    "jp": {
      "timer": "",
      "settings": "",
      "setting1": "",
      "setting2": "",
      "setting3": "",
      "language": "",
      "chooseTheme": "",
      "chooseLanguage": "",
      "exitSettings": "",
      "addNote": "",
      "enterTitle": "",
      "enterTitleHint": "",
      "cancelTitle": "",
      "confirmTitle": "",
      "newNoteGoBack": "",
      "newNoteEditTitle": "",
      "newNoteTextHint": ""
    },

    "kr": { // Trusted source
      "timer": "",
      "settings": "",
      "setting1": "",
      "setting2": "",
      "setting3": "",
      "language": "",
      "chooseTheme": "",
      "chooseLanguage": "",
      "exitSettings": "",
      "addNote": "",
      "enterTitle": "",
      "enterTitleHint": "",
      "cancelTitle": "",
      "confirmTitle": "",
      "newNoteGoBack": "",
      "newNoteEditTitle": "",
      "newNoteTextHint": ""
    },
  };

  static String languageCode = "en";

  static String getText(String key) {
    return _localizedValues[languageCode]?[key] ?? key;
  }

  static void setLanguage(String code) {
    languageCode = code;
  }

  static String getLanguageCode(LanguageOption language) {
    switch (language) {
      case LanguageOption.english:
        return "en";
      case LanguageOption.german:
        return "de";
      case LanguageOption.french:
        return "fr";
      case LanguageOption.spanish:
        return "es";
      case LanguageOption.italian:
        return "it";
      case LanguageOption.greek:
        return "gr";
      case LanguageOption.romanian:
        return "ro";
      case LanguageOption.chinese:
        return "cn";
      case LanguageOption.japanese:
        return "jp";
      case LanguageOption.korean:
        return "kr";
      default:
        return "en"; // Fallback to English
    }
  }
}
