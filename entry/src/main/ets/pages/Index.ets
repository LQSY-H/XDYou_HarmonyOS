import Login from '../view/Login'
import Loginbuilder from '../view/Login'
import Home from '../view/Home'
import Settings from '../view/Settings'
import preferencesUtil from '../common/database/PreferencesUtil'

@Entry
@Preview
@Component
export default struct Homepage{
  @State isLoggedIn: boolean = false  // 初始未登录状态
  pathStack: NavPathStack = new NavPathStack()
  @StorageLink('inputAccount')inputAccount:string = '';
  @StorageLink('inputPassword')inputPassword:string = '';


  aboutToAppear(): void {
    this.inputAccount = preferencesUtil.getChangeInputAccount()
    this.inputPassword = preferencesUtil.getChangeInputPassword()
    const savedLoginState = preferencesUtil.getLoginState() // 假设有获取登录状态的方法
    this.isLoggedIn = savedLoginState || (this.inputAccount !== '' && this.inputPassword !== '')
      if(this.inputAccount !== '' && this.inputPassword !== ''){
      //登录页需要返回登录成功
      this.isLoggedIn = true
    }
  }

  build() {
    Navigation(this.pathStack) {
      if (this.isLoggedIn) {
        Home()
      } else {
        Login()
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
}