import SmallDotClassListData  from './SmallDotClassListData';

export class SmallDotClassList {
  getSmallDotClassList(): Array<Array<SmallDotClassListData>> {
    let SmallDotClassList: SmallDotClassListData[][] = [
      [
        new SmallDotClassListData(0, $r('app.string.weeknum'), '#000000', '体育系统密码设置', ''),

      ],

    ];
    return SmallDotClassList;
  }
}
export default new SmallDotClassList();