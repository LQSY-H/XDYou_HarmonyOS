import ItemData from './ItemData';

export class SmallFunctions {
  getSmallFunctions(): Array<ItemData> {
    let smallFunctions: ItemData[] = [
      new ItemData(0, '成绩查询', $r('app.media.gradeinquiry')),
      new ItemData(1, '考试安排', $r('app.media.examschedule')),
      new ItemData(2, '空闲教室', $r('app.media.availableclassrooms')),
      new ItemData(3, '物理实验', $r('app.media.physicsexperiment')),
      new ItemData(4, '体育信息', $r('app.media.sportsinformation')),
      new ItemData(5, '其他功能', $r('app.media.otherfunctions'))
    ];
    return smallFunctions;
  }
}
export default new SmallFunctions();

// 电费查询 electricitybillinquiry
//   网络用量 networkusage
//   图书借阅 bookborrowing
//   校园卡 campuscard