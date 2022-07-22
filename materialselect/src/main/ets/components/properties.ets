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

export class Properties {
	private title: string = ""
	private titleFontSize: number | string = '14vp'
	private titleFontColor: string | Resource = '#333F48'
	private height: number | string = '60vp'
	private width: number | string = '100vp'
	private backgroundColor: string | Color = Color.White
	private borderWidth: number | string = '1vp'
	private borderRadius: number | string = '4vp'
	private borderColor: string | Color = '#9CA2C7'
	private unselectedColor: string | Color = Color.White
	private selectedColor: string | Color = '#F0F3FF'
	private padding: Padding | Length = '0vp'
	private margin: Margin | Length = '0vp'

	constructor(title: string) {
		if (title != null && title != undefined) {
			this.title = title
		}
	}

	setTitle(title: string): Properties {
		if (title == null || title == undefined) {
			this.title = ''
			return this
		}
		this.title = title
		return this
	}

	getTitle(): string {
		return this.title
	}

	setTitleFontSize(titleFontSize: number | string): Properties {
		if (titleFontSize == null || titleFontSize == undefined) {
			this.titleFontSize = '14vp'
			return this
		}
		this.titleFontSize = titleFontSize
		return this
	}

	getTitleFontSize(): number | string {
		return this.titleFontSize
	}

	setTitleFontColor(titleFontColor: string | Resource): Properties {
		if (titleFontColor == null || titleFontColor == undefined) {
			this.titleFontColor = '#333F48'
			return this
		}
		this.titleFontColor = titleFontColor
		return this
	}

	getTitleFontColor(): string | Resource {
		return this.titleFontColor
	}

	setHeight(height: number | string): Properties {
		if (height == null || height == undefined) {
			this.height = '60vp'
			return this
		}
		this.height = height
		return this
	}

	getHeight(): number | string {
		return this.height
	}

	setWidth(width: number | string): Properties {
		if (width == null || width == undefined) {
			this.width = '120vp'
			return this
		}
		this.width = width
		return this
	}

	getWidth(): number | string {
		return this.width
	}

	setBackgroundColor(backgroundColor: string | Color): Properties {
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

	setBorderWidth(borderWidth: number | string): Properties {
		if (borderWidth == null || borderWidth == undefined) {
			this.borderWidth = '1vp'
			return this
		}
		this.borderWidth = borderWidth
		return this
	}

	getBorderWidth(): number | string {
		return this.borderWidth
	}

	setBorderRadius(borderRadius: number | string): Properties {
		if (borderRadius == null || borderRadius == undefined) {
			this.borderRadius = '4vp'
			return this
		}
		this.borderRadius = borderRadius
		return this
	}

	getBorderRadius(): number | string {
		return this.borderRadius
	}

	setBorderColor(borderColor: string | Color): Properties {
		if (borderColor == null || borderColor == undefined) {
			this.borderColor = '#9CA2C7'
			return this
		}
		this.borderColor = borderColor
		return this
	}

	getBorderColor(): string | Color {
		return this.borderColor
	}

	setUnselectedColor(unselectedColor: string | Color): Properties {
		if (unselectedColor == null || unselectedColor == undefined) {
			this.unselectedColor = Color.White
			return this
		}
		this.unselectedColor = unselectedColor
		return this
	}

	getUnselectedColor(): string | Color {
		return this.unselectedColor
	}

	setSelectedColor(selectedColor: string | Color): Properties {
		if (selectedColor == null || selectedColor == undefined) {
			this.selectedColor = '#F0F3FF'
			return this
		}
		this.selectedColor = selectedColor
		return this
	}

	getSelectedColor(): string | Color {
		return this.selectedColor
	}

	setPadding(padding: Margin | Length): Properties {
		if (padding == null || padding == undefined) {
			this.padding = '0vp'
			return this
		}
		this.padding = padding
		return this
	}

	getPadding(): Padding | Length {
		return this.padding
	}

	setMargin(margin: Margin | Length): Properties {
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

	reset(): Properties {
		this.title = ''
		this.titleFontSize = '14vp'
		this.titleFontColor = '#333F48'
		this.height = '60vp'
		this.width = '120vp'
		this.backgroundColor = Color.White
		this.borderRadius = '4vp'
		this.borderColor = '#9CA2C7'
		this.unselectedColor = Color.White
		this.selectedColor = '#F0F3FF'
		this.padding = '0vp'
		this.margin = '0vp'
		return this
	}
}

export class MenuProperties {
	private height: number = 40
	private width: number = 150
	private fontSize: number | string = '14vp'
	private fontColor: string | Color = '#333F48'
	private borderRadius: number | string = '0vp'
	private padding: Padding | Length = '10vp'

	setHeight(height: number): MenuProperties {
		if (height == null || height == undefined) {
			this.height = 40
			return this
		}
		if (height < 40) {
			this.height = 40
			return this
		}
		if (height > 200) {
			this.height = 200
			return this
		}
		this.height = height
		return this
	}

	getHeight(): number {
		return this.height
	}

	setWidth(width: number): MenuProperties {
		if (width == null || width == undefined) {
			this.width = 150
			return this
		}
		if (width < 50) {
			this.width = 50
			return this
		}
		if (width > 200) {
			this.width = 200
			return this
		}
		this.width = width
		return this
	}

	getWidth(): number {
		return this.width
	}

	setFontSize(fontSize: number | string): MenuProperties {
		if (fontSize == null || fontSize == undefined) {
			this.fontSize = '14vp'
			return this
		}
		this.fontSize = fontSize
		return this
	}

	getFontSize(): number | string {
		return this.fontSize
	}

	setFontColor(fontColor: string | Color): MenuProperties {
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

	setBorderRadius(borderRadius: number | string): MenuProperties {
		if (borderRadius == null || borderRadius == undefined) {
			this.borderRadius = '0vp'
			return this
		}
		this.borderRadius = borderRadius
		return this
	}

	getBorderRadius(): number | string {
		return this.borderRadius
	}

	setPadding(padding: Margin | Length): MenuProperties {
		if (padding == null || padding == undefined) {
			this.padding = '0vp'
			return this
		}
		this.padding = padding
		return this
	}

	getPadding(): Padding | Length {
		return this.padding
	}

	reset(): MenuProperties {
		this.height = 40
		this.width = 150
		this.fontColor = '#333F48'
		this.borderRadius = '0vp'
		this.padding = '0vp'
		return this
	}
}