
class CommentariesModel {
  List<CommentaryList>? commentaryList;
  CommentariesModel({
    this.commentaryList,
  });
}

class CommentaryList {
  CommentaryList({
    this.commText,
    this.timestamp,
    this.ballNbr,
    this.event,
    this.batTeamName,
    this.overNumber,

  });

  String? commText;
  dynamic timestamp;
  dynamic ballNbr;
  dynamic inningsId;
  String? event;
  String? batTeamName;
  CommentaryFormats? commentaryFormats;
  double? overNumber;

}





class CommentaryFormats {
  CommentaryFormats({
    this.bold,
  });

  Bold? bold;


}

class Bold {
  Bold({
    this.formatId,
    this.formatValue,
  });

  List<String>? formatId;
  List<String>? formatValue;

}


