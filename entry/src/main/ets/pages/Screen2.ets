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

import {MaterialCard } from '@ohos/material-card'
import router from '@system.router';

@Entry
@Component
struct Screen2 {
  @State Card_Array: any = router.getParams().text

  build(){
    Column({space:30}) {
      Row({ space: '25vp' }) {
        Button('<').fontColor(Color.Black).backgroundColor(0XE0E1E4).fontWeight(FontWeight.Bolder)
        Text("Customer Support").fontSize('20fp').fontWeight(FontWeight.Bolder)
        Button('⋮').fontColor(Color.Black).backgroundColor(0XE0E1E4).fontWeight(FontWeight.Bolder)
      }
      .width('100%')
      Row(){
        Button('Create Complaint')
          .width('70%')
          .backgroundColor(0x00B5E2)
          .onClick(()=>{
            router.push({uri:"pages/Screen1"})
          })
      }
    }
    .margin('20vp')
  }
}