## Export

In UTF-16

```
scoop export > .config/scoop/scoopfile.json
```

In UTF-8 (recommended)

```
scoop export | Out-File -Encoding utf8 .config/scoop/scoopfile.json
```

## Import

```
scoop import .config/scoop/scoopfile.json
```

## Todo

Automate this with an install script
