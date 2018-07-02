# vim-react-snippets
Useful snippets for developing in react and flux. Also a place for me to list which vim plugins I think are useful to use in unison.

Currently the snippets are only developed for [UltiSnips](https://github.com/SirVer/ultisnips)

The idea for these snippets came from [vim-react-snippets](https://github.com/justinj/vim-react-snippets).
I ended up using most of his snippets and then create a few more for the PropTypes and using es6.

## Examples
```javascript
/* MyComponent.jsx */
rce<tab>
```
expands to
```javascript
/* MyComponent.jsx */

import React, { Component, PropTypes } from 'react';
import PureRenderMixin from 'react-addons-pure-render-mixin';

export default class MyComponent extends Component {
	constructor(props) {
		super(props);

		this.shouldComponentUpdate = PureRenderMixin.shouldComponentUpdate.bind(this);
	}

	static propTypes = {
		className: PropTypes.string,
		children: PropTypes.node,
	};

	render() {
		return (
			<div />
		);
	}
}
```
Where you can tab through and change the `MyComponent`, add more class properties, and then update the render function.

`r.cce<tab>` will generate the same code as above but as `const MyComponent = React.createClass({ ... });`

See [javascript.snippets](../master/UltiSnips/javascript.snippets) for all snippets.

### Cheatsheet
#### PropTypes
| Shortcut | Expands To                            |
| -------- | ----------                            |
| pt.a     | React.PropTypes.array                 |
| pt.ar    | React.PropTypes.array.isRequired      |
| pt.b     | React.PropTypes.bool                  |
| pt.br    | React.PropTypes.bool.isRequired       |
| pt.f     | React.PropTypes.func                  |
| pt.fr    | React.PropTypes.func.isRequired       |
| pt.nu    | React.PropTypes.number                |
| pt.nur   | React.PropTypes.number.isRequired     |
| pt.o     | React.PropTypes.object                |
| pt.or    | React.PropTypes.object.isRequired     |
| pt.s     | React.PropTypes.string                |
| pt.sr    | React.PropTypes.string.isRequired     |
| pt.no    | React.PropTypes.node                  |
| pt.nor   | React.PropTypes.node.isRequired       |
| pt.e     | React.PropTypes.element               |
| pt.er    | React.PropTypes.element.isRequired    |
| pt.ao    | React.PropTypes.arrayOf               |
| pt.aor   | React.PropTypes.arrayOf.isRequired    |
| pt.io    | React.PropTypes.instanceOf            |
| pt.ior   | React.PropTypes.instanceOf.isRequired |
| pt.oo    | React.PropTypes.objectOf              |
| pt.oor   | React.PropTypes.objectOf.isRequired   |
| pt.sh    | React.PropTypes.shape                 |
| pt.shr   | React.PropTypes.shape.isRequired      |


## Installation
### Example .vimrc
You can check out my [.vimrc](https://github.com/mlaursen/dotfiles/blob/macbook/.vimrc) for other plugins and stuff.

