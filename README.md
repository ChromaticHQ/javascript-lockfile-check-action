# JavaScript Lockfile Check

This action checks that the correct lockfile is present at the root of a
project. It also checks that no extraneous lockfiles for other JavaScript
package managers are present. The intent is to enforce a given package manager
and avoid a scenario where more than one lockfile is present.

## Condiguration options

- **`package-manager` (required):** The name of the package manager your project uses. Possible values are: `npm` and `yarn`.

## Example usage

```
uses: actions/javascript-lockfile-check
with:
  package-manager: 'yarn'
```
