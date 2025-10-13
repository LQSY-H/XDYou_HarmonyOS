import SettingsItemData from './SettingsItemData';

export class SettingsItems {
  getSettingsItems(): Array<Array<SettingsItemData>> {
    let SettingsItems: SettingsItemData[][] = [
      [
        new SettingsItemData(0, $r('app.media.password'), '#000000', '体育系统密码设置', ''),
        new SettingsItemData(1, $r('app.media.password'), '#000000', '物理实验密码设置', ''),
        new SettingsItemData(2, $r('app.media.account'), '#000000', '电费账号设置', '默认自动获取'),
        new SettingsItemData(3, $r('app.media.password'), '#000000', '电费密码设置', '默认123456'),
        new SettingsItemData(4, $r('app.media.password'), '#000000', '校园网密码设置', ''),
      ],
      [
        new SettingsItemData(5, $r('app.media.theme'), '#000000', '主题颜色', '默认颜色'),
        new SettingsItemData(6, $r('app.media.darkmode'), '#000000', '深色模式', '跟随系统'),
        new SettingsItemData(7, $r('app.media.language'), '#000000', '语言Language', '跟随系统'),
      ],
      [
        new SettingsItemData(8, $r('app.media.picture'), '#000000', '开启课表背景图', 'switch'),
        new SettingsItemData(9, $r('app.media.picture2'), '#000000', '课表背景图选择', ''),
      ],
      [
        new SettingsItemData(10, $r('app.media.refresh'), '#009B77', '手动强制刷新课表', ''),
        new SettingsItemData(11, $r('app.media.clean'), '#F0C05A', '清除缓存并重启应用', ''),
        new SettingsItemData(12, $r('app.media.poweroff'), '#BF1932', '退出登录并重启应用', ''),
      ],
      [
        new SettingsItemData(13, $r('app.media.document'), '#0f4c81', '关于程序', ''),
        new SettingsItemData(14, $r('app.media.update'), '#88b04b', '检查更新', ''),
      ],
    ];
    return SettingsItems;
  }
}
export default new SettingsItems();