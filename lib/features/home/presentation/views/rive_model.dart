class RiveModel {
  final String src, artboard, stateMachineName;

  RiveModel({
    required this.src,
    required this.artboard,
    required this.stateMachineName,
  });
}
List<RiveModel> bottomNavItems = [
  RiveModel(
    src: "assets/animated-icons.riv/home.riv",
    artboard: "HOME",
    stateMachineName: "HOME_Interactivity",
  ),
  RiveModel(
    src: "assets/animated-icons.riv/community.riv",
    artboard: "COMMUNITY",
    stateMachineName: "COMMUNITY_Interactivity",
   
  ),RiveModel(
    src: "assets/animated-icons.riv/search.riv",
    artboard: "SEARCH",
    stateMachineName: "SEARCH_Interactivity",
  ),
  RiveModel(
    src: "assets/animated-icons.riv/tag_icon.riv",
    artboard: "Saved",
    stateMachineName: "SAVED_Interactivity",
  ),
  
];
