# ostype

[![Software License][ico-license]](LICENSE.md)
[![Build Status][ico-travis]][link-travis]

This module tells you wheter you run on unix or windows 

## Why
If you want to extend Terraform using `null_ressource` or `data external` you need to know wheter to run a `.sh` or a `.bat` file. This allows you to create cross-platform modules without dependecies.

## Usage

```hcl
module "os" {
  source = "github.com/octocraft/terraform-local-ostype"
}
```

### Outputs

#### type
`${module.os.type}` returns `unix` on Unix and `windows` on Windows.

```hcl
output "type" {
  value = "${module.os.type}"
}
```
return
```
type = windows|unix
```

## Notes

This module abuses the file system to tell you on which platform it runs. It check if it is possible to use a backslash in a filenme (unix) or not (windows).

### Known Limitations

This module does not work if you run it from Linux Bash Shell on Windows file system (e.g. /mnt/c/foo/bar/). It fails with message "error: unable to create file conf/ext\ext". 

## License

MIT


[link-travis]: https://travis-ci.org/octocraft/terraform-local-ostype

[ico-license]: https://img.shields.io/badge/license-MIT-brightgreen.svg?style=flat-square
[ico-travis]: https://img.shields.io/travis/octocraft/terraform-local-ostype/master.svg?style=flat-square
