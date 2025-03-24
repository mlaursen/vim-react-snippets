# vim-react-snippets

A collection of common Javascript and Typescript vim snippets for developing
[React] applications. The snippets within this repo rely on [LuaSnip] or
[UltiSnips] as the snippet provider.

## Typescript Example

https://user-images.githubusercontent.com/3920850/167317421-45035822-9ced-40ec-8d85-9b3db5d42651.mov

## Previewing Snippets with [coc-snippets](https://github.com/neoclide/coc-snippets)

https://user-images.githubusercontent.com/3920850/167317372-6165c118-99da-4a31-88e6-57b6c7086ed5.mov

## Using Log Helpers

https://user-images.githubusercontent.com/3920850/167317795-63e74576-f0e6-4787-817f-b699e88d10e7.mov

## Writing Tests

https://user-images.githubusercontent.com/3920850/167318157-70692488-b126-47b2-9eab-ee3dc79771e9.mov

## Installation

With [lazy.nvim] and [LuaSnip]:

```diff
  {
    "hrsh7th/nvim-cmp",
    dependencies = {
      "L3MON4D3/LuaSnip",
      "saadparwaiz1/cmp_luasnip",
+     "mlaursen/vim-react-snippets",
    },
    ---@param opts cmp.ConfigSchema
    opts = function()
      vim.api.nvim_set_hl(0, "CmpGhostText", { link = "Comment", default = true })
+     require("vim-react-snippets").lazy_load()
      local cmp = require("cmp")
      local luasnip = require("luasnip")
      local compare = cmp.config.compare
```

<details>
  <summary>
    With <a href="https://github.com/junegunn/vim-plug">vim-plug</a> and
    <a href="https://github.com/SirVer/ultisnips">UltiSnips</a>:
  </summary>

```vim
call plug#begin('~/.vim/plugged')
Plug 'SirVer/ultisnips'
Plug 'mlaursen/vim-react-snippets'
call plug#end()
```

</details>

> NOTE: I no longer use UltiSnips so the snippets might be different. Check out
> the [UltiSnips folder] to see available snippets.

## Cheatsheet

Most of the available snippets will be listed below to showcase the generated
code. Tabstops will be indicated with `$TABSTOP` or `$NAME` where `$NAME` is
replaceable. `$CFN` or `$CFN_` will indicate a snippet that uses the current
file name to generate the code.

Some snippets support an "inline" version as where the `const whatever = ` will
be omitted. These snippets will be marked with ✨.

> Javascript snippets are not shown since I really only use Typescript now, but
> they are generally the same without the type definitions included.

## Table of Contents

