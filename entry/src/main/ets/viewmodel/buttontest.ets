import { DialogHub } from '@hadss/dialoghub';
import { getContext } from '@ohos/ability';
import CommonConstant from '../utils/CommonConstant';

// 假设的 TextToastParams 类型
interface TextToastParams {
  title?: string;
}

// TextToastBuilder 构建器函数
@Builder
export function TextToastBuilder(param: TextToastParams) {
  Stack() {
    Text(param?.title ?? 'PURE_TEXT')
      .fontColor('#000000')
      .fontSize(16)
  }
  .padding({ left: 16, right: 16 })
  .height(16)
}

// // 假设的组件扩展，用于按钮样式
// @Extend(Button)
// function superFancyButton() {
//   return this
//     .width(CommonConstant.FULL_LENGTH)
//     .height($r('app.float.index_action_height'))
//     .margin({ bottom: $r('app.float.index_action_margin') })
//     .fontSize($r('app.float.font_size_medium'))
//     .fontWeight(FontWeight.Medium)
//     .backgroundColor($r('app.color.base_blue'));
// }

@Entry
@Component
struct DialogHubExample {
  // 获取 UI 上下文
  getUIContext() {
    return getContext();
  }

  aboutToAppear(): void {
    // 初始化 DialogHub
    DialogHub.init(this.getUIContext());
    // 开启日志
    DialogHub.openLog('DEBUG');

    // 创建自定义模板
    DialogHub.createCustomTemplate(CommonConstant.CUSTOM_TEMPLATE_SIMPLE)
      .setContent(wrapBuilder(TextToastBuilder))
      .setStyle({ backgroundColor: Color.White })
      .setConfig({ dialogBehavior: { passThroughGesture: true, isModal: false } })
      .register();
  }

  showCustomDialog() {
    // 显示自定义模板的弹框
    DialogHub.show({
      templateName: CommonConstant.CUSTOM_TEMPLATE_SIMPLE,
      data: {
        // 传递数据给弹框
        title: '这是自定义弹框的标题'
      }
    });
  }

  build() {
    Column({ space: 20 }) {
      Button('显示自定义弹框', { stateEffect: true, type: ButtonType.Capsule })
        .superFancyButton()
        .onClick(() => {
          this.showCustomDialog();
        });
    }
       .width('100%')
    .height('100%')
    .padding({ top: 20, bottom: 20, left: 20, right: 20 });
  }
}
