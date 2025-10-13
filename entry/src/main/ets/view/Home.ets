import ItemData from '../viewmodel/ItemData';
import smallFunctions from '../viewmodel/SmallFunctions';
import FourFunctionData from '../viewmodel/FourFunctionsData';
import fourfunctions from '../viewmodel/FourFunctions';
// import { ExceptionPrompt } from '@ohos.arkui.advanced.ExceptionPrompt'

@Builder
export function HomeBuilder(name: string, param: object){
  Home()
}


@Component
export default struct Home{

  pathStack: NavPathStack = new NavPathStack()

  build() {
    NavDestination() {
      Column() { //整个页面
        Column() { //顶部
          Column() {
            Text('下午好 今天如何')
              .fontSize(22)
              .fontColor('#3f5f90')
              .fontWeight(FontWeight.Medium)
            Text('当前为第 6 周')
              .fontColor('#3f5f90')
              .fontSize(14)
          }
          .alignItems(HorizontalAlign.Start)
          .padding({
            left: 24,
            bottom: 12
          })
          .position({ x: 0, y: '100%' }) // y: '100%' 表示底部
          .translate({ y: '-100%' }) // 上移自身高度，避免超出屏幕
        }
        .height('25%')
        .backgroundColor('#f7f7ff')
        .width('100%')

        Scroll() {
          Column() { //组件
            Column() { //message

            }

            Column() { //class
            }

            List() {
              ForEach(fourfunctions.getFourFunctions(), (item: FourFunctionData) => {
                ListItem() {
                  Row() {
                    Image(item.img)
                      .width(28)
                      .height(28)
                      .margin({ left: 16, right: 16 })
                      .fillColor('#3f5f90')

                    Column() {
                      Text(item.title)
                        .fontSize(16)
                        .margin({ bottom: 2 })

                      Text(item.subtitle)
                        .fontSize(12)
                    }
                    .alignItems(HorizontalAlign.Start)
                  }
                  .margin({ top: 16, bottom: 16 })
                }
                .width('100%')
                .backgroundColor('#f7f7ff')
                .borderRadius(8)
                .align(Alignment.Start)
                .margin({ top: 4, bottom: 4 })

              }, (item: FourFunctionData) => item.id.toString())
            }
            .width('90%')
            .height('auto')

            Column() {
              Text("占位内容").height(100)
            }

            Column() {
              Grid() {
                ForEach(smallFunctions.getSmallFunctions(), (item: ItemData) => {
                  GridItem() {
                    Column() {
                      Image(item.img)
                        .height(28)
                        .fillColor('#3f5f90')
                      Text(item.title)
                        .fontSize(12)
                        .margin({ top: '6vp' })
                    }
                    .width('100%')
                    .margin({ top: 16, bottom: 16 })
                  }
                  .height('auto')
                  .backgroundColor('#f7f7ff')
                  .borderRadius(8)
                }, (item: ItemData) => JSON.stringify(item))
              }
              .height('172vp')
              .columnsTemplate('1fr 1fr 1fr 1fr')
              .rowsTemplate('1fr 1fr')
              .columnsGap(8)
              .rowsGap(8)
              .padding({
                top: '12vp',
                // bottom: '12vp'
              })

            }
            .width('90%')

            Column() {
              Text("占位内容")
            }.height(400)

          }
        }
        .padding({ top: 6, bottom: 6 })
        .edgeEffect(EdgeEffect.Spring, { alwaysEnabled: true })
      }

      .width('100%')
      .height('100%')
      .backgroundColor('#fefefe')
    }
    .hideTitleBar(true)
    .hideBackButton(true)
    .hideToolBar(true)
    .onReady((context: NavDestinationContext)=> {
      this.pathStack = context.pathStack
    })
  }
}