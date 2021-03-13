class HomeItemModel {
  String title = "";
  String sideInfo = "";
  String description = "";
  List<String> tags = [];
  bool isStarted = false;

  HomeItemModel({this.title, this.sideInfo, this.description, this.tags, this.isStarted});

  factory HomeItemModel.testData() {
    return HomeItemModel(
      title: "Why CI & CD is important when working with a team",
      sideInfo: "1.3K",
      description: "Terry Owen, Grace Abraham, Richard Cameron",
      tags: ["#tech", "#CI/CD", "#webinar"],
      isStarted: true,
    );
  }

  factory HomeItemModel.testData2() {
    return HomeItemModel(
      title: "Live with u/DeepFuckingValue",
      sideInfo: "1:30 PM",
      description: "Doug Terry, Denae Augustine, DeepFuckingValue",
      tags: ["#interview", "#GME"],
      isStarted: false,
    );
  }
}
