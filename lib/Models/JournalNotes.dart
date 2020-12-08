class JournalNotes {
    int id;
    String contents;

    JournalNotes({
        this.id,
        this.contents,
    });

    // Create a Note from JSON data
    factory JournalNotes.fromMap(Map<String, dynamic> json) => new JournalNotes(
        id: json["id"],
        contents: json["content"],
    );

    // Convert our Note to JSON to make it easier when we store it in the database
    Map<String, dynamic> toMap() => {
        "id": id,
        "content": contents,
    };
}