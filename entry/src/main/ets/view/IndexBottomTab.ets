import CardModel from '../viewmodel/CardModel'
import IndexTab from '../viewmodel/IndexTab'
import Home from './Home'
import Settings from './Settings'


@Builder
export function IndexBottomTabBuilder(name: string, param: object){
  IndexBottomTab()
}
@Entry
@Preview
@Component
struct IndexBottomTab {
  @State currentPage: number = 0;
  @State triggerValue: number = 0;

  @Builder TabBuilder(item: CardModel, index: number | undefined) {
    Column() {
      Image(this.currentPage === index ? item.selectedIcon : item.icon)
        .width(24)
        .height(24)
        .objectFit(ImageFit.Contain)

      Text(item.title)
        .fontColor(this.currentPage === index ? '#3f5f90' : '#000000')
        .fontSize(14)
        .margin({ top: 6 })
        .opacity(this.currentPage === index ? 1 : 0.6)
    }
    .justifyContent(FlexAlign.Center)
    .width('100%')
    .height('100%')
  }

  build() {
    Tabs({ barPosition: BarPosition.End, index: this.currentPage }) {
      ForEach(IndexTab.getIndexTab(), (item: CardModel, index: number | undefined) => {
        TabContent() {
          if (index == 0) {
            Home()
          }else if (index == 1) {
          }else if (index == 2) {
          }else if (index == 3) {
            Settings()
          }
        }
        .tabBar(this.TabBuilder(item, index))
      }, (item: CardModel) => JSON.stringify(item))
    }
    .width('100%')
    .height('100%')
    .barMode(BarMode.Fixed)
    .onChange((index: number) => {
      this.currentPage = index;
    })
  }
}