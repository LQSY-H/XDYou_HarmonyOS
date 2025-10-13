// export default class CardModel {
//   selectedIcon: Resource;
//   defaultIcon: Resource;
//   content: string;
//
//   constructor(selectedIcon: Resource, defaultIcon: Resource, content: string) {
//     this.selectedIcon = selectedIcon;
//     this.defaultIcon = defaultIcon;
//     this.content = content;
//   }
// }

export default  class Tab{
  id: number;
  title: ResourceStr;
  icon: Resource;
  selectedIcon: Resource;

  constructor(id: number, title: ResourceStr, icon: Resource, selectedIcon: Resource) {
    this.id = id;
    this.title = title;
    this.icon = icon;
    this.selectedIcon = selectedIcon;
  }
}
