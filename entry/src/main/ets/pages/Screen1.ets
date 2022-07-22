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

import { MaterialSelect, MenuOption } from '@ohos/material-select'
import { button, CardModel, CardType } from '@ohos/material-card'
import router from '@system.router';

@Entry
@Component
struct Screen1 {
  @State ComplaintType: string= ''
  @State InputText: string= ''
  @State CardArray: CardModel [] = []
  @State CardArrayTransfer: object= { name: this.CardArray }
  private PlaceHolderText: string = "Enter Full Description"
  selectModel: MaterialSelect.Model = new MaterialSelect.Model('Industry', 'Select')
  selectMenuModel: MaterialSelect.MenuModel = new MaterialSelect.MenuModel()
  private current = new Date();
  private subHead: CardModel = new CardModel(this.ComplaintType, 'Created on ' + this.current.toString())

  private onButtonClick(button: button.Model) {
    router.push({ uri: "pages/Screen3"
    })
  }

  private SubHead(model: CardModel) {
    model.setShowDivider(true)
    model.setCardType(CardType.Outlined)
    model.setCardBorderWidth("3vp")
    model.setLeadingIcon($r('app.media.icon'))
    model.setSupportingText("Description\n" + this.InputText)
    model.setCardHeight("250vp")
    model.setCardWidth("320vp")
    model.setCardBackGroundColor('#ffece5e5')
    model.setLeadingIconHeight("64vp")
    model.setLeadingIconWidth("64vp")
    model.setActions([new button.Model('Chat with Us', false, Color.White, 0x00B5E2, 15, ButtonType.Capsule, 30, 130),
    new button.Model('Resolved', false, Color.White, 0x00B5E2, 15, ButtonType.Capsule, 30, 110)])
    model.setButtonClick(this.onButtonClick)
    model.setActionClick(this.onButtonClick)
  }

  aboutToAppear(): void {
    this.SubHead(this.subHead)
    this.subHead.setSupportingTextFontSize(15)
    this.selectModel.setTitle(null)
    this.selectModel.setTitleFontSize(null)
    this.selectModel.setTitleFontColor(null)
    this.selectModel.setHeight(null)
    this.selectModel.setWidth(null)
    this.selectModel.setBackgroundColor(null)
    this.selectModel.setBorderWidth(null)
    this.selectModel.setBorderRadius(null)
    this.selectModel.setBorderColor(null)
    this.selectModel.setUnselectedColor(null)
    this.selectModel.setPadding(null)
    this.selectModel.setFontSize(null)
    this.selectModel.setMargin(null)
    this.selectModel.setPlaceholder('Select')
    this.selectModel.setFontSize('20vp')
    this.selectModel.setFontColor(Color.Black)
    this.selectMenuModel.setHeight(null)
    this.selectMenuModel.setWidth(null)
    this.selectMenuModel.setFontSize(null)
    this.selectMenuModel.setFontColor(null)
    this.selectMenuModel.setBorderRadius(null)
    this.selectMenuModel.setPadding(null)
  }

  build() {
    Column() {
      Row({ space: '30vp' }) {
        Button('<').fontColor(Color.Black).backgroundColor(0XE0E1E4).fontWeight(FontWeight.Bolder)
        Text("Create Complaint").fontSize('20fp').fontWeight(FontWeight.Bolder)
        Button('⋮').fontColor(Color.Black).backgroundColor(0XE0E1E4).fontWeight(FontWeight.Bolder)
      }
      .width('100%')

      Column() {
        Text('Complaint Type').fontSize('15fp').margin({ top: '40vp' }).fontWeight(FontWeight.Bold)
        MaterialSelect({
          menu: [
            new MenuOption('Category_1', 1),
            new MenuOption('Category_2', 2),
            new MenuOption('Category_3', 3),
            new MenuOption('Others', 4)
          ],
          onSelect: (it: MenuOption) => {
            this.ComplaintType = it.getValue()
          },
          model: this.selectModel,
          menuModel: this.selectMenuModel,
        })
      }
      .width('100%')
      .alignItems(HorizontalAlign.Start)

      Column() {
        Text('Description').fontSize('15fp').margin({ top: '40vp', bottom: '10vp' }).fontWeight(FontWeight.Bold)
        TextInput({ placeholder: this.PlaceHolderText, text: this.InputText })
          .width('100%')
          .height('200vp')
          .fontFamily('cursive')
          .onChange((value: string) => {
            this.InputText = value
          })
      }
      .width('100%')
      .alignItems(HorizontalAlign.Start)

      Column()
        .height('30%')
      Column() {
        Button('Submit')
          .width('70%')
          .backgroundColor(0x00B5E2)
          .onClick(() => {
            this.subHead.setSupportingText("Description :\n" + this.InputText + "\n " + "\n " + "\n " + "\n " + "\n ")
            this.CardArray.push(this.subHead)
            this.CardArrayTransfer = { name: this.CardArray }
            router.push({ uri: "pages/Screen2",
              params: { text: this.CardArrayTransfer }
            })
          })
      }
    }
    .margin('20vp')
  }
}
