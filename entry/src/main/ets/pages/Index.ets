import Login from '../view/Login'
import Home from '../view/Home'
import Settings from '../view/Settings'
import preferencesUtil from '../common/database/PreferencesUtil'

@Entry
@ComponentV2
export default struct Homepage{
  @Local isLoggedIn: boolean = false  // 初始未登录状态
  pathStack: NavPathStack = new NavPathStack()
  @StorageLink('inputAccount')inputAccount:string = '';
  @StorageLink('inputPassword')inputPassword:string = '';

  // aboutToAppear(): void {
  //   this.inputAccount = preferencesUtil.getChangeInputAccount()
  //   this.inputPassword = preferencesUtil.getChangeInputPassword()
  //   if(this.inputAccount && this.inputPassword != ''){
  //     this.isLoggedIn = true
  //   }
  // }

  build() {
    Navigation(this.pathStack) {
      if (this.isLoggedIn = false){
      Login()
      }else{
        Home()
      }
    }
    }

          .hideTitleBar(true)
          .hideBackButton(true)
          .hideToolBar(true)
          .hideNavBar(true)
        // .onReady((context: NavDestinationContext) => {
        //   this.pathStack = context.pathStack
        // })


  }