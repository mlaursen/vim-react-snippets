# vim-react-snippets
Useful snippets for developing in react and flux. Also a place for me to list which vim plugins I think are useful to use in unison.

Currently the snippets are only developed for [UltiSnips](https://github.com/SirVer/ultisnips)

The idea for these snippets came from [vim-react-snippets](https://github.com/justinj/vim-react-snippets).
I ended up using most of his snippets and then create a few more for the PropTypes and some fluxification.

## Examples
```javascript
rce<tab>
```
expands to
```javascript
var ClassName = React.createClass({
  
  render: function() {
    return (
      <div />
    );
  }
});

module.exports = ClassName;
```
Where you can tab through and change the `ClassName`, add more class properties, and then update the render funciton.

`rc<tab>` will generate the same code as above without the module.exports.

```javascript
rv<tab>
```
expands to
```javascript
var = require('./');
```
When you start type the variable name, it will also set it as the requiring. You can tab and change the `./` and then tab again to change the required file

#### Properties
A few examples with the react properties.
```javascript
optionalString: pt.s<tab>
```
expands to
```javascript
optionlaString: React.PropTypes.string
```

Another example:
```javascript
requiredObjectOfString: pt.oo<tab>
```
expands to
```javascript
requiredObjectOfString: React.PropTypes.objectOf(React.PropTypes.string).isRequired
```
Where the React.PropTypes.String is now replacable

View the `UltiSnips/javascripts.vim` for all the available snippets.

## Installation
#### vundle
If you have never used [Vundle](https://github.com/gmarik/Vundle.vim), here are the simple steps to use.

1. Install Vundle

   `$ git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim`

2. Configure your `.vimrc`

   ````
   set nocompatible
   filetype off
   set rtp+=~/.vim/bundle/vundle
   call vundle#rc()
   Plugin 'gmarik/vundle' " required
   
   " UltiSnips
   Plugin 'SirVer/ultisnips'
   
   Plugin 'mlaursen/vim-react-snippets'
   
   call vundle#end()           " required
   filetype flugin indent on   " required
   " The rest of your .vimrc config
   ```

3. Save an then run `:PluginInstall` which will automatically clone each repo into `~/.vim/bundle`.
4. Once it has finished, restart vim and your plugins will be ready to use.

#### pathogen
If you have never used [pathogen](https://github.com/tpope/vim-pathogen), here are the simple steps to use.

1. Install pathogen (taken directly from the github page)

  ```
  mkdir -p ~/.vim/autoload ~/.vim/bundle && \
  curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim
  ```
2. Update your `.vimrc`

   ```
   execute pathogen#infect()
   ```

3. Clone each plugin into your `~./vim/bundle` directory

   ```
   git clone https://github.com/SirVer/ultisnips ~/.vim/bundle/ultisnips
   git clone https://github.com/mlaursen/vim-react-snippets ~/.vim/bundle/vim-react-snippets
   ```

4. And you should be good to go.

## Recommended Configurations and additional plugins
#### Plugins
* [Vundle](https://github.com/gmarik/Vundle.vim) - vim plugin manager
* [Command-T](https://github.com/wincent/command-t) - Awesome file manager. (Requires vim with ruby support)
* [NERD Tree](https://github.com/scrooloose/nerdtree) - File Browser
* [NERD Tree with Git](https://github.com/Xuyuanp/nerdtree-git-plugin) - Plugin for NERDTree for Git.. (kind of obvious, right?)
* [vim-fugitive](https://github.com/tpope/vim-fugitive) - Git VIM Plugin
* [vim-surround](https://github.com/tpope/vim-surround) - Neat surrounder stuff.
* [supertab](https://github.com/ervandew/supertab) - Helps with ultisnips and YouCompleteMe working together
* [ultisnips](https://github.com/SirVer/ultisnips) - The awesome snippets
* [vim-javascript](https://github.com/pangloss/vim-javascript) - Javascript syntax highlighting and stuffs
* [vim-jsx](https://github.com/mxw/vim-jsx) - JSX syntax helper with indentation and stuffs
* [YouCompleteMe](https://github.com/Valloric/YouCompleteMe) - Freaking dope auto completer.

#### Copy/Paste Plugins for .vimrc
```
Plugin 'wincent/command-t'
Plugin 'scrooloose/nerdtree'
Plugin 'Xuyuanp/nerdtree-git-plugin'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-surround'

Plugin 'ervandew/supertab'             " helps if using ultisnips and YouCompleteMe
Plugin 'SirVer/ultisnips'

" Existing snippets from other sources. Optional
Plugin 'honza/vim-snippets'

" React plugins and snippets
Plugin 'pangloss/vim-javascript'
Plugin 'mxw/vim-jsx'
Plugin 'mlaursen/vim-react-snippets'

" Completion menu
Plugin 'Valloric/YouCompleteMe'         " requires python and a build after install
```

These plugins will require..
*libgmp, cmake libgcc*


> To install vim with extra support..
```bash
hg clone https://vim.googlecode.com/hg/ vim
cd vm
./configure --enable-rby-interp --enable-perlinterp --enable-pythoninterp --enable-gui=no --enable-multibyte
make && make install
```

> To install YouCompleteMe [Cygwin Fix](https://github.com/Valloric/YouCompleteMe/issues/684#issuecomment-34119853)
```bash
cd ~/.vim/bundle/YouCompleteMe
./install.sh
```

> To Install Command-T
```bash
cd ~/.vim/bundle/command-t/ruby/command-t
ruby extconf.rb
make
```


#### Configuration
```
" Ignore libs, and builds for Command-T
let g:CommandTWildIgnore=&wildignore . ",**/bower_components/*,**/node_modules/*,**/lib/*,**/target/*,**/dist/*,**/build/*"
let g:CommandTTraverseSCM="pwd"  " gets files from current directory instead of searching for .git folder

" Make YCM compatible with UltiSnips (with supertab)
let g:ycm_key_list_select_completion=['<C-n>', '<Down>']
let g:ycm_key_list_previous_completion=['<C-p>', '<Up>']
let g:SuperTabDefaultCompletionType='<C-n>'

" update key bindings for UltiSnips
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsListSnippets="<c-h>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"
let g:UltiSnipsEditSplit="vertical"
```

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
