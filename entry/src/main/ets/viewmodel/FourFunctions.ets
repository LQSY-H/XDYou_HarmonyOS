import FourFunctionData from './FourFunctionsData';

export class FourFunctions {
  getFourFunctions(): Array<FourFunctionData> {
    let fourFunctions: FourFunctionData[] = [
      new FourFunctionData(0, $r('app.media.electricitybillinquiry'), '余额 2374.45 度', '目前无需清缴欠费'),
      new FourFunctionData(1, $r('app.media.networkusage'), '已用 40.923 GB', '下次结算 2025-11-01'),
      new FourFunctionData(2, $r('app.media.bookborrowing'), '借书 0 本', '目前没有待归还书籍'),
      new FourFunctionData(3, $r('app.media.campuscard'), '卡里 121 元', '查询一卡通流水')
    ];
    return fourFunctions;
  }
}
export default new FourFunctions();

// 电费查询 electricitybillinquiry
//   网络用量 networkusage
//   图书借阅 bookborrowing
//   校园卡 campuscard