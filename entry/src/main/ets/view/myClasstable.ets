
import ClassDotItem from '../viewmodel/ClassDotItem'


@Entry
@Preview
@Component


export default struct Classtable{


  @Builder
  SmallDotClass(week: number, weektext: string){
    Column(){
      Text('第 '+ week + ' 周')
        .fontSize(16)


    }
    .backgroundColor('#f7f7ff')
    .borderRadius(16)
    .margin({
      top: 8,
      bottom: 8,
      left: 6,
      right: 6
    })
    .width(48)
    .height(60)
  }


  @Builder
  ClassDot(){
    Column() {
      ForEach(ClassDotItem.getClassDotItem(), (rowDots: boolean[]) => {
        Row() {
          ForEach(rowDots, (isBlue: boolean) => {
              // 圆点形状：用Circle组件，根据isBlue设置颜色
              Circle()
                .width(12)
                .height(12)
                .Color(isBlue = true ? '#4682B4' : '#E0E0E0') // 蓝色和浅灰的色值
          }, (item: boolean) => JSON.stringify(item)) // 为ForEach设置唯一键
        }
      }, (item: boolean[]) => JSON.stringify(item))
    }
  }


  build() {
    Column(){
      Row(){
        Image($r('app.media.back'))
          .height(28)
          .fillColor('#3f5f90')
          .margin({
            left: 16,
          })
        Text($r('app.string.my_classtable'))
          .fontSize(16)
        Image($r('app.media.more'))
          .height(20)
          .fillColor('#3f5f90')
          .margin({
            right:18,
          })
      }
      .width('100%')
      .backgroundColor('#f7f7ff')
      .justifyContent(FlexAlign.SpaceBetween)
      .height('6%')
      Scroll()
        Row(){
        Grid(){

        }
        }



    }
    // .backgroundColor('#f7f7ff')
    .height('100%')
    .width('100%')
  }




}