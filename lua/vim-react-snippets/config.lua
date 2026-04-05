return {
  --- Set to `false` if all props should no longer be wrapped in
  --- `Readonly<T>`.
  --- @type boolean
  readonly_props = true,

  --- @type string The test framework for the react test snippets. Can be set
  --- to `"vitest"`
  test_framework = "@jest/globals",

  --- The import path for `import { render, screen, userEvent }`.
  --- If you use a custom test renderer, set it to this config option.
  --- i.e. `"@/test-utils.js"`
  --- @type string
  test_renderer_path = "@testing-library/react",
}
