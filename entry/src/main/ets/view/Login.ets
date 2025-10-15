import { promptAction, router } from '@kit.ArkUI';
import ConnectionUtils from '../common/network/ConnectionUtils';


@Extend(TextInput)
function inputStyle() {
  .placeholderColor('#99182431')
  .height('45vp')
  .fontSize('18fp')
  .backgroundColor('#F1F3F5')
  .width('328vp')
  .margin({ top: 12 })
}

@Extend(Line)
function lineStyle() {
  .width('328vp')
  .height('1vp')
  .backgroundColor('#33182431')
}

@Extend(Text)
function blueTextStyle() {
  .fontColor('#007DFF')
  .fontSize('14fp')
  .fontWeight(FontWeight.Medium)
}

/**
 * Login page
 */


@Builder
export function LoginBuilder(name: string, param: object){
  Login()
}
@Entry
@Preview
@Component
export default struct Login {
  @State account: string = '';
  @State password: string = '';
  @State isShowProgress: boolean = false;
  private timeOutId: number = -1;
  pathStack: NavPathStack = new NavPathStack();


  login(result: boolean): void {
    if (this.account === '' || this.password === '') {
      this.getUIContext().getPromptAction().showToast({
        message: $r('app.string.input_empty_tips')
      });
    } else {
      this.isShowProgress = true;
      if (this.timeOutId === -1) {
        this.timeOutId = setTimeout(async () => {
          this.isShowProgress = false;
          this.timeOutId = -1;

          result = true
          if (result) {


          } else {
            this.getUIContext().getPromptAction().showToast({
              message: $r('app.string.Network_Lost')
            });
          }
        }, 2000);
      }
    }
  }

  aboutToDisappear() {
    clearTimeout(this.timeOutId);
    this.timeOutId = -1;
  }

  build() {
    Navigation(this.pathStack) {
      Column() {
        Image($r('app.media.logo'))
          .width('78vp')
          .height('78vp')
          .margin({ top: '150vp', bottom: '8vp' })
          .borderRadius(16)
        Text($r('app.string.app_name'))
          .fontSize('24fp')
          .fontWeight(FontWeight.Medium)
          .fontColor('#182431')
        Text($r('app.string.login_with_ehall'))
          .fontSize('16fp')
          .fontColor('#99182431')
          .margin({
            bottom: '30vp',
            top: '8vp'
          })

        TextInput({ placeholder: $r('app.string.account_student_id') })
          .maxLength(11)
          .type(InputType.Number)
          .inputStyle()
          .onChange((value: string) => {
            this.account = value;
          })
        Line()
          .lineStyle()

        TextInput({ placeholder: $r('app.string.password_ehall') })
          .type(InputType.Password)
          .inputStyle()
          .onChange((value: string) => {
            this.password = value;
          })
        Line()
          .lineStyle()

        Row() {
          Text($r('app.string.guest_mode'))
            .blueTextStyle()
          Text($r('app.string.forgot_password'))
            .blueTextStyle()
        }
        .justifyContent(FlexAlign.SpaceBetween)
        .width('328vp')
        .margin({ top: '14vp' })

        Button($r('app.string.login'), { type: ButtonType.Capsule })
          .width('328vp')
          .height('40vp')
          .fontSize('16fp')
          .fontWeight(FontWeight.Medium)
          .backgroundColor($r('app.color.login_button_color'))
          .margin({
            top: '48vp',
            bottom: '12vp'
          })
          .onClick(async () => {
            await ConnectionUtils.isNetworkConnected().then((value) => {
              this.login(value);
              this.pathStack.pushPathByName('IndexBottomTab', null)
            })
          })

        if (this.isShowProgress) {
          LoadingProgress()
            .color('#182431')
            .width('30vp')
            .height('30vp')
            .margin({ top: '20vp' })
        }

        Blank()

      }
      .height('100%')
      .width('100%')
      .padding({
        left: '12vp',
        right: '12vp',
        bottom: '24vp'
      })
    }
    .backgroundColor('#F1F3F5')
    .width('100%')
    .height('100%')
    .hideTitleBar(true)
    .hideToolBar(true)
  }
}