class InformationModel {
  String title;
  String imageUrl;
  String subTitle;

  InformationModel({
    this.title,
    this.imageUrl,
    this.subTitle
  });

  InformationModel.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    imageUrl = json['imageUrl'];
    subTitle = json['subTitle'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['title'] = this.title;
    data['imageUrl'] = this.imageUrl;
    data['subTitle'] = this.subTitle;
    return data;
  }
}