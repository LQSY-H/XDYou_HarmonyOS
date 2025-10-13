import Tab from './CardModel'

export class IndexTab {
  getIndexTab(): Array<Tab> {
    let IndexTab: Tab[] = [
      new Tab(1, '首页', $r('app.media.home'), $r('app.media.activeHome')),
      new Tab(2, '社团推荐', $r('app.media.recommend'), $r('app.media.activeRecommend')),
      new Tab(3, '博客星球', $r('app.media.planet'), $r('app.media.activePlanet')),
      new Tab(4, '我的', $r('app.media.mine'), $r('app.media.activeMine')),
    ];
    return IndexTab;
  }
}
export default new IndexTab();