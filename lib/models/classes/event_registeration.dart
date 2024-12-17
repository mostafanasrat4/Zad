class EventRegisteration {
  String EventID;
  String userID;
  bool? attended;
  EventRegisteration(this.EventID, this.userID, this.attended);

  factory EventRegisteration.fromMap(Map<String, dynamic> map) {
    return EventRegisteration(
      map['EventID'] ?? '',
      map['userID'] ?? '',
      map['attended'] ?? '',
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'EventID': EventID,
      'userID': userID,
      'attended': attended,
    };
  }
}