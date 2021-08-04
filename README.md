Display Table Summary
=====================

This plugin provides a very thin wrapper around Postgres' psql `\d` command to
view the details of a database table.

Usage
-----

This plugin exposes a single command, `DisplayTableSummary`, which you can run
while viewing a Rails model file. It will then display a Vim popup window with
the output of running `\d <table_name>`.

If you'd like to map the command to a given key binding, you can do something
like the following in your `~/.vimrc`:

``` vim
nnoremap <leader>dt :DisplayTableSummary<cr>
```

Installation
------------

*Note* This plugin requires Vim version 8.2+ as it makes use of the `popup`
windows that were added in that version. This plugin does not currently support
Neovim.

If you don't have a preferred installation method, I recommend using [VimPlug](https://github.com/junegunn/vim-plug).
Assuming you have vim-plug installed and configured, the following steps will
install the plugin:

Add the following line to your `~/.vimrc` file

``` vim
Plug 'christoomey/display-table-summary'
```

Then run

```
:PlugInstall
```

If you are using Vim 8+ and don't want to use an additional package manage, you
can simply clone this repository inside `~/.vim/pack/plugin/start/` directory
and restart Vim.

```
git clone git@github.com:christoomey/display-table-summary.git ~/.vim/pack/plugins/start/display-table-summary
```

Database Name
-------------

The plugin has three approaches to determine the database name:

1. You can directly specify it in your vimrc, e.g. `let
   g:display_table_database_name = 'my_db_name'`. This option will supersede
   others, but is intended as a fallback.
2. If [`yq`](https://github.com/mikefarah/yq) is installed, it will use that to
   parse the `config/database.yml` to read the development database name.L
3. It will try to infer the DB name based on the directory name.
