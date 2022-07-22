/*
 * Copyright (c) 2022 Application Library Engineering Group.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import { Properties, MenuProperties } from './properties'
import { MultipleMenuOption } from './menuOptions'

@Component
struct MultipleSelect {
	@State menu: MultipleMenuOption[] = []
	private selected: MultipleMenuOption[] = []
	onSelect: (itemList: MultipleMenuOption[]) => void
	@State model: MultipleSelect.Model = new MultipleSelect.Model('')
	@State menuModel: MultipleSelect.MenuModel = new MultipleSelect.MenuModel()

	private updateMenu() {
		let list = []
		let choices = []
		for (let i = 0; i < this.menu.length; i++) {
			let m = this.menu[i]
			list.push(m)
			if (m.getChecked()) {
				choices.push(m)
			}
		}
		this.menu = list
		this.selected = choices
		if (this.onSelect != null && this.onSelect != undefined) this.onSelect(this.selected)
	}

	aboutToAppear() {
		if (this.model == null || this.model == undefined) {
			this.model = new MultipleSelect.Model('')
		}
		if (this.menuModel == null || this.menuModel == undefined) {
			this.menuModel = new MultipleSelect.MenuModel()
		}
		if (this.menu == null || this.menu == undefined) {
			this.menu = []
		}

		let choices = []
		for (let i = 0; i < this.menu.length; i++) {
			let m = this.menu[i]
			if (m.getChecked()) {
				choices.push(m)
			}
		}
		this.selected = choices
	}

	@Builder
	MenuItem(option: MultipleMenuOption, index: number) {
		Row() {
			Checkbox({ name: option.getValue(), group: 'check' })
				.select(option.getChecked())
				.selectedColor(this.menuModel.getCheckColor())
				.height(this.menuModel.getCheckBoxHeight())
				.width(this.menuModel.getCheckBoxWidth())
				.onChange((val: boolean) => {
					this.menu[index].setChecked(Boolean(val))
					this.updateMenu()
				})
				.margin({ right: '9vp' })
			Text(option.getValue())
				.fontSize(this.menuModel.getFontSize())
				.fontWeight(FontWeight.Bold)
				.fontColor(this.menuModel.getFontColor())
				.flexGrow(1)
				.maxLines(2)
				.textOverflow({ overflow: TextOverflow.Ellipsis })
		}
		.height(this.menuModel.getHeight())
		.width(this.menuModel.getWidth())
		.backgroundColor(this.menu[index].getChecked() ? this.model.getSelectedColor() : this.model.getUnselectedColor())
		.onClick(() => {
			this.menu[index].setChecked(!this.menu[index].getChecked())
			this.updateMenu()
		})
		.padding(this.menuModel.getPadding())
	}

	@Builder
	MenuBuilder() {
		Column() {
			List() {
				ForEach(this.menu, (item, i) => {
					ListItem() {
						this.MenuItem(item, i)
					}
				}, item => item.id)
			}
		}
		.width(this.menuModel.getWidth())
		.backgroundColor(this.model.getUnselectedColor())
		.padding({ top: '7vp', bottom: '7vp' })
		.borderRadius(this.menuModel.getBorderRadius())
	}

	build() {
		Column({ space: '10vp' }) {
			Text(this.model.getTitle())
				.width(this.model.getWidth())
				.fontSize(this.model.getTitleFontSize())
				.fontColor(this.model.getTitleFontColor())
				.fontWeight(FontWeight.Medium)
				.maxLines(2)
				.textOverflow({ overflow: TextOverflow.Ellipsis })
			Flex({ justifyContent: FlexAlign.End, alignItems: ItemAlign.Center }) {
				Image($r('app.media.dropdown'))
					.height('8vp')
					.width('16vp')
					.objectFit(ImageFit.Contain)
			}
			.height(this.model.getHeight())
			.width(this.model.getWidth())
			.borderWidth(this.model.getBorderWidth())
			.borderColor(this.model.getBorderColor())
			.borderRadius(this.model.getBorderRadius())
			.backgroundColor(this.model.getBackgroundColor())
			.bindMenu(this.MenuBuilder())
			.padding(this.model.getPadding())
		}
		.alignItems(HorizontalAlign.Start)
		.margin(this.model.getMargin())
	}
}

namespace MultipleSelect {
	export class Model extends Properties {
		constructor(title: string) {
			super(title)
		}
	}

	export class MenuModel extends MenuProperties {
		private checkColor: string | Color = Color.Blue
		private checkBoxHeight: number | string = '24vp'
		private checkBoxWidth: number | string = '24vp'

		setCheckColor(checkColor: string | Color): MenuModel {
			if (checkColor == null || checkColor == undefined) {
				this.checkColor = Color.Blue
				return this
			}
			this.checkColor = checkColor
			return this
		}

		getCheckColor(): string | Color {
			return this.checkColor
		}

		setCheckBoxHeight(checkBoxHeight: number | string): MenuModel {
			if (checkBoxHeight == null || checkBoxHeight == undefined) {
				this.checkBoxHeight = '24vp'
				return this
			}
			this.checkBoxHeight = checkBoxHeight
			return this
		}

		getCheckBoxHeight(): number | string {
			return this.checkBoxHeight
		}

		setCheckBoxWidth(checkBoxWidth: number | string): MenuModel {
			if (checkBoxWidth == null || checkBoxWidth == undefined) {
				this.checkBoxWidth = '24vp'
				return this
			}
			this.checkBoxHeight = checkBoxWidth
			return this
		}

		getCheckBoxWidth(): number | string {
			return this.checkBoxWidth
		}

		reset(): MenuModel {
			super.reset()
			this.checkColor = Color.Blue
			this.checkBoxHeight = '24vp'
			this.checkBoxWidth = '24vp'
			return this
		}
	}
}

export { MultipleSelect, MultipleMenuOption }