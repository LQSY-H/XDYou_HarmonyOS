import SettingsItem from '../viewmodel/SettingsItem';
import SettingsItemData from '../viewmodel/SettingsItemData';

/**
 * Setting tab content
 */
@Entry
@Preview
@Component
export default struct Setting {

  @Builder
  settingCell(item: SettingsItemData) {
    Row() {
      Row({}) {
        Image(item.img)
          .fillColor(item.imgcolor)
          .height('22vp')
          .margin({
            left: '8vp',
            right: '12vp'
          })
        Text(item.title)
          .fontSize(16)
      }
      if (item.subtitle == "switch") {
        Toggle({ type: ToggleType.Switch, isOn: false })
      } else {
        Row() {
          Text(item.subtitle)
            .fontSize(14)
            .fontColor('#222222')
            .margin({right: 4})
          Image($r('app.media.rightbutton'))
            .fillColor('#3f5f90')
            .width('12vp')
            .height('24vp')
            .margin({right: 8})
        }
        .justifyContent(FlexAlign.End)
      }
    }
    .justifyContent(FlexAlign.SpaceBetween)
    .width('100%')
    .padding({
      left: '8vp',
      right: '8vp'
    })
  }

  build() {
    Column({ space: 12 }) {
      Row() {
        Column() {
          Text($r('app.string.app_name'))
            .fontSize(20)
          Text($r('app.string.account_student_id'))
            .fontSize(12)
            .margin({ top: '4vp' })
        }
        .alignItems(HorizontalAlign.Start)
        .margin({ left: '16vp' })
      }
      .alignItems(VerticalAlign.Center)
      .width('100%')

        Scroll(){
          Column(){
            List({ space: 12 }) {
              ForEach(SettingsItem.getSettingsItems(), (item: SettingsItemData[]) => {
                ListItemGroup() {
                  ForEach(item, (cell: SettingsItemData) => {
                    ListItem() {
                      this.settingCell(cell);
                    }
                    .height('48vp')
                  }, (cell: SettingsItemData) => JSON.stringify(cell))
                }
                .width('90%')
                .margin({ left: '5%', right: '5%' }) // 左右各留5%，实现水平居中
                .divider({
                  strokeWidth: '1vp',
                  color: '#0d000000',
                  startMargin: '42vp',
                  endMargin: '24vp'
                })
                .backgroundColor('#f7f7ff')
                .borderRadius(16)
              }, (item: SettingsItemData) => JSON.stringify(item))
            }
            .width('100%')

          Column() { Text("").height(200) }

          }
        }
        .padding({ top: 6, bottom:6 })
        .edgeEffect(EdgeEffect.Spring, {alwaysEnabled: true})
      }
      .width('100%')// 确保Column占满屏幕宽度
  }
}