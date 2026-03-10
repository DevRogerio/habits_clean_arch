const String habitstableName = 'habits';
const String habitstableId = 'id';
const String habitstableTitle = 'title';
const String habitstableCreatedAt = 'created_at';

const String createHabitsTable = '''
  CREATE TABLE habits (
    $habitstableName TEXT PRIMARY KEY,
    $habitstableTitle TEXT NOT NULL,
    $habitstableCreatedAt TEXT NOT NULL
  )''';
