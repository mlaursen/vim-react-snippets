# vim-react-snippets

A collection of common Javascript and Typescript vim snippets for developing
[React] applications. The snippets within this repo rely on [LuaSnip] as the
snippet provider.

## Table of Contents

<!--toc:start-->

- [vim-react-snippets](#vim-react-snippets)
  - [Table of Contents](#table-of-contents)
  - [Typescript Example](#typescript-example)
  - [Previewing Snippets](#previewing-snippets)
  - [Using Log Helpers](#using-log-helpers)
  - [Writing Tests](#writing-tests)
  - [Installation](#installation)
  - [Cheatsheet](#cheatsheet)
    - [Function Components](#function-components)
      - [Function Component Export](#function-component-export)
      - [Function Component Default Export](#function-component-default-export)
      - [Simple Function Component Export](#simple-function-component-export)
      - [Simple Function Component Default Export](#simple-function-component-default-export)
      - [Forwarded Function Component Export](#forwarded-function-component-export)
      - [Forwarded Function Component Default Export](#forwarded-function-component-default-export)
    - [Server Components](#server-components)
      - [Server Component Export](#server-component-export)
      - [Server Component Default Export](#server-component-default-export)
      - [Simple Server Component Export](#simple-server-component-export)
      - [Simple Server Component Default Export](#simple-server-component-default-export)
    - [Hooks and Effects](#hooks-and-effects)
      - [useState](#usestate)
      - [useReducer](#usereducer)
      - [useEffect](#useeffect)
      - [useContext ✨](#usecontext)
      - [useCallback ✨](#usecallback)
      - [useMemo ✨](#usememo)
      - [useMemo return (manual return required) ✨](#usememo-return-manual-return-required)
      - [useRef ✨](#useref)
      - [Create Context Provider](#create-context-provider)
    - [Redux](#redux)
      - [useAppDispatch ✨](#useappdispatch)
      - [useSelector ✨](#useselector)
      - [useAppSelector ✨](#useappselector)
    - [Common](#common)
      - [Destructured Const](#destructured-const)
      - [Export Destructured Const](#export-destructured-const)
      - [if](#if)
      - [else](#else)
      - [switch](#switch)
      - [for loop](#for-loop)
      - [reduce](#reduce)
      - [noop](#noop)
      - [Readonly](#readonly)
      - [interface](#interface)
      - [optional property](#optional-property)
      - [Typeparam Extends](#typeparam-extends)
      - [Typeparam Extends htmlElement](#typeparam-extends-htmlelement)
    - [JSDoc/TSDoc](#jsdoctsdoc)
      - [Block Comment](#block-comment)
      - [@example](#example)
      - [@defaultValue](#defaultvalue)
      - [@since](#since)
    - [Logging](#logging)
    - [Importing](#importing)
    - [Exporting](#exporting)
    - [NODE_ENV](#nodeenv)
    - [Tests](#tests)
      - [Describe a test](#describe-a-test)
      - [it should](#it-should)
      - [it should (async)](#it-should-async)
      - [Test Expect](#test-expect)
      - [Test Queries ✨](#test-queries)
    - [React Testing](#react-testing)
      - [React Test File](#react-test-file)
      - [React Test File (ESM)](#react-test-file-esm)
      - [Global Test File](#global-test-file)
      - [Global Test File (ESM)](#global-test-file-esm)
      - [User Event Test](#user-event-test)
      - [waitFor](#waitfor)
  - [SCSS Snippets](#scss-snippets)
    - [@function](#function)
    - [@mixin](#mixin)
    - [@mixin configure](#mixin-configure)
    - [set global](#set-global)
    - [@for $i from $start through $end](#for-i-from-start-through-end)
    - [@each $value in $list](#each-value-in-list)
    - [@each $key, $value in $map](#each-key-value-in-map)
  - [Material UI](#material-ui)
    - [sx function](#sx-function)
  - [Contributing](#contributing) - [LuaSnip Template](#luasnip-template)
  <!--toc:end-->

## Typescript Example

<https://user-images.githubusercontent.com/3920850/167317421-45035822-9ced-40ec-8d85-9b3db5d42651.mov>

## Previewing Snippets

<https://user-images.githubusercontent.com/3920850/167317372-6165c118-99da-4a31-88e6-57b6c7086ed5.mov>

## Using Log Helpers

<https://user-images.githubusercontent.com/3920850/167317795-63e74576-f0e6-4787-817f-b699e88d10e7.mov>

## Writing Tests

<https://user-images.githubusercontent.com/3920850/167318157-70692488-b126-47b2-9eab-ee3dc79771e9.mov>

## Installation

With [lazy.nvim] and [LuaSnip]:

```diff
  {
    "L3MON4D3/LuaSnip",
    version = "v2.*",
    dependencies = {
+     { "mlaursen/vim-react-snippets", opts = {} },
    },
```

Or with additional options:

```diff
  {
    "L3MON4D3/LuaSnip",
    version = "v2.*",
    dependencies = {
+     {
+       "mlaursen/vim-react-snippets",
+       opts = {
+         readonly_props = true, -- Set to `false` if all props should no longer be wrapped in `Readonly<T>`.
+         test_framework = "@jest/globals", -- Set to "vitest" if you use vitest
+         test_renderer_path = "@testing-library/user-event", -- Set to a custom test renderer. For example "@/test-utils"
+       }
+     },
    },
```

## Cheatsheet

Most of the available snippets will be listed below to showcase the generated
code. Tabstops will be indicated with `$TABSTOP` or `$NAME` where `$NAME` is
replaceable. `$CFN` or `$CFN_` will indicate a snippet that uses the current
file name to generate the code.

Some snippets support an "inline" version as where the `const whatever =` will
be omitted. These snippets will be marked with ✨.

> Javascript snippets are not shown since I really only use Typescript now, but
> they are generally the same without the type definitions included.

### Function Components

#### Function Component Export

`fce` ->

```tsx
import { type ReactElement, type ReactNode } from "react"

export interface $CFN_Props {
  $TABSTOP
  children: ReactNode
}

export function $CFN(props: Readonly<$CFN_Props>): ReactElement {
  return <></>
}
```

#### Function Component Default Export

`fcde` ->

```tsx
import { type ReactElement, type ReactNode } from "react"

export interface $CFN_Props {
  $TABSTOP
  children: ReactNode
}

export default function $CFN(props: Readonly<$CFN_Props>): ReactElement {
  return <></>
}
```

#### Simple Function Component Export

`sfce` ->

```tsx
import { type ReactElement } from "react"

export function $CFN(): ReactElement {
  return <></>
}
```

#### Simple Function Component Default Export

`sfcde` ->

```tsx
import { type ReactElement } from "react"

export default function $CFN(): ReactElement {
  return <></>
}
```

#### Forwarded Function Component Export

`ffce` ->

```tsx
import { forwardRef, type ReactNode } from "react"

export interface $CFNProps {
  $TABSTOP
  children: ReactNode
}

export const $CFN = forwardRef<HTML$TABSTOPElement, Readonly<$CFN_Props>>(
  function $CFN(props, ref) {
    return <div ref={ref}></div>
  }
)
```

#### Forwarded Function Component Default Export

`ffcde` ->

```tsx
import { forwardRef, type ReactNode } from "react"

export interface $CFNProps {
  $TABSTOP
  children: ReactNode
}

export default forwardRef<HTML$TABSTOPElement, Readonly<$CFN_Props>>(
  function $CFN(props, ref) {
    return <div ref={ref}></div>
  }
)
```

### Server Components

#### Server Component Export

`sce` ->

```tsx
import { type ReactElement, type ReactNode } from "react"

export interface $CFN_Props {
  $TABSTOP
  children: ReactNode
}

export function $CFN(props: Readonly<$CFN_Props>): Promise<ReactElement> {
  return <></>
}
```

#### Server Component Default Export

`scde` ->

```tsx
import { type ReactElement, type ReactNode } from "react"

export interface $CFN_Props {
  $TABSTOP
  children: ReactNode
}

export default function $CFN(
  props: Readonly<$CFN_Props>
): Promise<ReactElement> {
  return <></>
}
```

#### Simple Server Component Export

`sfce` ->

```tsx
import { type ReactElement } from "react"

export function $CFN(): Promise<ReactElement> {
  return <></>
}
```

#### Simple Server Component Default Export

`sscde` ->

```tsx
import { type ReactElement } from "react"

export default function $CFN(): Promise<ReactElement> {
  return <></>
}
```

### Hooks and Effects

#### useState

`useS` ->

```ts
const [$STATE, set$STATE] = useState$TABSTOP($TABSTOP)
```

#### useReducer

`useRed` ->

```tsx
const [$STATE, $DISPATCH] = useReducer(function reducer(state: $STATE, action: $ACTION): $STATE {
  switch (action.type):
    default:
      return state
}, $INITIAL_STATE)
```

#### useEffect

`useE` ->

```ts
useEffect(() => {
  $TABSTOP
}, [])
```

#### useContext ✨

`useC` ->

```ts
const context = useContext($TABSTOP)
```

#### useCallback ✨

`useCB` ->

<!-- prettier-ignore -->
```ts
const $CALLBACK = useCallback(($TABSTOP) => {
  $TABSTOP
}, [])
```

#### useMemo ✨

`useM` ->

<!-- prettier-ignore -->
```ts
const $MEMOIZED = useMemo(() => ({
  $TABSTOP
}), [])
```

#### useMemo return (manual return required) ✨

`useMR` ->

<!-- prettier-ignore -->
```ts
const $MEMOIZED = useMemo(() => {
  $TABSTOP
}, [])
```

#### useRef ✨

`useR` ->

```ts
const $REF = useRef$TABSTOP(TABSTOP)
```

#### Create Context Provider

`ccp` ->

```tsx
import { createContext, useContext } from "react"

export interface $CFN_Context {}

const context = createContext<$CFN_Context | null>(null)
const { Provider } = context

export function use$CFN_Context(): $CFN_Context {
  const value = useContext(context)
  if (!value) {
    throw new Error("$CFN_Context must be initialized.")
  }

  return value
}
```

### Redux

#### useAppDispatch ✨

`useD` ->

```ts
const dispatch = useAppDispatch()
```

#### useSelector ✨

`useSL` ->

```ts
const $VALUE = useSelector(($STATE: AppState) => $SELECTOR)
```

#### useAppSelector ✨

`useAS` ->

```ts
const $VALUE = useAppSelector($STATE)
```

### Common

#### Destructured Const

`dc` ->

```ts
const { $TABSTOP } = $PROPS
```

```ts
dcuseSomeHook()
 ^ trigger completion here

const { $TABSTOP } = useSomeHook()
```

#### Export Destructured Const

`edc` ->

```ts
const { $TABSTOP } = $PROPS
```

#### if

`if` ->

```ts
if ($CONDITION) {
  $TABSTOP
}
```

#### else

`else` ->

```ts
else $TABSTOP{
  $TABSTOP
}
```

The `if` snippet can be triggered from the first tabstop to generate:

```ts
else if{
  $TABSTOP
}
```

into:

```ts
else if ($CONDITION) {
  $TABSTOP
}
```

#### switch

`switch` ->

```ts
switch ($KEY) {
  case $VALUE:
    $TABSTOP
    break
  default:
    $TABSTOP
}
```

#### for loop

`for` ->

```ts
for (let $I = $0, $I < $LIST.length; $I++) {
  const $ITEM = $LIST[$I]
  $TABSTOP
}
```

#### reduce

`reduce` ->

```ts
const $VALUE = $LIST.reduce<$TYPE_DEF>(($result, $item) => {
  $TABSTOP
  return $RESULT
}, $INITIAL)
```

#### noop

`noop` ->

```ts
const noop = (): void => {
  // do nothing
}
```

#### Readonly

`ro` ->

```ts
Readonly<$T>
```

#### interface

`intf` ->

```ts
export interface $CFN_$TABSTOP {
  $TABSTOP
}
```

#### optional property

`op` ->

```ts
$NAME?: $STRING
```

#### Typeparam Extends

`te` -> `<T $EXTENDS $TABSTOP>`

#### Typeparam Extends htmlElement

`tee` -> `<E extends HTMLElement = $HTMLElement>`

### JSDoc/TSDoc

#### Block Comment

`/**` ->

```ts
/**
 * $TABSTOP
 */
```

#### @example

`@e` ->

```ts
@example $EXAMPLE_NAME
\`\`\`$TSX
$TABSTOP
\`\`\`
```

#### @defaultValue

`@d` ->

```ts
@defaultValue \`$TABSTOP\`
```

#### @since

`@s` ->

```ts
@since $MAJOR.$MINOR.$PATCH
```

### Logging

| Shortcut | Nane                   | Expands to                              |
| -------- | ---------------------- | --------------------------------------- |
| `cl`     | Console Log            | `console.log($TABSTOP)`                 |
| `clv`    | Console Log Variable   | `console.log("$TABSTOP: ", $TABSTOP)`   |
| `ce`     | Console Error          | `console.error($TABSTOP)`               |
| `cev`    | Console Error Variable | `console.error("$TABSTOP: ", $TABSTOP)` |
| `cw`     | Console Warn           | `console.warn($TABSTOP)`                |
| `cwv`    | Console Warn Variable  | `console.warn("$TABSTOP: ", $TABSTOP)`  |
| `ct`     | Console Table          | `console.table($TABSTOP)`               |
| `cd`     | Console Debug          | `console.debug($TABSTOP)`               |
| `cdv`    | Console Debug Variable | `console.debug("$TABSTOP: ", $TABSTOP)` |

> Note: The logging commands that end in a `v` will have the cursor at the
> second `$TABSTOP` instead of the first so that autocompletion will work.

### Importing

| Shortcut | Name                | Expands to                                       |
| -------- | ------------------- | ------------------------------------------------ |
| `imp`    | Import              | `import packageName from "package-name"`         |
| `impf`   | Import File         | `import File from "./File"`                      |
| `impd`   | Import Destructured | `import { destructured } from "package-or/path"` |
| `impp`   | Import (Please?)    | `import "./file"`                                |
| `icn`    | Import Classnames   | `import cn from "classnames"`                    |
| `icnb`   | Import Cnbuilder    | `import { cnb } from "cnbuilder"`                |
| `ism`    | Import SCSS Module  | `import styles from "./$CFN.module.scss"`        |
| `icm`    | Import CSS Module   | `import styles from "./$CFN.module.css"`         |

### Exporting

| Shortcut | Name                | Expands to                              |
| -------- | ------------------- | --------------------------------------- |
| `exp`    | Export              | `export { default } from "./$CFN"`      |
| `expf`   | Export File         | `export $TABSTOP from "./$TABSTOP"`     |
| `expd`   | Export Destructured | `export { $TABSTOP } from "./$TABSTOP"` |
| `expa`   | Export All          | `export * from "$TABSTOP"`              |

### NODE_ENV

| Shortcut | Expands to                              |
| -------- | --------------------------------------- |
| `dev`    | `process.env.NODE_ENV !== "production"` |
| `prod`   | `process.env.NODE_ENV === "production"` |

### Tests

#### Describe a test

`desc` ->

```ts
describe('$CFN', () => {
  it('should $TABSTOP', () => {
    $TABSTOP
  )}
})
```

#### it should

`it` ->

```ts
it("should $TABSTOP", () => {
  $TABSTOP
})
```

#### it should (async)

`ita` ->

```ts
it("should $TABSTOP", async () => {
  $TABSTOP
})
```

#### Test Expect

> NOTE: when using `vitest`, `toThrowError()` will be used instead of
> `toThrow()`

| Shortcut | Name                   | Expands to                                            |
| -------- | ---------------------- | ----------------------------------------------------- |
| `es`     | Expect Snapshot        | `expect(${container}).toMatchSnapshot()`              |
| `ett`    | Expect To Throw        | `expect(() => $TABSTOP).toThrow()`                    |
| `entt`   | Expect Not To Throw    | `expect(() => $TABSTOP).not.toThrow()`                |
| `enc`    | Expect Not Called      | `expect($TABSTOP).not.toHaveBeenCalled()`             |
| `ecw`    | Expect Called With     | `expect($TABSTOP).toHaveBeenCalledWith($TABSTOP)`     |
| `encw`   | Expect Not Called With | `expect($TABSTOP).not.toHaveBeenCalledWith($TABSTOP)` |
| `ect`    | Expect Called Times    | `expect($TABSTOP).toHaveBeenCalledTimes($TABSTOP)`    |

#### Test Queries ✨

| Shortcut | Name                          | Expands to                                                                    |
| -------- | ----------------------------- | ----------------------------------------------------------------------------- |
| `sgbr`   | Screen Get By Role            | `const $TABSTOP = screen.getByRole("${button}", { name: "$TABSTOP" })`        |
| `sgbru`  | Screen Get By Role (Unnamed)  | `const $TABSTOP = screen.getByRole("${progressbar}")`                         |
| `sgbi`   | Screen Get By testId          | `const $TABSTOP = screen.getByTestId("$TABSTOP")`                             |
| `sgbt`   | Screen Get By Text            | `const $TABSTOP = screen.getByText("$TABSTOP")`                               |
| `sgbl`   | Screen Get By Label Text      | `const $TABSTOP = screen.getByLabelText("$TABSTOP")`                          |
| `sfbr`   | Screen Find By Role           | `const $TABSTOP = await screen.findByRole("${button}", { name: "$TABSTOP" })` |
| `sfbru`  | Screen Find By Role (Unnamed) | `const $TABSTOP = await screen.findByRole("${progressbar}")`                  |
| `fbi`    | Screen Find By testId         | `const $TABSTOP = await screen.findByTestId("$TABSTOP")`                      |
| `fbt`    | Screen Find By Text           | `const $TABSTOP = await screen.findByText("$TABSTOP")`                        |
| `fbl`    | Screen Find By Label Text     | `const $TABSTOP = await screen.findByLabelText("$TABSTOP")`                   |
| `gbr`    | Get By Role                   | `const $TABSTOP = getByRole("${button}", { name: "$TABSTOP" })`               |
| `gbru`   | Get By Role (Unnamed)         | `const $TABSTOP = getByRole("${progressbar}")`                                |
| `gbi`    | Get By testId                 | `const $TABSTOP = getByTestId("$TABSTOP")`                                    |
| `gbt`    | Get By Text                   | `const $TABSTOP = getByText("$TABSTOP")`                                      |
| `fbr`    | Find By Role                  | `const $TABSTOP = await findByRole("${button}", { name: "$TABSTOP" })`        |
| `fbru`   | Find By Role (Unnamed)        | `const $TABSTOP = await findByRole("${progressbar}")`                         |
| `fbi`    | Find By testId                | `const $TABSTOP = await findByTestId("$TABSTOP")`                             |
| `fbt`    | Find By Text                  | `const $TABSTOP = await findByText("$TABSTOP")`                               |

### React Testing

#### React Test File

`rtf` ->

```tsx
import { render, screen, userEvent } from "${@testing-library/react}"

import { $CFN } from "../$CFN"

describe("$CFN", () => {
  it("should $TABSTOP", () => {
    $TABSTOP
  })
})
```

#### React Test File (ESM)

`rtfe` ->

```tsx
import { render, screen, userEvent } from "${@testing-library/react}"

import { $CFN } from "../$CFN.js"

describe("$CFN", () => {
  it("should $TABSTOP", () => {
    $TABSTOP
  })
})
```

#### Global Test File

`gtf` ->

```tsx
import { describe, expect, it } from "${@jest/globals}"
import { render, screen, userEvent } from "${@testing-library/react}"

import { $CFN } from "../$CFN"

describe("$CFN", () => {
  it("should $TABSTOP", () => {
    $TABSTOP
  })
})
```

#### Global Test File (ESM)

`gtfe` ->

```tsx
import { describe, expect, it } from "${@jest/globals}"
import { render, screen, userEvent } from "${@testing-library/react}"

import { $CFN } from "../$CFN.js"

describe("$CFN", () => {
  it("should $TABSTOP", () => {
    $TABSTOP
  })
})
```

#### User Event Test

`uet` ->

```tsx
it("should $TABSTOP", async () => {
  const user = userEvent.setup()
  $TABSTOP

  expect(true).toBe(true)
})
```

#### waitFor

`wf` ->

```tsx
await waitFor(() => {
  $TABSTOP
})
```

## SCSS Snippets

| Shortcut | Name                 | Expands to                                          |
| -------- | -------------------- | --------------------------------------------------- |
| `use`    | Use                  | `@use "$TABSTOP";`                                  |
| `use*`   | Use \*               | `@use "$TABSTOP" as *;`                             |
| `for`    | Forward              | `@forward "$TABSTOP" with ($TABSTOP);`              |
| `pcs`    | Prefers Color Scheme | `@media (prefers-color-scheme: $DARK) { $TABSTOP }` |
| `mg`     | Map Get              | `map.get($$TABSTOP, $TABSTOP)`                      |
| `ms`     | Map Set              | `map.set($$TABSTOP, $TABSTOP)`                      |
| `mr`     | Map Remove           | `map.remove($$TABSTOP, $TABSTOP)`                   |
| `mm`     | Map Merge            | `map.merge($$TABSTOP, $TABSTOP)`                    |
| `mdm`    | Map Deep Merge       | `map.deep-merge($$TABSTOP, $TABSTOP)`               |
| `la`     | List Append          | `list.append($$TABSTOP, $TABSTOP)`                  |
| `li`     | List Index           | `list.index($$TABSTOP, $TABSTOP)`                   |
| `ll`     | List Length          | `list.length($$TABSTOP)`                            |
| `ln`     | List Nth             | `list.nth($$TABSTOP, $TABSTOP)`                     |
| `to`     | Meta type-of         | `meta.type-of($$TABSTOP)`                           |
| `si`     | String Index         | `string.index($$TABSTOP, $TABSTOP)`                 |
| `sl`     | String Length        | `string.length($$TABSTOP)`                          |
| `sn`     | String Slice         | `string.slice($$TABSTOP, $TABSTOP, $TABSTOP)`       |
| `su`     | String Unquote       | `string.unquote($TABSTOP)`                          |
| `sa`     | Set Arg              | `$$TABSTOP: $NULL`                                  |
| `if`     | if (inline)          | `if(sass($CONDITION): $THEN; else: $THAT)`          |

### @if

`if` ->

```scss
@if $TABSTOP {
  $TABSTOP
}
```

### @function

`fun` ->

```scss
@function $TABSTOP($TABSTOP) {
  $TABSTOP
  @return $TABSTOP;
}
```

### @mixin

`mix` ->

```scss
@mixin $TABSTOP($TABSTOP) {
  $TABSTOP
}
```

### @mixin configure

`conf` ->

```scss
@mixin configure($$TABSTOP: null) {
  @if $1 {
    $-$1: $1 !global;
  }

  $TABSTOP
}
```

### set global

`sg` ->

```scss
@if $$TABSTOP {
  $-$1: $1 !global;
}
```

### @for $i from $start through $end

`ft` ->

```scss
@for $$I from $$START through $$END {
  $TABSTOP
}
```

### @each $value in $list

`el` ->

```scss
@each $$VALUE in $$LIST {
  $TABSTOP
}
```

### @each $key, $value in $map

`em` ->

```scss
@each $$KEY, $$VALUE in $$MAP {
  $TABSTOP
}
```

## Material UI

### sx function

`sx` ->

```tsx
sx={(theme) => ({
  $TABSTOP
})}
```

## Contributing

### LuaSnip Template

```lua
local ls = require("luasnip")
local s = ls.snippet
local sn = ls.snippet_node
local isn = ls.indent_snippet_node
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node
local c = ls.choice_node
local d = ls.dynamic_node
local r = ls.restore_node
local events = require("luasnip.util.events")
local ai = require("luasnip.nodes.absolute_indexer")
local extras = require("luasnip.extras")
local l = extras.lambda
local rep = extras.rep
local p = extras.partial
local m = extras.match
local n = extras.nonempty
local dl = extras.dynamic_lambda
local fmt = require("luasnip.extras.fmt").fmt
local fmta = require("luasnip.extras.fmt").fmta
local conds = require("luasnip.extras.expand_conditions")
local postfix = require("luasnip.extras.postfix").postfix
local types = require("luasnip.util.types")
local parse = require("luasnip.util.parser").parse_snippet
local ms = ls.multi_snippet
local k = require("luasnip.nodes.key_indexer").new_key
```

[react]: https://reactjs.org/
[luasnip]: https://github.com/L3MON4D3/LuaSnip
[lazy.nvim]: https://github.com/folke/lazy.nvim
