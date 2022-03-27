class BookCatalogGroupListModel {
  final List<BookCatalogGroupItemModel> list;

  BookCatalogGroupListModel(this.list);

  factory BookCatalogGroupListModel.fromModel(BookCatalogModel bookModel) {
    List<BookCatalogGroupItemModel> tmpList = [];
    bookModel.list.forEach((CatalogGroupModel element) {
      element.list.forEach((CatalogInfoModel element2) {
        BookCatalogGroupItemModel bookCatalogGroupInfo = BookCatalogGroupItemModel.fromJson(element2, element);
        tmpList.add(bookCatalogGroupInfo);
      });
    });
    return BookCatalogGroupListModel(tmpList);
  }
}

class BookCatalogGroupItemModel {
  // 转成分组列表需要的格式
  final String group;
  final int id;
  final String name;
  final int hasContent;

  BookCatalogGroupItemModel({required this.group, required this.id, required this.name, required this.hasContent});

  factory BookCatalogGroupItemModel.fromJson(CatalogInfoModel model1, CatalogGroupModel model2) {
     return BookCatalogGroupItemModel(group: model2.name, id: model1.id, name: model1.name, hasContent: model1.hasContent);
  }


}

class BookCatalogModel {
  final int id;
  final String name;
  final List<CatalogGroupModel> list;

  BookCatalogModel({required this.id, required this.name, required this.list});

  factory BookCatalogModel.fromJson(dynamic data) {
    return BookCatalogModel(
        id: data['id'],
        name: data['name'],
        list: CatalogGroupListModel.fromJson(data['list']).list);
  }
}

class CatalogGroupModel {
  final String name;
  final List<CatalogInfoModel> list;

  CatalogGroupModel({required this.name, required this.list});

  factory CatalogGroupModel.fromJson(dynamic data) {
    return CatalogGroupModel(
        name: data['name'],
        list: CatalogInfoListModel.fromJson(data['list']).list);
  }
}

class CatalogInfoModel {
  final int id;
  final String name;
  final int hasContent;

  CatalogInfoModel(
      {required this.id, required this.name, required this.hasContent});

  factory CatalogInfoModel.fromJson(dynamic data) {
    return CatalogInfoModel(
        id: data['id'], name: data['name'], hasContent: data['hasContent']);
  }
}

class CatalogGroupListModel {
  final List<CatalogGroupModel> list;

  CatalogGroupListModel(this.list);

  factory CatalogGroupListModel.fromJson(List<dynamic> list) {
    return CatalogGroupListModel(
        list.map((item) => CatalogGroupModel.fromJson(item)).toList());
  }
}

class CatalogInfoListModel {
  final List<CatalogInfoModel> list;

  CatalogInfoListModel(this.list);

  factory CatalogInfoListModel.fromJson(List<dynamic> list) {
    return CatalogInfoListModel(
        list.map((item) => CatalogInfoModel.fromJson(item)).toList());
  }
}
