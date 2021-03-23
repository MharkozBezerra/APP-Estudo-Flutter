class Video {
  String id, titulo, imagem, canal, descricao;
  //Construtor
  Video({this.id, this.titulo, this.imagem, this.canal, this.descricao});

  //Não otima  o resultado
  static converterJson(Map<String, dynamic> json) {
    return Video(
      id: json['id']['videoId'],
      titulo: json['snippet']['title'],
      imagem: json['snippet']['thumbnaisl']['high']['url'],
      canal: json['snippet']['channelId'],
      descricao: json['snippet']['title'],
    );
  }

  factory Video.fromJson(Map<String, dynamic> json) {
    return Video(
      id: json['id']['videoId'],
      titulo: json['snippet']['title'],
      imagem: json['snippet']['thumbnaisl']['high']['url'],
      canal: json['snippet']['channelId'],
      descricao: json['snippet']['title'],
    );
  }
}
