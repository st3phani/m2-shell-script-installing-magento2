# m2-shell-script-installing-magento2

#### The command for your helper of this script is:
```
sh m2_install.sh -h
```

```
sh m2_install.sh --help
```
<br/>
Result:

```
options:
-h, --help                                Show brief help
-r, --run-instalation=DIR                 Run Instalation
-rs, --run-instalation-sampledata=DIR     Run instalation with sampledata
```

#### The command to installing Magento 2 without sample data is:
```
sh m2_install.sh -r
```
```
sh m2_install.sh --run-instalation
```

#### The command to installing Magento 2 with sample data is:
```
sh m2_install.sh -rs
```
```
sh m2_install.sh --run-instalation-sampledata
```

#### For create alias of script, view example:
```
alias m2i="/your/sh/file/path/file.sh"
```

<br/>
After created alias of script, you can run next commands:

With sampledata:

```
m2i -rs
```
```
m2i --run-instalation-sampledata
```
<br/>

Without sampledata:

```
m2i -r
```
```
m2i --run-instalation
```