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

import { MenuProperties } from './properties'
import { DotMenuOption } from './menuOptions'

@Component
struct DotMenu {
	menu: DotMenuOption[] = []
	onSelect: (it: DotMenuOption) => void
	@State model: DotMenu.Model = new DotMenu.Model()
	@State menuModel: DotMenu.MenuModel = new DotMenu.MenuModel()

	aboutToAppear() {
		if (this.model == null || this.model == undefined) {
			this.model = new DotMenu.Model()
		}
		if (this.menuModel == null || this.menuModel == undefined) {
			this.menuModel = new DotMenu.MenuModel()
		}
		if (this.menu == null || this.menu == undefined) {
			this.menu = []
		}
	}

	@Builder
	MenuItem(option: DotMenuOption) {
		Row() {
			Image(option.getIcon())
				.objectFit(ImageFit.Contain)
				.width(this.menuModel.getIconWidth())
				.height(this.menuModel.getIconHeight())
				.margin({ right: '12vp' })
			Text(option.getValue())
				.fontSize(this.menuModel.getFontSize())
				.fontColor(this.menuModel.getFontColor())
				.flexGrow(1)
				.maxLines(2)
				.textOverflow({ overflow: TextOverflow.Ellipsis })
				.fontWeight(FontWeight.Bold)
		}
		.height(this.menuModel.getHeight())
		.width(this.menuModel.getWidth())
		.onClick(() => {
			if (this.onSelect != null && this.onSelect != undefined) this.onSelect(option)
		})
		.padding(this.menuModel.getPadding())
	}

	@Builder
	MenuBuilder() {
		Column() {
			List() {
				ForEach(this.menu, (item) => {
					ListItem() {
						this.MenuItem(item)
					}
				}, item => item.id)
			}
		}
		.width(this.menuModel.getWidth())
		.padding({ top: '7vp', bottom: '7vp' })
		.borderRadius(this.menuModel.getBorderRadius())
	}

	build() {
		Image($r('app.media.dot_menu'))
			.height(this.model.getHeight())
			.width(this.model.getWidth())
			.objectFit(ImageFit.Contain)
			.backgroundColor(this.model.getBackgroundColor())
			.bindMenu(this.MenuBuilder())
			.margin(this.model.getMargin())
	}
}

namespace DotMenu {
	export class Model {
		private height: number | string = '24vp'
		private width: number | string = '24vp'
		private backgroundColor: string | Color = Color.White
		private margin: Margin | Length = '0vp'

		setHeight(height: number | string): Model {
			if (height == null || height == undefined) {
				this.height = '24vp'
				return this
			}
			this.height = height
			return this
		}

		getHeight(): number | string {
			return this.height
		}

		setWidth(width: number | string): Model {
			if (width == null || width == undefined) {
				this.width = '24vp'
				return this
			}
			this.width = width
			return this
		}

		getWidth(): number | string {
			return this.width
		}

		setBackgroundColor(backgroundColor: string | Color): Model {
			if (backgroundColor == null || backgroundColor == undefined) {
				this.backgroundColor = Color.White
				return this
			}
			this.backgroundColor = backgroundColor
			return this
		}

		getBackgroundColor(): string | Color {
			return this.backgroundColor
		}

		setMargin(margin: Margin | Length): Model {
			if (margin == null || margin == undefined) {
				this.margin = '0vp'
				return this
			}
			this.margin = margin
			return this
		}

		getMargin(): Margin | Length {
			return this.margin
		}

		reset(): Model {
			this.height = '24vp'
			this.width = '24vp'
			this.backgroundColor = Color.White
			this.margin = '0vp'
			return this
		}
	}

	export class MenuModel extends MenuProperties {
		private iconHeight: number | string = '18vp'
		private iconWidth: number | string = '18vp'

		setIconHeight(iconHeight: number | string): MenuModel {
			if (iconHeight == null || iconHeight == undefined) {
				this.iconHeight = '18vp'
				return this
			}
			this.iconHeight = iconHeight
			return this
		}

		getIconHeight(): number | string {
			return this.iconHeight
		}

		setIconWidth(iconWidth: number | string): MenuModel {
			if (iconWidth == null || iconWidth == undefined) {
				this.iconWidth = '18vp'
				return this
			}
			this.iconWidth = iconWidth
			return this
		}

		getIconWidth(): number | string {
			return this.iconWidth
		}

		reset(): MenuModel {
			this.iconHeight = '18vp'
			this.iconWidth = '18vp'
			return this
		}
	}
}

export { DotMenu, DotMenuOption }