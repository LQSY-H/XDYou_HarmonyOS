export default class FourFunctionsData {
  id: number;
  img: Resource;
  title: ResourceStr;
  subtitle: ResourceStr;

  constructor(id: number, img: Resource, title: ResourceStr, subtitle: ResourceStr) {
    this.id = id;
    this.title = title;
    this.img = img;
    this.subtitle = subtitle;
  }
}
