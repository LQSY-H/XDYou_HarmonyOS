import SettingsItem from '../viewmodel/SettingsItem';
import SettingsItemData from '../viewmodel/SettingsItemData';
import { promptAction, PromptAction } from '@kit.ArkUI';
import { DialogHub } from '@hadss/dialoghub';

@Builder
export function SettingsBuilder(name: string, param: object){
  Settings()
}

@Entry
@Preview
@Component
export default struct Settings {
  @State showPwdDialog: boolean = false;
  @State inputPwd: string = '';
  @State isPwdVisible: boolean = false;
  promptAction: PromptAction = this.getUIContext().getPromptAction();

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
            .margin({ right: 4 })
          Image($r('app.media.rightbutton'))
            .fillColor('#3f5f90')
            .width('12vp')
            .height('24vp')
            .margin({ right: 8 })
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

  MenuItemClick(item: SettingsItemData): void {
    this.selectedItem = item.id;
    switch (item.id) {
      case 'pepwd':
        this.pepwd()
        break
      case 'phypwd':
        this.phypwd()
        break
      case 'dianfeiroom':
        this.dianfeiroom()
        break
      case 'dianfeipwd':
        this.dianfeipwd()
        break
      case 'internetpwd':
        this.internetpwd()
        break
      case 'themecolor':
        this.themecolor()
        break
      case 'darkmode':
        this.darkmode()
        break
      case 'language':
        this.language()
        break
      case 'clsbgswitch':
        this.clsbgswitch()
        break
      case 'clsbgselect':
        this.clsbgselect()
        break
      case 'refreshclstab':
        this.refreshclstab()
        break
      case 'clean':
        this.clean()
        break
      case 'logout':
        this.logout()
        break
      case 'aboutus':
        this.aboutus()
        break
      case 'update':
        this.update()
        break
    }
  } //switch完



  private pepwd() {
    this.showPwdDialog = true;
    // 重置密码输入状态
    this.inputPwd = '';
    this.isPwdVisible = false;
  }

  private phypwd() {
    DialogHub.getCustomDialog()



    //具体学习：https://gitee.com/hadss/DialogHub/blob/master/hadss_dialog/README.md
  }

  private dianfeiroom() {

  }

  private dianfeipwd() {

  }

  private internetpwd() {

  }

  private themecolor() {

  }

  private darkmode() {

  }

  private language() {

  }

  private clsbgswitch() {

  }

  private clsbgselect() {

  }

  private refreshclstab() {
    this.promptAction.showDialog({
      title: '确定强制刷新课表？',
      message: '可能耗时较久，等上几秒就好。\n',

      buttons: [
        {
          text: '取消',
          color: '#000000'
        },
        {
          text: '确定',
          color: '#000000'
        }
      ]
    })
  }

  private clean() {
    this.promptAction.showDialog({
      title: '确定清除缓存并重启应用?',
      message: '可解决应用出现的一些问题\n',

      buttons: [
        {
          text: '取消',
          color: '#000000'
        },
        {
          text: '确定',
          color: '#ffffbd00'
        }
      ]
    })
  }

  private logout() {
    this.promptAction.showDialog({
      title: '确定退出登录并重启应用?',
      message: '用于切换账号或者应用出现一些问题时\n',

      buttons: [
        {
          text: '取消',
          color: '#000000'
        },
        {
          text: '确定',
          color: '#ffff0000'
        }
      ]
    })
  }

  private aboutus() {
  }

  private update() {
    this.promptAction.showToast({
      message: '正在获取信息',
      duration: 1000
    })
    this.promptAction.showToast({
      message: '当前已是最新版本',
      duration: 1000
    })
    this.promptAction.showToast({
      message: '有新版本可更新,请前往应用市场',
      duration: 1000
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

      Scroll() {
        Column() {
          List({ space: 12 }) {
            ForEach(SettingsItem.getSettingsItems(), (item: SettingsItemData[]) => {
              ListItemGroup() {
                ForEach(item, (cell: SettingsItemData) => {
                  ListItem() {
                    this.settingCell(cell);
                  }
                  .height('48vp')
                  .onClick(() => this.MenuItemClick(cell))
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

          Text("").height(100)

        }
        .padding({ top: 6, bottom: 6 })
      }
      .width('100%') // 确保Column占满屏幕宽度


    }
  }
}