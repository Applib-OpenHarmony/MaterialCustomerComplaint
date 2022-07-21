/*
 * Copyright (C) 2022 Application Library Engineering Group
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import router from '@system.router';

@Entry
@Component
struct Screen3 {
  private PlaceHolder_Text: string = "Enter Full Description"
  @State Input_Text: string = ''

  build() {
    Column() {
      Row({ space: '65vp' }) {
        Button('<').fontColor(Color.Black).backgroundColor(0XE0E1E4).fontWeight(FontWeight.Bolder)
        Text("Feedback").fontSize('20fp').fontWeight(FontWeight.Bolder)
        Button('⋮').fontColor(Color.Black).backgroundColor(0XE0E1E4).fontWeight(FontWeight.Bolder)
      }
      .width('100%')
      Column() {
        Text('Enter Feedback').fontSize('15fp').margin({ top: '40vp', bottom: '10vp' }).fontWeight(FontWeight.Bold)
        TextInput({ placeholder: this.PlaceHolder_Text, text: this.Input_Text })
          .width('100%')
          .height('200vp')
          .fontFamily('cursive')
          .onChange((value: string) => {
            this.Input_Text = value
          })
      }
      .width('100%')
      .alignItems(HorizontalAlign.Start)
      Row() {
        Button('Submit')
          .width('70%')
          .backgroundColor(0x00B5E2)
          .onClick(() => {
            router.push({ uri: "pages/Screen2"
            })
          })
      }
      .height('50%')
      .alignItems(VerticalAlign.Bottom)
    }
    .margin('20vp')
  }
}