<!-- toc -->

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
  - [useContext ✨](#usecontext-)
  - [useCallback ✨](#usecallback-)
  - [useMemo ✨](#usememo-)
  - [useMemo return (manual return required) ✨](#usememo-return-manual-return-required-)
  - [useRef ✨](#useref-)
  - [Create Context Provider](#create-context-provider)
- [Redux](#redux)
  - [useAppDispatch ✨](#useappdispatch-)
  - [useSelector ✨](#useselector-)
  - [useAppSelector ✨](#useappselector-)
- [Common](#common)
  - [Destructured Const](#destructured-const)
  - [Export Destructured Const](#export-destructured-const)
  - [if](#if)
  - [else](#else)
  - [switch](#switch)
  - [for loop](#for-loop)
  - [reduce](#reduce)
  - [noop](#noop)
  - [interface](#interface)
- [JSDoc/TSDoc](#jsdoctsdoc)
  - [Block Comment](#block-comment)
  - [@example](#example)
  - [@defaultValue](#defaultvalue)
  - [@since](#since)
- [Logging](#logging)
- [Importing](#importing)
- [Exporting](#exporting)
- [NODE_ENV](#node_env)
- [Tests](#tests)
  - [Describe a test](#describe-a-test)
  - [it should...](#it-should)
  - [it should (async)...](#it-should-async)
  - [Test Expect](#test-expect)
  - [Test Queries ✨](#test-queries-)
- [React Testing](#react-testing)
  - [React Test File](#react-test-file)
  - [React Test File (ESM)](#react-test-file-esm)
  - [Global Test File](#global-test-file)
  - [Global Test File (ESM)](#global-test-file-esm)
  - [User Event Test](#user-event-test)
  - [waitFor](#waitfor)

* [SCSS Snippets](#scss-snippets)
* [Contributing](#contributing)
  - [LuaSnip Template](#luasnip-template)

<!-- tocstop -->

### Function Components

#### Function Component Export

`fce` ->

```tsx
import { type ReactElement, type ReactNode } from "react"

export interface $CFN_Props {
  $TABSTOP
  children: ReactNode
}

export function $CFN(props: $CFN_Props): ReactElement {
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

export default function $CFN(props: $CFN_Props): ReactElement {
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

export const $CFN = forwardRef<HTML$TABSTOPElement, $CFN_Props>(
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

export default forwardRef<HTML$TABSTOPElement, $CFN_Props>(
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

export function $CFN(props: $CFN_Props): Promise<ReactElement> {
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

export default function $CFN(props: $CFN_Props): Promise<ReactElement> {
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
const $VALUE = useAppSelector(($STATE) => $SELECTOR)
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

#### interface

`intf` ->

```ts
export interface $CFN_$TABSTOP {
  $TABSTOP
}
```

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

| Shortcut | Name                 | Expands to                                       |
| -------- | -------------------- | ------------------------------------------------ |
| `imp`    | Import               | `import packageName from "package-name"`         |
| `impf`   | Import File          | `import File from "./File"`                      |
| `impd`   | Import Destructured  | `import { destructured } from "package-or/path"` |
| `impp`   | Import (Please?)     | `import "./file"`                                |
| `icn`    | Import Classnames    | `import cn from "classnames"`                    |
| `icnb`   | Import Cnbuilder     | `import { cnb } from "cnbuilder"`                |
| `ism`    | Import Styles Module | `import styles from "./$CFN.module.scss"`        |

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

#### it should...

`it` ->

```ts
it("should $TABSTOP", () => {
  $TABSTOP
})
```

#### it should (async)...

`ita` ->

```ts
it("should $TABSTOP", async () => {
  $TABSTOP
})
```

#### Test Expect

| Shortcut | Name                | Expands to                                         |
| -------- | ------------------- | -------------------------------------------------- |
| `es`     | Expect Snapshot     | `expect(${container}).toMatchSnapshot()`           |
| `ett`    | Expect To Throw     | `expect(() => $TABSTOP).toThrow()`                 |
| `entt`   | Expect Not To Throw | `expect(() => $TABSTOP).not.toThrow()`             |
| `enc`    | Expect Not Called   | `expect($TABSTOP).not.toHaveBeenCalled()`          |
| `ecw`    | Expect Called With  | `expect($TABSTOP).toHaveBeenCalledWith($TABSTOP)`  |
| `ect`    | Expect Called Times | `expect($TABSTOP).toHaveBeenCalledTimes($TABSTOP)` |

#### Test Queries ✨

| Shortcut | Name                          | Expands to                                                                    |
| -------- | ----------------------------- | ----------------------------------------------------------------------------- |
| `sgbr`   | Screen Get By Role            | `const $TABSTOP = screen.getByRole("${button}", { name: "$TABSTOP" })`        |
| `sgbru`  | Screen Get By Role (Unnamed)  | `const $TABSTOP = screen.getByRole("${progressbar}")`                         |
| `sgbi`   | Screen Get By testId          | `const $TABSTOP = screen.getByTestId("$TABSTOP")`                             |
| `sgbt`   | Screen Get By Text            | `const $TABSTOP = screen.getByText("$TABSTOP")`                               |
| `sfbr`   | Screen Find By Role           | `const $TABSTOP = await screen.findByRole("${button}", { name: "$TABSTOP" })` |
| `sfbru`  | Screen Find By Role (Unnamed) | `const $TABSTOP = await screen.findByRole("${progressbar}")`                  |
| `fbi`    | Screen Find By testId         | `const $TABSTOP = await screen.findByTestId("$TABSTOP")`                      |
| `fbt`    | Screen Find By Text           | `const $TABSTOP = await screen.findByText("$TABSTOP")`                        |
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
[ultisnips]: https://github.com/SirVer/ultisnips
[ultisnips folder]:
  https://github.com/mlaursen/vim-react-snippets/tree/main/UltiSnips
[luasnip]: https://github.com/L3MON4D3/LuaSnip
[lazy.nvim]: https://github.com/folke/lazy.nvim
