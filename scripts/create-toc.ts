import { readFile, writeFile } from "node:fs/promises";
import { format } from "prettier";
import toc from "markdown-toc";
import { join } from "node:path";

const root = process.cwd();
const README = join(root, "README.md");

const original = await readFile(README, "utf8");

console.log("Updating table of contents in README.md");
const updated = await format(toc.insert(original), {
  parser: "markdown",
  semi: false,
  trailingComma: "none",
});
const removedEmojisFromLinks = updated.replace(/%E2%9C%A8/g, "");

await writeFile(README, removedEmojisFromLinks);
console.log("Updated!");
