import BottomTab from './IndexTab';

export class NavBottomTab {
  getNavBottomTab(): Array<BottomTab> {
    let navBottomTab: BottomTab[] = [
      new BottomTab(0, $r('app.string.homepage'), $r('app.media.homepage'), $r('app.media.activeHomepage')),
      new BottomTab(1, $r('app.string.recommend'), $r('app.media.recommend'), $r('app.media.activeRecommend')),
      new BottomTab(2, $r('app.string.planet'), $r('app.media.planet'), $r('app.media.activePlanet')),
      new BottomTab(3, $r('app.string.mine'), $r('app.media.mine'), $r('app.media.activeMine')),

    ]
    return navBottomTab;
  }
}
export default new NavBottomTab();