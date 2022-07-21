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
import { MenuOption } from './menuOptions'

@Component
struct MaterialSelect {
	menu: MenuOption[]
	onSelect: (item: MenuOption) => void
	@State model: MaterialSelect.Model = new MaterialSelect.Model('', '')
	@State menuModel: MaterialSelect.MenuModel = new MaterialSelect.MenuModel()
	@State selected: number = -1

	aboutToAppear() {
		if (this.model == null || this.model == undefined) {
			this.model = new MaterialSelect.Model('', '')
		}
		if (this.menuModel == null || this.menuModel == undefined) {
			this.menuModel = new MaterialSelect.MenuModel()
		}
		if (this.menu == null || this.menu == undefined) {
			this.menu = []
		}

		if (this.selected == -1) return
		this.model.setPlaceholder(this.menu[this.selected].getValue())
	}

	@Builder
	MenuItem(option: MenuOption, index: number) {
		Row() {
			Text(option.getValue())
				.fontSize(this.menuModel.getFontSize())
				.fontWeight(FontWeight.Bold)
				.fontColor(this.menuModel.getFontColor())
				.maxLines(2)
				.textOverflow({ overflow: TextOverflow.Ellipsis })
		}
		.height(this.menuModel.getHeight())
		.width(this.menuModel.getWidth())
		.alignItems(VerticalAlign.Center)
		.backgroundColor(this.selected == index ? this.model.getSelectedColor() : this.model.getUnselectedColor())
		.onClick(() => {
			this.model.setPlaceholder(option.getValue())
			this.selected = index
			if (this.onSelect != null && this.onSelect != undefined) this.onSelect(option)
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
			Flex({
				direction: FlexDirection.Row,
				justifyContent: FlexAlign.SpaceBetween,
				alignItems: ItemAlign.Center
			}) {
				Text(this.model.getPlaceholder())
					.fontSize(this.model.getFontSize())
					.fontWeight(FontWeight.Bold)
					.fontColor(this.model.getFontColor())
					.maxLines(1)
					.textOverflow({ overflow: TextOverflow.Ellipsis })
				Image($r('app.media.dropdown'))
					.height('8vp')
					.width('16vp')
					.objectFit(ImageFit.Contain)
			}
			.width(this.model.getWidth())
			.height(this.model.getHeight())
			.padding(this.model.getPadding())
			.borderWidth(this.model.getBorderWidth())
			.borderColor(this.model.getBorderColor())
			.borderRadius(this.model.getBorderRadius())
			.backgroundColor(this.model.getBackgroundColor())
			.bindMenu(this.MenuBuilder())
		}
		.alignItems(HorizontalAlign.Start)
		.margin(this.model.getMargin())
	}
}

namespace MaterialSelect {
	export class Model extends Properties {
		private placeholder: string = 'Select'
		private fontSize: number | string = '18vp'
		private fontColor: string | Color = '#333F48'

		constructor(title: string, placeholder?: string) {
			super(title)
			if (placeholder != null && placeholder != undefined) {
				this.placeholder = placeholder
			}
		}

		setPlaceholder(placeholder: string): Model {
			if (placeholder == null || placeholder == undefined) {
				this.placeholder = ''
				return this
			}
			this.placeholder = placeholder
			return this
		}

		getPlaceholder(): string {
			return this.placeholder
		}

		setFontSize(fontSize: number | string): Model {
			if (fontSize == null || fontSize == undefined) {
				this.fontSize = '18vp'
				return this
			}
			this.fontSize = fontSize
			return this
		}

		getFontSize(): number | string {
			return this.fontSize
		}

		setFontColor(fontColor: string | Color): Model {
			if (fontColor == null || fontColor == undefined) {
				this.fontColor = '#333F48'
				return this
			}
			this.fontColor = fontColor
			return this
		}

		getFontColor(): string | Color {
			return this.fontColor
		}

		reset(): Model {
			super.reset()
			this.placeholder = ''
			this.fontSize = '18vp'
			this.fontColor = '#333F48'
			return this
		}
	}

	export class MenuModel extends MenuProperties {
		constructor() {
			super()
		}
	}
}

export { MaterialSelect, MenuOption }