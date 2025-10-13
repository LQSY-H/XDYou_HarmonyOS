
export struct BottomTab {
  @State currentIndex: number = 0;
  private tabsController: TabsController = new TabsController();


  // [Start tab_content_builder]
  @Builder
  tabContentBuilder(tab: NavBottomTab) {
    TabContent() {
      Row() {
        Text(text)
          .height(300)
          .fontSize(30)
      }
      .width('100%')
      .justifyContent(FlexAlign.Center)
    }
    .padding({ left: 12, right: 12 })
    .backgroundColor(Color.White)
    .tabBar(this.TabBuilder(title, index, icon, selectedIcon))
  }

  // [End tab_content_builder]

  build() {
    NavDestination() {
      Tabs() {
        // 使用ForEach循环生成TabContent
        ForEach(NavBottomTab.getNavBottomTab(), (id: BottomTab[], title: ) =>
        {
          TabContent() {
            item.content // 渲染对应的页面组件
          }
          .padding({ left: '12vp', right: '12vp' })
          .backgroundColor('#F1F3F5')
          .tabBar(this.TabBuilder(item.title, item.index, item.icon))
        }
          ,
          (item) => item.index.toString()
        ) // 使用index作为唯一标识
      }
      .margin({ bottom: '64vp' })
      .width('100%')
      .height('100%')
      .barHeight('80vp')
      .barMode(BarMode.Fixed)
      .onChange((index: number) => {
        this.currentIndex = index;
      })
    }
    .height('100%')
    .hideTitleBar(true)
    .backgroundColor('#F1F3F5')
  }