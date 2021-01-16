# JavaScript Lockfile Check

![Tests](https://github.com/ChromaticHQ/javascript-lockfile-check-action/workflows/Tests/badge.svg) ![Linting & Checks](https://github.com/ChromaticHQ/javascript-lockfile-check-action/workflows/Linting%20&%20Checks/badge.svg)

This action checks that the correct lockfile is present at the root of a
project. It also checks that no extraneous lockfiles for other JavaScript
package managers are present. The intent is to enforce a given package manager
and avoid a scenario where more than one lockfile is present.

## Configuration options

- **`package-manager` (required):** The name of the package manager your
  project uses. Possible values are:
  - `npm`: Ensure that a `package-lock.json` file is present and that no
    `yarn.lock` file is present.
  - `yarn`: Ensure that a `yarn.lock` file is present and that no
    `package-lock.json` file is present.
- **`working-directory` (optional):** The path to the directory where the
  lockfile check should occur, relative from the project root. e.g.
  `web/themes/custom/my-custom-theme`

## Usage

To use this action, simply add a step to your workflow, like so:

```yaml
- uses: ChromaticHQ/javascript-lockfile-check-action@v1.1.0
  with:
    package-manager: npm
```

Here’s an example workflow that checks out your repo and checks that you have
the correct lockfile for Yarn within a custom theme for a Drupal project:

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
        uses: ChromaticHQ/javascript-lockfile-check-action@v1.1.0
        with:
          package-manager: yarn
          working-directory: web/themes/custom/my-custom-theme
```
