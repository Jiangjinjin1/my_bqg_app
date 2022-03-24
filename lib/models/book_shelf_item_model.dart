
class BookShelfList {
  final List<BookShelfItemModel> list;

  BookShelfList(this.list);

  factory BookShelfList.fromJson(List<dynamic> list) {
    return BookShelfList(list.map((item) => BookShelfItemModel.fromJson(item)).toList());
  }
}

class BookShelfItemModel {
  final int ChapterId;
  final String ChapterName;
  final int NewChapterCount;
  final int? PostTime;
  final String? Playsources;
  final List<dynamic> CloudList;
  final int Id;
  final String Name;
  final String? Area;
  final String AreaCodde;
  final String Author;
  final String Img;
  final String HostKey;
  final String? Desc;
  final String? BookStatus;
  final int LastChapterId;
  final String LastChapter;
  final String? CName;
  final int? HitCount;
  final int? CollectCount;
  final int? CommendCount;
  final int? UpdateTimeForChapterContent;
  final String UpdateTime;
  final int? FirstChapterId;
  final int? Score;

  BookShelfItemModel(
      {required this.ChapterId,
      required this.ChapterName,
      required this.NewChapterCount,
      required this.PostTime,
      required this.Playsources,
      required this.CloudList,
      required this.Id,
      required this.Name,
      required this.Area,
      required this.AreaCodde,
      required this.Author,
      required this.Img,
      required this.HostKey,
      required this.Desc,
      required this.BookStatus,
      required this.LastChapterId,
      required this.LastChapter,
      required this.CName,
      required this.HitCount,
      required this.CollectCount,
      required this.CommendCount,
      required this.UpdateTimeForChapterContent,
      required this.UpdateTime,
      required this.FirstChapterId,
      required this.Score});

  factory BookShelfItemModel.fromJson(dynamic data) {
    return BookShelfItemModel(
      ChapterId: data['ChapterId'],
      ChapterName: data['ChapterName'],
      NewChapterCount: data['NewChapterCount'],
      PostTime: data['PostTime'],
      Playsources: data['Playsources'],
      CloudList: data['CloudList'],
      Id: data['Id'],
      Name: data['Name'],
      Area: data['Area'],
      AreaCodde: data['AreaCodde'],
      Author: data['Author'],
      Img: data['Img'],
      HostKey: data['HostKey'],
      Desc: data['Desc'],
      BookStatus: data['BookStatus'],
      LastChapterId: data['LastChapterId'],
      LastChapter: data['LastChapter'],
      CName: data['CName'],
      HitCount: data['HitCount'],
      CollectCount: data['CollectCount'],
      CommendCount: data['CommendCount'],
      UpdateTimeForChapterContent: data['UpdateTimeForChapterContent'],
      UpdateTime: data['UpdateTime'],
      FirstChapterId: data['FirstChapterId'],
      Score: data['Score'],
    );
  }
}
