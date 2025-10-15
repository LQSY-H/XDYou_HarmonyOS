@Builder
  private menuButtons: MenuButton[] = [
    {
      id: 'btn1',
      label: '账户管理',
      icon: $r('app.media.ic_account'),
      buttonStyle: {
        backgroundColor: $r('app.color.blue_light'),
        textColor: $r('app.color.blue'),
        radius: 12
      },
      action: () => {
        promptAction.showToast({ message: '进入账户管理页面' })
        // 这里可以添加具体的页面跳转或业务逻辑
      }
    },
    ]