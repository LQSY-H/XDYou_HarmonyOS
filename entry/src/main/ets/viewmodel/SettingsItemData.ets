export default class SettingsItemData {
  id: number;
  img: Resource;
  imgcolor: string;
  title: ResourceStr;
  subtitle: ResourceStr;

  constructor(id: number, img: Resource, imgcolor: string, title: ResourceStr, subtitle: ResourceStr) {
    this.id = id;
    this.img = img;
    this.imgcolor = imgcolor;
    this.title = title;
    this.subtitle = subtitle;
  }
}
