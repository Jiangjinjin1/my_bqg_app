class BookDetailModel {
  late int Id;
  late String Name;
  late String Img;
  late String Author;
  late String Desc;
  late int CId;
  late String CName;
  late String LastTime;
  late int FirstChapterId;
  late String LastChapter;
  late int LastChapterId;
  late String BookStatus;
  late List<SameUserBookModel> SameUserBooks;
  late List<SameCategoryBookModel> SameCategoryBooks;
  late BookVoteModel BookVote;
  late String UpUser;
  late String Declare;
  late List<dynamic> CloudList;

  BookDetailModel(
      {required this.Id,
      required this.Name,
      required this.Img,
      required this.Author,
      required this.Desc,
      required this.CId,
      required this.CName,
      required this.LastTime,
      required this.FirstChapterId,
      required this.LastChapter,
      required this.LastChapterId,
      required this.BookStatus,
      required this.SameUserBooks,
      required this.SameCategoryBooks,
      required this.BookVote,
      required this.UpUser,
      required this.Declare,
      required this.CloudList});

  factory BookDetailModel.fromJson(dynamic data) {
    return BookDetailModel(
      Id: data['Id'],
      Name: data['Name'],
      Img: data['Img'],
      Author: data['Author'],
      Desc: data['Desc'],
      CId: data['CId'],
      CName: data['CName'],
      LastTime: data['LastTime'],
      FirstChapterId: data['FirstChapterId'],
      LastChapter: data['LastChapter'],
      LastChapterId: data['LastChapterId'],
      BookStatus: data['BookStatus'],
      SameUserBooks: SameUserBookListModel.fromJson(data['SameUserBooks']).list,
      SameCategoryBooks:
          SameCategoryBookListModel.fromJson(data['SameCategoryBooks']).list,
      BookVote: BookVoteModel.fromJson(data['BookVote']),
      UpUser: data['UpUser'],
      Declare: data['Declare'],
      CloudList: data['CloudList'],
    );
  }
}

class SameUserBookModel {
  late int Id;
  late String Name;
  late String Author;
  late String Img;
  late int LastChapterId;
  late String LastChapter;
  late double Score;

  SameUserBookModel(
      {required this.Id,
      required this.Name,
      required this.Author,
      required this.Img,
      required this.LastChapterId,
      required this.LastChapter,
      required this.Score});

  factory SameUserBookModel.fromJson(dynamic data) {
    return SameUserBookModel(
      Id: data['Id'],
      Name: data['Name'],
      Author: data['Author'],
      Img: data['Img'],
      LastChapterId: data['LastChapterId'],
      LastChapter: data['LastChapter'],
      Score: data['Score'],
    );
  }
}

class SameUserBookListModel {
  late List<SameUserBookModel> list;

  SameUserBookListModel(this.list);

  factory SameUserBookListModel.fromJson(List<dynamic> list) {
    return SameUserBookListModel(list
        .map((item) => SameUserBookModel.fromJson(item))
        .toList());
  }
}

class SameCategoryBookModel {
  late int Id;
  late String Name;
  late String Img;
  late double Score;

  SameCategoryBookModel(
      {required this.Id,
      required this.Name,
      required this.Img,
      required this.Score});

  factory SameCategoryBookModel.fromJson(dynamic data) {
    return SameCategoryBookModel(
      Id: data['Id'],
      Name: data['Name'],
      Img: data['Img'],
      Score: data['Score'],
    );
  }
}

class SameCategoryBookListModel {
  late List<SameCategoryBookModel> list;

  SameCategoryBookListModel(this.list);

  factory SameCategoryBookListModel.fromJson(List<dynamic> list) {
    return SameCategoryBookListModel(list
        .map((item) =>
            SameCategoryBookModel.fromJson(item))
        .toList());
  }
}

class BookVoteModel {
  late int BookId;
  late int TotalScore;
  late int VoterCount;
  late double Score;

  BookVoteModel(
      {required this.BookId,
      required this.TotalScore,
      required this.VoterCount,
      required this.Score});

  factory BookVoteModel.fromJson(dynamic data) {
    return BookVoteModel(
      BookId: data['BookId'],
      TotalScore: data['TotalScore'],
      VoterCount: data['VoterCount'],
      Score: data['Score'],
    );
  }
}
