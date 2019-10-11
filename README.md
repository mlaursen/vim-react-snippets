# vim-react-snippets

A collection of common Javascript and Typescript vim snippets for developing
[React] applications. The snippets within this repo rely on [UltiSnips] as the
snippet provider.

## Javascript Example

![Javascript Example](https://user-images.githubusercontent.com/3920850/55372575-75010a80-54bf-11e9-97ce-3557ba3f044e.gif)

## Typescript Example

![Typescript Example](https://user-images.githubusercontent.com/3920850/55372579-79c5be80-54bf-11e9-92d3-3122879aaa61.gif)

## Hooks Example

![Hooks Example](https://user-images.githubusercontent.com/3920850/55372583-7c281880-54bf-11e9-94ab-c8fb1bba411b.gif)

## Table of Contents

<!-- toc -->

- [Installation](#installation)
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
    - [Function Component](#function-component)
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
    - [useContext](#usecontext)
    - [useReducer](#usereducer)
    - [useCallback](#usecallback)
    - [useMemo](#usememo)
    - [useRef](#useref)
    - [useImperitiveHandle](#useimperitivehandle)
    - [useLayoutEffect](#uselayouteffect)
    - [useDebugValue](#usedebugvalue)
    - [forwardRef](#forwardref)
  - [General Redux (Javascript)](#general-redux-javascript)
    - [@connect (annotation)](#connect-annotation)
    - [connect (function)](#connect-function)
    - [@connectAdvanced (annotation)](#connectadvanced-annotation)
    - [connectAdvanced (function)](#connectadvanced-function)
    - [bindActionCreators](#bindactioncreators)
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
    - [Simple Function Component Export](#simple-function-component-export-1)
    - [Function Component](#function-component-1)
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
  - [Hooks and Effects (Typescript)](#hooks-and-effects-typescript)
    - [useState](#usestate-1)
    - [useEffect](#useeffect-1)
    - [useContext](#usecontext-1)
    - [useReducer](#usereducer-1)
    - [useReducer Untyped](#usereducer-untyped)
    - [useCallback](#usecallback-1)
    - [useMemo](#usememo-1)
    - [useRef](#useref-1)
    - [useImperitiveHandle](#useimperitivehandle-1)
    - [useLayoutEffect](#uselayouteffect-1)
    - [useDebugValue](#usedebugvalue-1)
    - [forwardRef](#forwardref-1)
    - [Function Component Export](#function-component-export-2)
  - [Importing](#importing)
  - [Exporting](#exporting)
  - [Logging](#logging)
  - [Tests (Javascript and Typescript)](#tests-javascript-and-typescript)
    - [React Test File](#react-test-file)
    - [React Hooks Test File](#react-hooks-test-file)
    - [Describe a test](#describe-a-test)
    - [it should...](#it-should)
    - [Test todo](#test-todo)

<!-- tocstop -->

## Installation

I recommend using a package manager such as [minpac] or [vim-plug] to install
your vim packages.

```vim
" with minpac
function! PackInit() abort
  packadd minpac

  call minpac#init()
  call minpac#add('k-takata/minpac', {'type': 'opt'})

  call minpac#add('SirVer/ultisnips')
  call minpac#add('mlaursen/vim-react-snippets')
endfunction

" with vim-plug
call plug#begin('~/.vim/plugged')
Plug 'SirVer/ultisnips'
Plug 'mlaursen/vim-react-snippets'
call plug#end()
```

You can always see my [full .vimrc] for my Javascript/Typescript configuration
and setup.

## Cheatsheet

I will list the current supported snippets below and their implementation. I
recommend checking out the full source files in the [UltiSnips folder] to see
the full tabstop locations. The examples below will use `$TABSTOP` or `$NAME` to
indicate that there is a tabstop or a tabbable/replacable variable. Finally, if
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
import React, { Component } from "react";

export default class $CFN extends Component {
  constuctor(props) {
    super(props);

    this.state = {};
  }

  render() {
    return null;
  }
}
```

#### React Class Component

`rcc` ->

```jsx
class $CFN extends Component {
  render() {
    return null;
  }
}
```

#### React Class Constructor

`rcon` ->

```jsx
constructor(props) {
  super(props);

  this.state = {};
}
```

#### Static PropTypes

`sdp` ->

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
$TABSTOP = $TABSTOP => {
  $TABSTOP;
};
```

### Function Components (Javascript)

#### Function Component Export

`fce` ->

```jsx
import React from "react";

const $CFN = props => {
  return null;
};

export default $CFN;
```

#### Simple Function Component Export

`sfce` ->

```jsx
import React from "react";

const $CFN = () => {
  return null;
};

export default $CFN;
```

#### Function Component

`fc` ->

```jsx
const $TABSTOP = () => {
  return null;
};
```

#### Component PropTypes

`cpt` ->

```js
$CFN.propTypes = {
  $TABSTOP,
};
```

#### Component Default Props

`cdp` ->

```js
$CFN.defaultProps = {
  $TABSTOP,
};
```

### React Lifecycle (Javascript)

#### Get Derived State from props

`gds` ->

```js
static getDerivedStateFromProps(nextProps, prevState) {
  return null;
}
```

#### Get Derived state from Error

`gde` ->

```js
static getDerivedStateFromError(error) {
  return null;
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
const [$STATE, set$STATE] = useState($TABSTOP);
```

#### useEffect

`useE` ->

```js
useEffect(() => {
  $TABSTOP
}$TABSTOP);
```

#### useContext

`useC` ->

```js
const context = useContext($TABSTOP);
```

or inline:

`return useC` ->

```js
return useContext($TABSTOP);
```

#### useReducer

`useRed` ->

```js
const [$STATE, $DISPATCH] = useReducer($REDUCER, $NULL);
```

#### useCallback

`useCB` ->

<!-- prettier-ignore -->
```js
const $CALLBACK = useCallback(($TABSTOP) => {
  $TABSTOP
}, [$TABSTOP]);
```

#### useMemo

`useM` ->

<!-- prettier-ignore -->
```js
const $MEMOIZED = useMemo(() => {
  $TABSTOP
}, [$TABSTOP]);
```

#### useRef

`useR` ->

```js
const $REF = useRef($TABSTOP);
```

#### useImperitiveHandle

`useI` ->

<!-- prettier-ignore -->
```js
useImperitiveHandle($REF, () => ({
  $TABSTOP,
}), [$TABSTOP]);
```

#### useLayoutEffect

`useL` ->

```js
useLayoutEffect(() => {
  $TABSTOP;
});
```

#### useDebugValue

`useD` ->

```js
useDebugValue($NULL);
```

#### forwardRef

`fref` ->

```js
export default forwardRef((props, ref) => (
  <$CFN {...props} forwardedRef={ref} />
));
```

Or inline:

`export const Forwarded = fref` ->

```js
export const Forwarded = forwardRef((props, ref) => (
  <$CFN {...props} forwardedRef={ref} />
));
```

### General Redux (Javascript)

#### @connect (annotation)

`@c` ->

```js
@connect($STATE)
```

#### connect (function)

`cf` ->

```js
connect($STATE)($CFN);
```

#### @connectAdvanced (annotation)

`@ca` ->

```js
@connectAdvanced($DISPATCH => {
  $TABSTOP

  return ($STATE, $PROPS) => {
    $TABSTOP
    return {};
  };
})
```

#### connectAdvanced (function)

`ca` ->

```js
connectAdvanced($DISPATCH => {
  $TABSTOP;

  return ($STATE, $PROPS) => {
    $TABSTOP;
    return {};
  };
})($CFN);
```

#### bindActionCreators

`bac` ->

```js
const $ACTIONS = bindActionCreators({ $TABSTOP }, dispatch);
```

Or inline:

`const myActions = bac` ->

```js
const myActions = bindActionCreators({ $TABSTOP }, dispatch);
```

### Class Components (Typescript)

#### React Class Export

`rce` ->

```tsx
import React, { Component } from "react";

export default class $CFN extends Component {
  public render() {
    return null;
  }
}
```

#### React Class Export with Prop interface

`rcep` ->

```tsx
import React, { Component } from "react";

export interface $CFN_Props {}

export default class $CFN extends Component<$CFN_Props> {
  public render() {
    return null;
  }
}
```

#### React Class Export with Props and State

`rceps` ->

```tsx
import React, { Component } from "react";

export interface $CFN_Props {}

export interface $CFN_State {}

export default class $CFN extends Component<$CFN_Props, $CFN_State> {
  constructor(props: $CFN_Props) {
    super(props);

    this.state = {};
  }

  public render() {
    return null;
  }
}
```

#### React Class Component

`rcc` ->

```jsx
class $CFN extends Component {
  public render() {
    return null;
  }
}
```

#### React Class Constructor

`rcon` ->

```ts
constructor(props: $CFN_Props) {
  super(props);

  this.state = {};
}
```

#### Static PropTypes

`sdp` ->

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
$TABSTOP = $TABSTOP => {
  $TABSTOP;
};
```

### Function Components (Typescript)

#### Function Component Export

`fce` ->

```tsx
import React, { FC } from "react";

export interface $CFN_Props {}

const $CFN: FC<$CFN_Props> = props => {
  return null;
};

export default $CFN;
```

#### Simple Function Component Export

`sfce` ->

```tsx
import React, { FC } from "react";

const $CFN: FC = () => {
  return null;
};

export default $CFN;
```

#### Function Component

`fc` ->

```tsx
const $TABSTOP: FC = props => {
  return null;
};
```

#### Component PropTypes

`cpt` ->

```ts
$CFN.propTypes = {
  $TABSTOP,
};
```

#### Component Default Props

`cdp` ->

```ts
$CFN.defaultProps = {
  $TABSTOP,
};
```

#### Component Default Props Typed

`cdpt` ->

```ts
const defaultProps: DefaultProps = {
  $TABSTOP,
};

$CFN.defaultProps = defaultProps;
```

### React Lifecycle (Typescript)

#### Get Derived State from props

`gds` ->

```ts
static getDerivedStateFromProps(nextProps: $CFN_Props, prevState: $CFN_State) {
  return null;
}
```

#### Get Derived state from Error

`gde` ->

```ts
static getDerivedStateFromError(error: Error) {
  return null;
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

| Shortcut | Expands to                   |
| -------- | ---------------------------- |
| `r.me`   | `React.MouseEvent`           |
| `r.te`   | `React.TouchEvent`           |
| `r.ke`   | `React.KeyboardEvent`        |
| `r.ce`   | `React.ChangeEvent`          |
| `r.fe`   | `React.FormEvent`            |
| `r.fo`   | `React.FocusEvent`           |
| `r.meh`  | `React.MouseEventHandler`    |
| `r.teh`  | `React.TouchEventHandler`    |
| `r.keh`  | `React.KeyboardEventHandler` |
| `r.ceh`  | `React.ChangeEventHandler`   |
| `r.feh`  | `React.FormEventHandler`     |
| `r.foh`  | `React.FocusEventHandler`    |

### Hooks and Effects (Typescript)

#### useState

`useS` ->

```ts
const [$STATE, set$STATE] = useState$TABSTOP($TABSTOP);
```

#### useEffect

`useE` ->

```ts
useEffect(() => {
  $TABSTOP
}$TABSTOP);
```

#### useContext

`useC` ->

```ts
const context = useContext$TABSTOP($TABSTOP);
```

or inline:

`return useC` ->

```ts
return useContext$TABSTOP($TABSTOP);
```

#### useReducer

`useRed` ->

```ts
const [$STATE, $DISPATCH] = useReducer<typeof $REDUCER>($REDUCER, $NULL);
```

#### useReducer Untyped

`useRedUT` ->

```ts
const [$STATE, $DISPATCH] = useReducer($REDUCER, $NULL);
```

#### useCallback

`useCB` ->

<!-- prettier-ignore -->
```ts
const $CALLBACK = useCallback(($TABSTOP) => {
  $TABSTOP
}, [$TABSTOP]);
```

#### useMemo

`useM` ->

<!-- prettier-ignore -->
```ts
const $MEMOIZED = useMemo(() => {
  $TABSTOP
}, [$TABSTOP]);
```

#### useRef

`useR` ->

```ts
const $REF = useRef$TABSTOP(TABSTOP);
```

#### useImperitiveHandle

`useI` ->

<!-- prettier-ignore -->
```ts
useImperitiveHandle($REF, () => ({
  $TABSTOP,
}), [$TABSTOP]);
```

#### useLayoutEffect

`useL` ->

```ts
useLayoutEffect(() => {
  $TABSTOP;
});
```

#### useDebugValue

`useD` ->

```ts
useDebugValue($NULL);
```

#### forwardRef

`fref` ->

```ts
export default forwardRef<$TABSTOPElement, $CFN_Props>((props, ref) => (
  <$CFN {...props} forwardedRef={ref} />
));
```

Or inline:

`export const Forwarded = fref` ->

```ts
export const Forwarded = forwardRef<$TABSTOPElement, $CFN_Props>(
  (props, ref) => <$CFN {...props} forwardedRef={ref} />
);
```

#### Function Component Export

### Importing

| Shortcut | Expands to                                     |
| -------- | ---------------------------------------------- |
| `rc`     | `const packageName = require('package-name');` |
| `imp`    | `import packageName from 'package-name';`      |
| `impf`   | `import File from './File';`                   |
| `impn`   | `import { nested } from 'package-or/path';`    |
| `impa`   | `import * as Thing from 'package-or/path';`    |
| `impp`   | `import './file';`                             |
| `icn`    | `import cn from 'classnames';`                 |
| `ism`    | `import styles from './$CFN.module.scss';`     |

### Exporting

| Shortcut | Expands to                                    |
| -------- | --------------------------------------------- |
| `exp`    | `export { default } from './CurrentFolder';`  |
| `expf`   | `export File from './File';`                  |
| `expn`   | `export { nested } from 'package-or/path`     |
| `expa`   | `export * from 'package-or/path';`            |
| `expd`   | `export { default as Thing } from './Thing';` |

### Logging

| Shortcut | Expands to                            |
| -------- | ------------------------------------- |
| `cl`     | `console.log($TABSTOP)`               |
| `clv`    | `console.log('variable: ', variable)` |
| `ce`     | `console.error($TABSTOP)`             |
| `cw`     | `console.warrn($TABSTOP)`             |
| `ct`     | `console.table($TABSTOP)`             |

### Tests (Javascript and Typescript)

#### React Test File

`rtf` ->

```tsx
import React from "react";
import { cleanup, render } from "@testing-library/react";

import $CFN from "../$CFN";

afterEach(cleanup);

describe("$CFN", () => {
  it("should $TABSTOP", () => {
    $TABSTOP;
  });
});
```

#### React Hooks Test File

`rhtf` ->

```tsx
import React from "react";
import { cleanup } from "@testing-library/react";
import { renderHook } from "@testing-library/react-hooks";

import $TABSTOP from "../$CFN";

afterEach(cleanup);

describe("$CFN", () => {
  it("should $TABSTOP", () => {
    $TABSTOP;
  });
});
```

#### Describe a test

`desc` ->

```ts
describe('$CFN', () => {
  it('should $TABSTOP', () => {
    $TABSTOP
  )};
});
```

#### it should...

`it` ->

```ts
it("should $TABSTOP", () => {
  $TABSTOP;
});
```

#### Test todo

`todo` ->

```ts
it.todo("should $TABSTOP");
```

[react]: https://reactjs.org/
[ultisnips]: https://github.com/SirVer/ultisnips
[ultisnips folder]:
  https://github.com/mlaursen/vim-react-snippets/tree/master/UltiSnips
[minpac]: https://github.com/k-takata/minpac
[vim-plug]: https://github.com/junegunn/vim-plug
[full .vimrc]: https://github.com/mlaursen/dotfiles/tree/master/.vimrc
