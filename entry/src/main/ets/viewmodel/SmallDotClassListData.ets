export default class SmallDotClassListData {
  week: number;
  weektext: Resource;
  empty: boolean;

  constructor(week: number, weektext: Resource, empty: boolean) {
    this.week = week;
    this.weektext = weektext;
    this.empty = empty;
  }
}
