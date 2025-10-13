import Login from '../view/Login'
import Home from '../view/Home'
import Settings from '../view/Settings'

@Entry
@ComponentV2
export default struct Homepage{
  @Local isLoggedIn: boolean = false  // 初始未登录状态
  pathStack: NavPathStack = new NavPathStack()

  build() {
    Navigation(this.pathStack) {
    }
          .onAppear(() => {


          })
          .hideTitleBar(true)
          .hideBackButton(true)
          .hideToolBar(true)
          .hideNavBar(true)
        // .onReady((context: NavDestinationContext) => {
        //   this.pathStack = context.pathStack
        // })


  }