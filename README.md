# vim-react-snippets

A collection of common Javascript and Typescript vim snippets for developing
[React] applications. The snippets within this repo rely on [UltiSnips] as the
snippet provider.

## Installation

I recommend using a package manager such as [vim-plug] to install your vim
packages.

```vim
call plug#begin('~/.vim/plugged')
Plug 'SirVer/ultisnips'
Plug 'mlaursen/vim-react-snippets'
call plug#end()
```

You can always see my [full .vimrc] for my Javascript/Typescript configuration
and setup.

## Javascript Example

![Javascript Example](https://user-images.githubusercontent.com/3920850/55372575-75010a80-54bf-11e9-97ce-3557ba3f044e.gif)

## Typescript Example

![Typescript Example](https://user-images.githubusercontent.com/3920850/55372579-79c5be80-54bf-11e9-92d3-3122879aaa61.gif)

## Hooks Example

![Hooks Example](https://user-images.githubusercontent.com/3920850/55372583-7c281880-54bf-11e9-94ab-c8fb1bba411b.gif)

## Table of Contents

<!-- toc -->

- [Cheatsheet](#cheatsheet)
  - [PropTypes](#proptypes)
  - [Class Components (Javascript)](#class-components-javascript)
    - [React Class Export](#react-class-export)
    - [React Class Component](#react-class-component)
    - [React Class Constructor](#react-class-constructor)
    - [Static PropTypes](#static-proptypes)
    - [Static Default Props](#static-default-props)
    - [React Class Function (arrow bound class function)](#react-class-function-arrow-bound-class-function)
  - [Function Components (Javascript)](#function-components-javascript)
    - [Function Component Export](#function-component-export)
    - [Simple Function Component Export](#simple-function-component-export)
    - [Forwarded Function Component Export](#forwarded-function-component-export)
    - [Component PropTypes](#component-proptypes)
    - [Component Default Props](#component-default-props)
  - [React Lifecycle (Javascript)](#react-lifecycle-javascript)
    - [Get Derived State from props](#get-derived-state-from-props)
    - [Get Derived state from Error](#get-derived-state-from-error)
    - [Component Did Mount](#component-did-mount)
    - [Should Component Update](#should-component-update)
    - [Get Snapshot Before Update](#get-snapshot-before-update)
    - [Component Did Update](#component-did-update)
    - [Component Did Catch](#component-did-catch)
    - [Component Will Unmount](#component-will-unmount)
  - [Hooks and Effects (Javascript)](#hooks-and-effects-javascript)
    - [useState](#usestate)
    - [useEffect](#useeffect)
    - [useEffect async](#useeffect-async)
    - [useContext](#usecontext)
    - [useReducer](#usereducer)
    - [useCallback](#usecallback)
    - [useMemo](#usememo)
    - [useRef](#useref)
    - [useImperitiveHandle](#useimperitivehandle)
    - [useLayoutEffect](#uselayouteffect)
    - [useDebugValue](#usedebugvalue)
  - [General Redux (Javascript)](#general-redux-javascript)
    - [mirrored const](#mirrored-const)
    - [useDispatch](#usedispatch)
    - [useSelector](#useselector)
  - [Redux Toolkit (Javascript)](#redux-toolkit-javascript)
    - [createSlice](#createslice)
    - [export createSlice](#export-createslice)
    - [create prepare reducer](#create-prepare-reducer)
    - [createAsyncThunk](#createasyncthunk)
  - [General Built-Ins (Javascript)](#general-built-ins-javascript)
    - [jsdoc comment](#jsdoc-comment)
  - [Class Components (Typescript)](#class-components-typescript)
    - [React Class Export](#react-class-export-1)
    - [React Class Export with Prop interface](#react-class-export-with-prop-interface)
    - [React Class Export with Props and State](#react-class-export-with-props-and-state)
    - [React Class Component](#react-class-component-1)
    - [React Class Constructor](#react-class-constructor-1)
    - [Static PropTypes](#static-proptypes-1)
    - [Static Default Props](#static-default-props-1)
    - [Static Default Props Typed](#static-default-props-typed)
    - [React Class Function (arrow bound class function)](#react-class-function-arrow-bound-class-function-1)
  - [Function Components (Typescript)](#function-components-typescript)
    - [Function Component Export](#function-component-export-1)
    - [Function Component Default Export](#function-component-default-export)
    - [Simple Function Component Export](#simple-function-component-export-1)
    - [Simple Function Component Default Export](#simple-function-component-default-export)
    - [Forwarded Function Component Export](#forwarded-function-component-export-1)
    - [Forwarded Function Component Default Export](#forwarded-function-component-default-export)
    - [Component PropTypes](#component-proptypes-1)
    - [Component Default Props](#component-default-props-1)
    - [Component Default Props Typed](#component-default-props-typed)
  - [React Lifecycle (Typescript)](#react-lifecycle-typescript)
    - [Get Derived State from props](#get-derived-state-from-props-1)
    - [Get Derived state from Error](#get-derived-state-from-error-1)
    - [Component Did Mount](#component-did-mount-1)
    - [Should Component Update](#should-component-update-1)
    - [Get Snapshot Before Update](#get-snapshot-before-update-1)
    - [Component Did Update](#component-did-update-1)
    - [Component Did Catch](#component-did-catch-1)
    - [Component Will Unmount](#component-will-unmount-1)
  - [React Event Types (Typescript Only)](#react-event-types-typescript-only)
  - [General Redux (Typescript)](#general-redux-typescript)
    - [mirrored const](#mirrored-const-1)
    - [useDispatch](#usedispatch-1)
    - [useAppDispatch (Typescript Only)](#useappdispatch-typescript-only)
    - [useSelector](#useselector-1)
    - [useAppSelector (Typescript Only)](#useappselector-typescript-only)
    - [Ref (Typescript Only)](#ref-typescript-only)
    - [MutableRefObject (Typescript Only)](#mutablerefobject-typescript-only)
    - [RefCallback (Typescript Only)](#refcallback-typescript-only)
  - [Redux Toolkit (Typescript)](#redux-toolkit-typescript)
    - [createSlice](#createslice-1)
    - [export createSlice](#export-createslice-1)
    - [create prepare reducer](#create-prepare-reducer-1)
    - [createAsyncThunk](#createasyncthunk-1)
  - [Hooks and Effects (Typescript)](#hooks-and-effects-typescript)
    - [useState](#usestate-1)
    - [useEffect](#useeffect-1)
    - [useEffect async](#useeffect-async-1)
    - [useContext](#usecontext-1)
    - [useReducer](#usereducer-1)
    - [useReducer Untyped](#usereducer-untyped)
    - [useCallback](#usecallback-1)
    - [useMemo](#usememo-1)
    - [useRef](#useref-1)
    - [useImperitiveHandle](#useimperitivehandle-1)
    - [useLayoutEffect](#uselayouteffect-1)
    - [useDebugValue](#usedebugvalue-1)
  - [General Built-Ins (Typescript)](#general-built-ins-typescript)
    - [reduce to type (Typescript Only)](#reduce-to-type-typescript-only)
    - [jsdoc comment](#jsdoc-comment-1)
  - [Importing](#importing)
  - [Exporting](#exporting)
  - [Logging](#logging)
  - [NODE_ENV](#node_env)
  - [Tests (Javascript and Typescript)](#tests-javascript-and-typescript)
    - [React Test File](#react-test-file)
    - [React Hooks Test File](#react-hooks-test-file)
    - [Describe a test](#describe-a-test)
    - [it should...](#it-should)
    - [it should (async)...](#it-should-async)
    - [Test todo](#test-todo)
    - [expect snapshot](#expect-snapshot)

<!-- tocstop -->

## Cheatsheet

I will list the current supported snippets below and their implementation. I
recommend checking out the full source files in the [UltiSnips folder] to see
the full tabstop locations. The examples below will use `$TABSTOP` or `$NAME` to
indicate that there is a tabstop or a tabbable/replaceable variable. Finally, if
you see `$CFN` or `$CFN_`, it will be the Current File Name (the trailing
underscore will not be included, it is just added to show separation when
something else follows it).

### PropTypes

| Shortcut | Expands To                              |
| -------- | --------------------------------------- |
| `pt.a`   | `React.PropTypes.array`                 |
| `pt.ar`  | `React.PropTypes.array.isRequired`      |
| `pt.b`   | `React.PropTypes.bool`                  |
| `pt.br`  | `React.PropTypes.bool.isRequired`       |
| `pt.f`   | `React.PropTypes.func`                  |
| `pt.fr`  | `React.PropTypes.func.isRequired`       |
| `pt.nu`  | `React.PropTypes.number`                |
| `pt.nur` | `React.PropTypes.number.isRequired`     |
| `pt.o`   | `React.PropTypes.object`                |
| `pt.or`  | `React.PropTypes.object.isRequired`     |
| `pt.s`   | `React.PropTypes.string`                |
| `pt.sr`  | `React.PropTypes.string.isRequired`     |
| `pt.no`  | `React.PropTypes.node`                  |
| `pt.nor` | `React.PropTypes.node.isRequired`       |
| `pt.e`   | `React.PropTypes.element`               |
| `pt.er`  | `React.PropTypes.element.isRequired`    |
| `pt.ao`  | `React.PropTypes.arrayOf`               |
| `pt.aor` | `React.PropTypes.arrayOf.isRequired`    |
| `pt.io`  | `React.PropTypes.instanceOf`            |
| `pt.ior` | `React.PropTypes.instanceOf.isRequired` |
| `pt.oo`  | `React.PropTypes.objectOf`              |
| `pt.oor` | `React.PropTypes.objectOf.isRequired`   |
| `pt.sh`  | `React.PropTypes.shape`                 |
| `pt.shr` | `React.PropTypes.shape.isRequired`      |

### Class Components (Javascript)

#### React Class Export

`rce` ->

```jsx
import React, { Component } from "react"

export default class $CFN extends Component {
  constuctor(props) {
    super(props)

    this.state = {}
  }

  render() {
    return null
  }
}
```

#### React Class Component

`rcc` ->

```jsx
class $CFN extends Component {
  render() {
    return null
  }
}
```

#### React Class Constructor

`rcon` ->

```jsx
constructor(props) {
  super(props)

  this.state = {}
}
```

#### Static PropTypes

`spt` ->

```js
static propTypes = {
  $TABSTOP
}
```

#### Static Default Props

`sdp` ->

```js
static defaultProps = {
  $TABSTOP
}
```

#### React Class Function (arrow bound class function)

`rcf` ->

```js
$TABSTOP = ($TABSTOP) => {
  $TABSTOP
}
```

### Function Components (Javascript)

#### Function Component Export

`fce` ->

```jsx
import React from "react"

const $CFN = (props) => {
  return null
}

export default $CFN
```

#### Simple Function Component Export

`sfce` ->

```jsx
import React from "react"

const $CFN = () => {
  return null
}

export default $CFN
```

#### Forwarded Function Component Export

`ffce` ->

```jsx
import React, { forwardRef } from "react"

const $CFN = forwardRef(function $CFN(props, ref) {
  return <div ref={ref}></div>
})

export default $CFN
```

#### Component PropTypes

`cpt` ->

```js
$CFN.propTypes = {
  $TABSTOP,
}
```

#### Component Default Props

`cdp` ->

```js
$CFN.defaultProps = {
  $TABSTOP,
}
```

### React Lifecycle (Javascript)

#### Get Derived State from props

`gds` ->

```js
static getDerivedStateFromProps(nextProps, prevState) {
  return null
}
```

#### Get Derived state from Error

`gde` ->

```js
static getDerivedStateFromError(error) {
  return null
}
```

#### Component Did Mount

`cdm` ->

```js
componentDidMount() {
  $TABSTOP
}
```

#### Should Component Update

`scu` ->

```js
shouldComponentUpdate(nextProps, nextState) {
  $TABSTOP
}
```

#### Get Snapshot Before Update

`gsbu` ->

```js
getSnapshotBeforeUpdate(prevProps, prevState) {
  $TABSTOP
}
```

#### Component Did Update

`cdu` ->

```js
componentDidUpdate(prevProps, prevState, $SNAPSHOT) {
  $TABSTOP
}
```

#### Component Did Catch

`cdc` ->

```js
componentDidCatch(error, info) {
  $TABSTOP
}
```

#### Component Will Unmount

`cwum` ->

```js
componentWillUnmount() {
  $TABSTOP
}
```

### Hooks and Effects (Javascript)

#### useState

`useS` ->

```js
const [$STATE, set$STATE] = useState($TABSTOP)
```

#### useEffect

`useE` ->

```js
useEffect(() => {
  $TABSTOP
}, [$TABSTOP])
```

#### useEffect async

`useEA` ->

```js
useEffect(() => {
  let cancelled = false

  ;(async function $DOWORK() {
    // async work here
    $TABSTOP
    if (cancelled) {
      return
    }

    $TABSTOP
  })()

  return () => {
    cancelled = true
  }
}, [$TABSTOP])
```

#### useContext

`useC` ->

```js
const context = useContext($TABSTOP)
```

or inline:

`return useC` ->

```js
return useContext($TABSTOP)
```

#### useReducer

`useRed` ->

```js
const [$STATE, $DISPATCH] = useReducer($REDUCER, $NULL)
```

#### useCallback

`useCB` ->

<!-- prettier-ignore -->
```js
const $CALLBACK = useCallback(($TABSTOP) => {
  $TABSTOP
}, [$TABSTOP])
```

#### useMemo

`useM` ->

<!-- prettier-ignore -->
```js
const $MEMOIZED = useMemo(() => {
  $TABSTOP
}, [$TABSTOP])
```

#### useRef

`useR` ->

```js
const $REF = useRef($TABSTOP)
```

#### useImperitiveHandle

`useI` ->

<!-- prettier-ignore -->
```js
useImperitiveHandle($REF, () => ({
  $TABSTOP,
}), [$TABSTOP])
```

#### useLayoutEffect

`useL` ->

```js
useLayoutEffect(() => {
  $TABSTOP
}, [$TABSTOP])
```

#### useDebugValue

`useDV` ->

```js
useDebugValue($NULL)
```

### General Redux (Javascript)

#### mirrored const

`mc` ->

```js
const $THING = "$THING"
```

#### useDispatch

`useD` ->

```js
const dispatch = useDispatch()
```

or inline:

`const dispatch = useD` ->

```js
const dispatch = useDispatch()
```

#### useSelector

`useSL` ->

```js
const $VALUE = useSelector(($STATE) => $SELECTOR)
```

or inline:

`const checked = useSL` ->

```js
const checked = useSelector(($STATE) => $SELECTOR)
```

### Redux Toolkit (Javascript)

#### createSlice

`cs` ->

```js
const { actions, reducer } = createSlice({
  name: "$CFN",
  initialState: $TABSTOP,
  reducers: {
    $TABSTOP,
  },
})
```

#### export createSlice

`esc` ->

```js
import { createSlice } from "@reduxjs/toolkit"

const { actions, reducer } = createSlice({
  name: "$CFN",
  initialState: $TABSTOP,
  reducers: {
    $TABSTOP,
  },
})

export const { $TABSTOP } = actions

export default reducer
```

#### create prepare reducer

`cpr` ->

```js
$TABSTOP: {
	reducer(state, action) {
		$$TABSTOP
	},
	prepare($TABSTOP) {
		return { payload: { $TABSTOP } }
	}
}
```

#### createAsyncThunk

`cat` ->

```js
export const $TABSTOP = createAsyncThunk("$TABSTOP", async ($TABSTOP) => {
  $TABSTOP
})
```

or inline:

`export const doThing = cat` ->

```js
export const doThing = createAsyncThunk("$TABSTOP", async ($TABSTOP) => {
  $TABSTOP
})
```

### General Built-Ins (Javascript)

#### jsdoc comment

`/**` ->

```js
/**
 * $TABEND
 */
```

### Class Components (Typescript)

#### React Class Export

`rce` ->

```tsx
import React, { Component } from "react"

export default class $CFN extends Component {
  public render() {
    return null
  }
}
```

#### React Class Export with Prop interface

`rcep` ->

```tsx
import React, { Component } from "react"

export interface $CFN_Props {}

export default class $CFN extends Component<$CFN_Props> {
  public render() {
    return null
  }
}
```

#### React Class Export with Props and State

`rceps` ->

```tsx
import React, { Component } from "react"

export interface $CFN_Props {}

export interface $CFN_State {}

export default class $CFN extends Component<$CFN_Props, $CFN_State> {
  constructor(props: $CFN_Props) {
    super(props)

    this.state = {}
  }

  public render() {
    return null
  }
}
```

#### React Class Component

`rcc` ->

```jsx
class $CFN extends Component {
  public render() {
    return null
  }
}
```

#### React Class Constructor

`rcon` ->

```ts
constructor(props: $CFN_Props) {
  super(props)

  this.state = {}
}
```

#### Static PropTypes

`spt` ->

```js
public static propTypes = {
  $TABSTOP
}
```

#### Static Default Props

`sdp` ->

```js
public static defaultProps = {
  $TABSTOP
}
```

#### Static Default Props Typed

`sdpt` ->

```js
public static defaultProps: DefaultProps = {
  $TABSTOP
}
```

#### React Class Function (arrow bound class function)

`rcf` ->

```js
$TABSTOP = ($TABSTOP) => {
  $TABSTOP
}
```

### Function Components (Typescript)

Note: These are different than the Javascript versions on purpose and use the
`function` syntax instead of a "const + arrow function".

#### Function Component Export

`fce` ->

```tsx
import React, { ReactElement } from "react"

export interface $CFN_Props {}

export function $CFN(props: $CFN_Props): ReactElement | null {
  return null
}
```

#### Function Component Default Export

`fcde` ->

```tsx
import React, { ReactElement } from "react"

export interface $CFN_Props {}

export default function $CFN(props: $CFN_Props): ReactElement | null {
  return null
}
```

#### Simple Function Component Export

`sfce` ->

```tsx
import React, { ReactElement } from "react"

export function $CFN(): ReactElement | null {
  return null
}
```

#### Simple Function Component Default Export

`sfcde` ->

```tsx
import React, { ReactElement } from "react"

export default function $CFN(): ReactElement | null {
  return null
}
```

#### Forwarded Function Component Export

`ffce` ->

```tsx
import React, { forwardRef } from "react"

export interface $CFNProps {
  $TABSTOP
}

export const $CFN = forwardRef<HTML$TABSTOPElement, $CFN_Props>(function $CFN(
  props,
  ref
) {
  return <div ref={ref}></div>
})
```

#### Forwarded Function Component Default Export

`ffcde` ->

```tsx
import React, { forwardRef } from "react"

export interface $CFNProps {
  $TABSTOP
}

export default forwardRef<HTML$TABSTOPElement, $CFN_Props>(function $CFN(
  props,
  ref
) {
  return <div ref={ref}></div>
})
```

#### Component PropTypes

`cpt` ->

```ts
$CFN.propTypes = {
  $TABSTOP,
}
```

#### Component Default Props

`cdp` ->

```ts
$CFN.defaultProps = {
  $TABSTOP,
}
```

#### Component Default Props Typed

`cdpt` ->

```ts
const defaultProps: DefaultProps = {
  $TABSTOP,
}

$CFN.defaultProps = defaultProps
```

### React Lifecycle (Typescript)

#### Get Derived State from props

`gds` ->

```ts
static getDerivedStateFromProps(nextProps: $CFN_Props, prevState: $CFN_State) {
  return null
}
```

#### Get Derived state from Error

`gde` ->

```ts
static getDerivedStateFromError(error: Error) {
  return null
}
```

#### Component Did Mount

`cdm` ->

```ts
componentDidMount() {
  $TABSTOP
}
```

#### Should Component Update

`scu` ->

```ts
shouldComponentUpdate(nextProps: $CFN_Props, nextState: $CFN_State) {
  $TABSTOP
}
```

#### Get Snapshot Before Update

`gsbu` ->

```ts
getSnapshotBeforeUpdate(prevProps: $CFN_Props, prevState: $CFN_State) {
  $TABSTOP
}
```

#### Component Did Update

`cdu` ->

```ts
componentDidUpdate(prevProps: $CFN_Props, prevState: $CFN_State, $SNAPSHOT) {
  $TABSTOP
}
```

#### Component Did Catch

`cdc` ->

```ts
componentDidCatch(error: Error, info: ErrorInfo) {
  $TABSTOP
}
```

#### Component Will Unmount

`cwum` ->

```ts
componentWillUnmount() {
  $TABSTOP
}
```

### React Event Types (Typescript Only)

| Shortcut | Expands to                               |
| -------- | ---------------------------------------- |
| `me`     | `event: MouseEvent<HTMLButtonElement>`   |
| `te`     | `event: TouchEvent<HTMLButtonElement>`   |
| `ke`     | `event: KeyboardEvent<HTMLInputElement>` |
| `che`    | `event: ChangeEvent<HTMLInputElement>`   |
| `fe`     | `event: FocusEvent<HTMLElement>`         |
| `foe`    | `event: FormEvent<HTMLInputElement>`     |
| `meh`    | `MouseEventHandler<HTMLButtonElement>`   |
| `teh`    | `TouchEventHandler<HTMLButtonElement>`   |
| `keh`    | `KeyboardEventHandler<HTMLInputElement>` |
| `cheh`   | `ChangeEventHandler<HTMLInputElement>`   |
| `feh`    | `FocusEventHandler<HTMLInputElement>`    |
| `foeh`   | `FormEventHandler<HTMLElement>`          |

> Note: The `event:` and `Button`/`Input` parts are a tabstop which can be
> removed or changed.

### General Redux (Typescript)

#### mirrored const

`mc` ->

```ts
const $THING = "$THING"
```

#### useDispatch

`useDS` ->

```ts
const dispatch: $AppDispatch = useDispatch()
```

#### useAppDispatch (Typescript Only)

`useD` ->

```ts
const dispatch = useAppDispatch()
```

or inline:

`const dispatch = useD` ->

```ts
const dispatch = useAppDispatch()
```

#### useSelector

`useSL` ->

```ts
const $VALUE = useSelector(($STATE: AppState) => $SELECTOR)
```

or inline:

`const checked = useSL` ->

```ts
const checked = useSelector(($STATE: AppState) => $SELECTOR)
```

#### useAppSelector (Typescript Only)

`useAS` ->

```ts
const $VALUE = useAppSelector(($STATE) => $SELECTOR)
```

or inline:

`const checked = useAS` ->

```ts
const checked = useAppSelector(($STATE: AppState) => $SELECTOR)
```

#### Ref<E | null> (Typescript Only)

`reft` ->

```ts
export type $TABSTOP = Ref<$TABSTOP_Element | null>
```

or inline:

`export type SomeRef = reft` ->

```ts
export type SomeRef = Ref<$TABSTOP_Element | null>
```

#### MutableRefObject<E | null> (Typescript Only)

`mro` ->

```ts
export type $TABSTOP = MutableRefObject<$TABSTOP_Element | null>
```

or inline:

`export type SomeRef = mro` ->

```ts
export type SomeRef = MutableRefObject<$TABSTOP_Element | null>
```

#### RefCallback<E | null> (Typescript Only)

`refcb` ->

```ts
export type $TABSTOP = RefCallback<$TABSTOP_Element | null>
```

or inline:

`export type SomeRef = refcb` ->

```ts
export type SomeRef = RefCallback<$TABSTOP_Element | null>
```

### Redux Toolkit (Typescript)

#### createSlice

`cs` ->

```js
const { actions, reducer } = createSlice({
  name: "$CFN",
  initialState: $TABSTOP,
  reducers: {
    $TABSTOP,
  },
})
```

#### export createSlice

`ecs` ->

```js
import { createSlice } from "@reduxjs/toolkit"

const { actions, reducer } = createSlice({
  name: "$CFN",
  initialState: $TABSTOP,
  reducers: {
    $TABSTOP,
  },
})

export const { $TABSTOP } = actions

export default reducer
```

#### create prepare reducer

`cpr` ->

```js
$TABSTOP: {
	reducer(state, action: $PayloadAction<$TABSTOP>) {
		$$TABSTOP
	},
	prepare($TABSTOP) {
		return { payload: { $TABSTOP } }
	}
}
```

#### createAsyncThunk

`cat` ->

```ts
export const $TABSTOP = createAsyncThunk("$TABSTOP", async ($TABSTOP) => {
  $TABSTOP
})
```

or inline:

`export const doThing = cat` ->

```ts
export const doThing = createAsyncThunk("$TABSTOP", async ($TABSTOP) => {
  $TABSTOP
})
```

### Hooks and Effects (Typescript)

#### useState

`useS` ->

```ts
const [$STATE, set$STATE] = useState$TABSTOP($TABSTOP)
```

#### useEffect

`useE` ->

```ts
useEffect(() => {
  $TABSTOP
}, [$TABSTOP])
```

#### useEffect async

`useEA` ->

```js
useEffect(() => {
  let cancelled = false

  ;(async function $DOWORK(): Promise<$VOID> {
    // async work here
    $TABSTOP
    if (cancelled) {
      return
    }

    $TABSTOP
  })()

  return () => {
    cancelled = true
  }
}, [$TABSTOP])
```

#### useContext

`useC` ->

```ts
const context = useContext$TABSTOP($TABSTOP)
```

or inline:

`return useC` ->

```ts
return useContext$TABSTOP($TABSTOP)
```

#### useReducer

`useRed` ->

```ts
const [$STATE, $DISPATCH] = useReducer<typeof $REDUCER>($REDUCER, $NULL)
```

#### useReducer Untyped

`useRedUT` ->

```ts
const [$STATE, $DISPATCH] = useReducer($REDUCER, $NULL)
```

#### useCallback

`useCB` ->

<!-- prettier-ignore -->
```ts
const $CALLBACK = useCallback(($TABSTOP) => {
  $TABSTOP
}, [$TABSTOP])
```

#### useMemo

`useM` ->

<!-- prettier-ignore -->
```ts
const $MEMOIZED = useMemo(() => {
  $TABSTOP
}, [$TABSTOP])
```

#### useRef

`useR` ->

```ts
const $REF = useRef$TABSTOP(TABSTOP)
```

#### useImperitiveHandle

`useI` ->

<!-- prettier-ignore -->
```ts
useImperitiveHandle($REF, () => ({
  $TABSTOP,
}), [$TABSTOP])
```

#### useLayoutEffect

`useL` ->

```ts
useLayoutEffect(() => {
  $TABSTOP
}, [$TABSTOP])
```

#### useDebugValue

`useDV` ->

```ts
useDebugValue($NULL)
```

### General Built-Ins (Typescript)

#### reduce to type (Typescript Only)

`re` ->

> Normally would be something like `list.re ->`

```ts
reduce<$TABSTOP>(($RESULT, $VALUE) => {
  $TABEND

  return $RESULT
}, {})
// ^^ is a $TABSTOP
```

#### jsdoc comment

`/**` ->

```ts
/**
 * $TABEND
 */
```

### Importing

| Shortcut | Expands to                                    |
| -------- | --------------------------------------------- |
| `rc`     | `const packageName = require('package-name')` |
| `rcn`    | `const { nested } = require('package-name')`  |
| `imp`    | `import packageName from 'package-name'`      |
| `impf`   | `import File from './File'`                   |
| `impn`   | `import { nested } from 'package-or/path'`    |
| `impa`   | `import * as Thing from 'package-or/path'`    |
| `impp`   | `import './file'`                             |
| `icn`    | `import cn from 'classnames'`                 |
| `ism`    | `import styles from './$CFN.module.scss'`     |

### Exporting

| Shortcut | Expands to                                   |
| -------- | -------------------------------------------- |
| `exp`    | `export { default } from './CurrentFolder'`  |
| `expf`   | `export File from './File'`                  |
| `expn`   | `export { nested } from 'package-or/path`    |
| `expa`   | `export * from 'package-or/path'`            |
| `expd`   | `export { default as Thing } from './Thing'` |

### Logging

| Shortcut | Expands to                              |
| -------- | --------------------------------------- |
| `cl`     | `console.log($TABSTOP)`                 |
| `clv`    | `console.log('variable: ', variable)`   |
| `ce`     | `console.error($TABSTOP)`               |
| `cev`    | `console.error('variable: ', $TABSTOP)` |
| `cw`     | `console.warn($TABSTOP)`                |
| `cwv`    | `console.warn('variable: ', $TABSTOP)`  |
| `ct`     | `console.table($TABSTOP)`               |
| `cd`     | `console.debug($TABSTOP)`               |
| `cdv`    | `console.debug('variable: ', $TABSTOP)` |

### NODE_ENV

| Shortcut | Expands to                              |
| -------- | --------------------------------------- |
| `dev`    | `process.env.NODE_ENV !== "production"` |
| `prod`   | `process.env.NODE_ENV === "production"` |

### Tests (Javascript and Typescript)

#### React Test File

`rtf` ->

```tsx
import React from "react"
import { render } from "@testing-library/react"

import $CFN from "../$CFN"

describe("$CFN", () => {
  it("should $TABSTOP", () => {
    $TABSTOP
  })
})
```

> Note: typescript will do `import { $CFN } from "./$CFN"` since I prefer
> non-default exports in typescript

#### React Hooks Test File

`rhtf` ->

```tsx
import React from "react"
import { renderHook } from "@testing-library/react-hooks"

import $TABSTOP from "../$CFN"

describe("$CFN", () => {
  it("should $TABSTOP", () => {
    $TABSTOP
  })
})
```

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

`ait` ->

```ts
it("should $TABSTOP", async () => {
  $TABSTOP
})
```

#### Test todo

`todo` ->

```ts
it.todo("should $TABSTOP")
```

#### expect snapshot

`es` ->

```ts
expect($TABSTOP_container).toMatchSnapshot()
```

[react]: https://reactjs.org/
[ultisnips]: https://github.com/SirVer/ultisnips
[ultisnips folder]:
  https://github.com/mlaursen/vim-react-snippets/tree/master/UltiSnips
[vim-plug]: https://github.com/junegunn/vim-plug
[full .vimrc]: https://github.com/mlaursen/dotfiles/tree/master/.vimrc
