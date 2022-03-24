class HostConfig {
  // 接口请求的域名有多个
  // 书籍列表等
  static const String scxs_api_host = 'https://scxs.pysmei.com';
  // 添加删除推荐模块
  static const String userxs_api_host = 'https://userxs.pigqq.com';
  //  登录模块
  static const String user_api_ost = 'https://user.pigqq.com';
  //  书籍详情
  static const String infosxs_api_host = 'https://infosxs.pysmei.com';
  // 搜索域名
  static const String souxs_api_host = 'https://souxs.leeyegy.com';
  // 图片服务域名
  static const String imageHost = 'https://imgapixs.pysmei.com';
  static const String imagePath = 'https://imgapixs.pysmei.com/BookFiles/BookImages/';

  static String getImagePath(String imgName) {
    return '$imagePath$imgName';
  }

}