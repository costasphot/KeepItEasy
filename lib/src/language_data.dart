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
  static final Map<String, Map<String, String>> localizedLanguageValues = {
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
      "newNoteGoBack": "Go back",
      "newNoteSaveTitle": "Save Title",
      "newNoteEditTitle": "Edit Title",
      "newNoteTextHint": "Date 25/07/2024\n\nYesterday, I began studying Flutter and Dart..."
    },
    
    "de": {
      "timer": "Timer",
      "settings": "Einstellungen",
      "setting1": "Themen",
      "setting2": "Sprachen",
      "setting3": "Ausfahrt",
      "language": "",
      "chooseTheme": "",
      "chooseLanguage": "",
      "exitSettings": "",
      "addNote": "Fügen Sie eine Notiz hinzu",
      "enterTitle": "Geben Sie den Notiztitel ein",
      "enterTitleHint": "Mein Tagebuch",
      "cancelTitle": "Stornieren",
      "confirmTitle": "Bestätigen",
      "newNoteGoBack": "Geh zurück",
      "newNoteSaveTitle": "Titel speichern",
      "newNoteEditTitle": "Titel bearbeiten",
      "newNoteTextHint": "Datum 25.07.2024\n\nGestern habe ich angefangen, Flutter und Dart zu lernen ..."
    },

    "fr": {
      "timer": "Minuteur",
      "settings": "Paramètres",
      "setting1": "Thèmes",
      "setting2": "Langues",
      "setting3": "Sortie",
      "language": "",
      "chooseTheme": "",
      "chooseLanguage": "",
      "exitSettings": "",
      "addNote": "Ajouter une note",
      "enterTitle": "Saisissez le titre de la note",
      "enterTitleHint": "Mon journal",
      "cancelTitle": "Annuler",
      "confirmTitle": "Confirmer",
      "newNoteGoBack": "Retourner",
      "newNoteSaveTitle": "Enregistrer le titre",
      "newNoteEditTitle": "Modifier le titre",
      "newNoteTextHint": "Date 25/07/2024\n\nHier, j'ai commencé à étudier Flutter et Dart..."
    },

    "es": {
      "timer": "Minutero",
      "settings": "Ajustes",
      "setting1": "Temas",
      "setting2": "Idiomas",
      "setting3": "Salida",
      "language": "",
      "chooseTheme": "",
      "chooseLanguage": "",
      "exitSettings": "",
      "addNote": "Añadir una nota",
      "enterTitle": "Ingrese el título de la nota",
      "enterTitleHint": "Mi Diario",
      "cancelTitle": "Cancelar",
      "confirmTitle": "Confirmar",
      "newNoteGoBack": "Volver",
      "newNoteSaveTitle": "Guardar título",
      "newNoteEditTitle": "Editar título",
      "newNoteTextHint": "Fecha 25/07/2024\n\nAyer comencé a estudiar Flutter y Dart..."
    },

    "it": {
      "timer": "Timer",
      "settings": "Impostazioni",
      "setting1": "Temi",
      "setting2": "Lingue",
      "setting3": "Uscita",
      "language": "",
      "chooseTheme": "",
      "chooseLanguage": "",
      "exitSettings": "",
      "addNote": "Aggiungi una nota",
      "enterTitle": "Inserisci il titolo della nota",
      "enterTitleHint": "Il mio diario",
      "cancelTitle": "Cancellare",
      "confirmTitle": "Confermare",
      "newNoteGoBack": "Torna indietro",
      "newNoteSaveTitle": "Salva titolo",
      "newNoteEditTitle": "Modifica titolo",
      "newNoteTextHint": "Data 25/07/2024\n\nIeri ho iniziato a studiare Flutter e Dart..."
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
      "addNote": "Προσθήκη σημείωσης",
      "enterTitle": "Επιλέξτε έναν τίτλο",
      "enterTitleHint": "Το ημερολόγιό μου",
      "cancelTitle": "Ακύρωση",
      "confirmTitle": "Συνέχεια",
      "newNoteGoBack": "Πίσω",
      "newNoteSaveTitle": "Αποθήκευση τίτλου",
      "newNoteEditTitle": "Επεξεργασία τίτλου",
      "newNoteTextHint": "Ημερομηνία: 25/07/2024\n\nΧθες, ξεκίνησα να διαβάσω Flutter και Dart..."
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
      "newNoteTextHint": "Data 25/07/2024\n\nIeri, am început să studiez Flutter și Dart..."
    },

    "cn": {
      "timer": "计时器",
      "settings": "设置",
      "setting1": "主题",
      "setting2": "语言",
      "setting3": "出口",
      "language": "",
      "chooseTheme": "",
      "chooseLanguage": "",
      "exitSettings": "",
      "addNote": "添加注释",
      "enterTitle": "输入笔记标题",
      "enterTitleHint": "我的日记",
      "cancelTitle": "取消",
      "confirmTitle": "确认",
      "newNoteGoBack": "回去",
      "newNoteEditTitle": "保存标题",
      "newNoteTextHint": "日期 25/07/2024\n\n昨天，我开始学习 Flutter 和 Dart..."
    },

    "jp": {
      "timer": "タイマー",
      "settings": "設定",
      "setting1": "テーマ",
      "setting2": "言語",
      "setting3": "出口",
      "language": "",
      "chooseTheme": "",
      "chooseLanguage": "",
      "exitSettings": "",
      "addNote": "メモを追加する",
      "enterTitle": "メモのタイトルを入力してください",
      "enterTitleHint": "私の日記",
      "cancelTitle": "キャンセル",
      "confirmTitle": "確認する",
      "newNoteGoBack": "戻る",
      "newNoteSaveTitle": "タイトルの保存",
      "newNoteEditTitle": "タイトルの編集",
      "newNoteTextHint": "日付 25/07/2024\n\n昨日、私は Flutter と Dart の勉強を始めました..."
    },

    "kr": { // Trusted source
      "timer": "시간제 노동자",
      "settings": "설정",
      "setting1": "테마",
      "setting2": "언어",
      "setting3": "출구",
      "language": "",
      "chooseTheme": "",
      "chooseLanguage": "",
      "exitSettings": "",
      "addNote": "메모 추가",
      "enterTitle": "메모 제목 입력",
      "enterTitleHint": "나의 일기",
      "cancelTitle": "취소",
      "confirmTitle": "확인하다",
      "newNoteGoBack": "돌아가기",
      "newNoteSaveTitle": "제목 저장",
      "newNoteEditTitle": "제목 편집",
      "newNoteTextHint": "날짜 2024년 7월 25일\n\n어제부터 Flutter와 Dart를 공부하기 시작했습니다..."
    },
  };

  static String languageCode = "en";

  static String getText(String key) {
    return localizedLanguageValues[languageCode]?[key] ?? key;
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
