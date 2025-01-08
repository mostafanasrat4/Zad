class topics{
  String topic;
  Set<String> users;
  topics(this.topic, this.users);


  Map<String, dynamic> toMap()=>{
    'topic': topic,
    'users': users.toList(),
  };

  static topics fromMap(Map<String, dynamic> map){
    return topics(
      map['topic'],
      Set.from(map['users']),
    );
  }
}
