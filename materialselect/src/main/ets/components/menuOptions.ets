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

class MenuOption {
	private value: string
	private id: number | string

	constructor(value: string, id: number | string) {
		if (value == null || value == undefined) {
			value = ''
		}
		if (id == null || id == undefined) {
			id = -1
		}
		this.value = value
		this.id = id
	}

	setValue(value: string): MenuOption {
		if (value == null || value == undefined) {
			value = ''
		}
		this.value = value
		return this
	}

	getValue(): string {
		return this.value
	}

	setId(id: number | string): MenuOption {
		if (id == null || id == undefined) {
			id = -1
		}
		this.id = id
		return this
	}

	getId(): number | string {
		return this.id
	}
}

class MultipleMenuOption extends MenuOption {
	private checked: boolean = false

	constructor(value: string, id: number | string, checked?: boolean) {
		super(value, id)
		if (checked != null && checked != undefined) this.checked = Boolean(checked)
	}

	setChecked(checked: boolean): MultipleMenuOption {
		if (checked == null && checked == undefined) {
			checked = false
		}
		this.checked = Boolean(checked)
		return this
	}

	getChecked(): boolean {
		return this.checked
	}
}

class DotMenuOption extends MenuOption {
	private icon?: string | Resource

	constructor(value: string, id: number | string, icon?: string | Resource) {
		super(value, id)
		if (icon != null && icon != undefined) this.icon = icon
	}

	setIcon(icon: string | Resource) {
		if (icon == null || icon == undefined) {
			icon = ''
		}
		this.icon = icon
	}

	getIcon(): string | Resource {
		return this.icon
	}
}

export { MenuOption, MultipleMenuOption, DotMenuOption }