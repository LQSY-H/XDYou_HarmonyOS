import SettingsItem from '../viewmodel/SettingsItem';
import SettingsItemData from '../viewmodel/SettingsItemData';
import { promptAction, PromptAction } from '@kit.ArkUI';

@Builder
export function SettingsBuilder(name: string, param: object){
  Settings()
}
@Entry
@Preview
@Component
export default struct Settings {
  @State handlePopup: boolean = false;
  promptAction: PromptAction = this.getUIContext().getPromptAction();

  // private menuButtons: MenuButton[] = [
  //   {
  //     id: '1',
  //     buttonStyle: {
  //       backgroundColor: $r('app.color.blue_light'),
  //       textColor: $r('app.color.blue'),
  //       radius: 12
  //     },
  //     action: () => {
  //       this.settingsButton()
  //     }
  //   },
  // ]

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

  @State selectedItem: string = ''
  // private MenuItemClick() {
  //   this.selectedItem = item.id;
  //
  //   // 根据不同项执行不同操作
  //   switch(item.id) {
  //     case '1':
  //       // this.handleItem1Action();
  //       break;
  //     case '2':
  //       // this.handleItem2Action();
  //       break;
  //     // 其他项...
  //   }
  // }

  // private handleItem1Action() {
  //       Button(item.id())
  //         .width('100%')
  //         .height('100%')
  //         .onClick(() => {
  //           this.handlePopup = !this.handlePopup;
  //         })
  //         .bindPopup(this.handlePopup, {
  //           message: '请先选择一张图片',
  //           primaryButton: {
  //             value: '去选择',
  //             action: () => {
  //               this.handlePopup = !this.handlePopup;
  //               console.info('confirm Button click');
  //             }
  //           },
  //           secondaryButton: {
  //             value: '算了',
  //             action: () => {
  //               this.handlePopup = !this.handlePopup;
  //             }
  //           },
  //           onStateChange: (e) => {
  //             if (!e.isVisible) {
  //               this.handlePopup = false;
  //             }
  //           }
  //         })
  // }



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
            Button('PopupOptions').margin({ top: 200 })
              .onClick(() => {
                this.handlePopup = !this.handlePopup;
              })
              .bindPopup(this.handlePopup, {
                message: '请先选择一张图片作为背景图',
                primaryButton: {
                  value: '取消',
                  action: () => {
                    this.handlePopup = !this.handlePopup;
                    console.info('cancel');
                  }
                },
                secondaryButton: {
                  value: '去选择背景图',
                  action: () => {
                    this.handlePopup = !this.handlePopup;
                  }
                },
                onStateChange: (e) => {
                  if (!e.isVisible) {
                    this.handlePopup = false;
                  }
                }
              })

            List({ space: 12 }) {
              ForEach(SettingsItem.getSettingsItems(), (item: SettingsItemData[]) => {
                ListItemGroup() {
                  ForEach(item, (cell: SettingsItemData) => {
                    ListItem() {
                        this.settingCell(cell);
                    }
                    .height('48vp')
                    // .onClick(() => this.MenuItemClick(item))
                  }, (cell: SettingsItemData) => JSON.stringify(cell.id))
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

