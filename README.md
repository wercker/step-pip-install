# pip-install

Install the requirements defined in `requirements.txt`. This step will fail if this file could not be found.

It will use the wercker cache to speed up future builds.

## Options

* `auto_run_wheel` (optional, default=true). If the `PIP_USE_WHEEL` environment variable is set to
`true`. The pip install step will also run `pip wheel` before running `pip install`. Settings
`auto_run_wheel` to false will disable this behavior.

## Example

    - pip-install

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

## 0.0.2

- `auto_run_wheel` property added
- `pip wheel` behavior added (if `$PIP_USE_WHEEL` is set to true )

## 0.0.1
- initial release