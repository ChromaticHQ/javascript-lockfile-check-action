# JavaScript Lockfile Check

This action checks that the correct lockfile is present at the root of a
project. It also checks that no extraneous lockfiles for other JavaScript
package managers are present. The intent is to enforce a given package manager
and avoid a scenario where more than one lockfile is present.

## Condiguration options

- **`package-manager` (required):** The name of the package manager your
  project uses. Possible values are:
  - `npm`: Ensure that a `package-lock.json` file is present and that no
    `yarn.lock` file is present.
  - `yarn`: Ensure that a `yarn.lock` file is present and that no
    `package-lock.json` file is present.

## Example usage

The following example presumes you’re using Yarn:

```yaml
on: push
jobs:
  check_js_lockfile:
    runs-on: ubuntu-latest
    name: Check JS Lockfile
    steps:
      - name: Checkout
        uses: actions/checkout@v2
      - name: Check JS Lockfile
        uses: actions/javascript-lockfile-check@v1.0.0
        with:
          package-manager: yarn
```
