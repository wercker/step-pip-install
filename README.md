# pip-install

Install the requirements defined in `requirements.txt`. This step will fail if
this file could not be found.

It will use the wercker cache to speed up future builds. Wheel support only
works if the environment variable `PIP_USE_WHEEL` is set to true. The pip wheel
command also has additional requirement. The latest python box meets those
requirements when the virtualenv step is also used.

## Options
* `requirements_file` (optional, default=requirements.txt). The
`requirements.txt` file to use. Set to empty if no requirements file is used.
* `packages_list` (optional, default=""). List of packages to install (usefull
for installing packages outside of requirements.txt). The property can contain
more than one package, specified as a single string seperated by spaces.
* `pip_command` (optional, default="pip"). Can be used to switch to python 3
specific pip on Ubuntu: pip-3.2.
* `auto_run_wheel` (optional, default=true). If the `PIP_USE_WHEEL` environment
variable is set to true. The pip install step will also run `pip wheel` before
running pip install. Settings `auto_run_wheel` to false will disable this
behavior.
* `cleanup_wheel_dir` (optional, default=false). If the `PIP_WHEEL_DIR`
environment variable is set. Settings this property to true, will clenaup the
wheel dir (before running). This may be needed after updates to the box, or
when packages are updated without changing version numbers. If the wheel dir is
specified through a pip.ini this option will fail, only `PIP_WHEEL_DIR` is
supported.

## Example

Basic usage:
```
    - pip-install
```

If your requirements file is not named `requirements.txt`, but dev-requirements.txt:

```
    - pip-install:
        requirements_file: "dev-requirements.txt"
```

If you want to install a package besides the ones specified in the
requirements.txt file:

```
    - pip-install:
        packages_list: "mock httpretty"
```

Only install the mock and httpretty packages
```
    - pip-install:
        requirements_file: ""
        packages_list: "mock httpretty"
```

To disable the automatic execution of wheel, use:
```
    - pip-install:
        auto_run_wheel: false
```

To run pip install, but with a clean up of the PIP_WHEEL_DIR:

```
    - pip-install:
        cleanup_wheel_dir: true
```

# License

The MIT License (MIT)

Copyright (c) 2013 wercker

Permission is hereby granted, free of charge, to any person obtaining a copy of
this software and associated documentation files (the "Software"), to deal in
the Software without restriction, including without limitation the rights to
use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of
the Software, and to permit persons to whom the Software is furnished to do so,
subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS
FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR
COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER
IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN
CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

# Changelog

## 0.0.5
- `pip_command` option added

## 0.0.4

- `cleanup_wheel_dir` support added
- `requirements_file` support added
- `packages_list` option added

## 0.0.3

- `auto_run_wheel` property added
- `pip wheel` behavior added (if `$PIP_USE_WHEEL` is set to true )

## 0.0.1
- initial release
