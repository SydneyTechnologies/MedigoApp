# Git Commit Syntax and Types

## Commit Syntax

When working with Git, it is important to create meaningful and informative commit messages. The following is the recommended syntax for a commit message:

```
<type>[optional scope]: <description>

[optional body]

[optional footer(s)]
```

**type**: This field describes the type of the commit. It should be one of the commit types listed below.
**scope**: This field is optional and should describe the part of the codebase that the commit affects.
**description**: This field should be a brief summary of the changes made in the commit.
**body**: This field is optional and can be used to provide additional context or information about the commit.
**footer(s)**: This field is optional and can be used to provide additional information, such as references to issues or pull requests.

### Example Commit

```
fix: fix foo to enable bar

This fixes the broken behavior of the component by doing xyz.

BREAKING CHANGE
Before this fix foo wasn't enabled at all, behavior changes from <old> to <new>
Closes D2IQ-12345
```

In this example, the commit type is "fix" and the scope is omitted. The description is "fix foo to enable bar", and the body provides additional information about the changes made in the commit. The footer includes a breaking change notice and a reference to a related issue.

### Commit Types

The following is a list of commit types that can be used in a commit message:

1. **feat**: A new feature has been added to the codebase.
2. **fix**: A bug or issue has been fixed.
3. **chore**: Changes have been made that do not relate to a fix or feature and don't modify src or test files (for example updating dependencies).
4. **refactor**: The code has been refactored to improve its structure, readability, or performance, but neither fixes a bug nor adds a feature.
5. **docs**: Updates have been made to documentation, such as the README or other markdown files.
6. **style**: Changes have been made that do not affect the meaning of the code, such as formatting, indentation, or white-space.
7. **test**: New tests have been added or previous tests have been corrected.
8. **perf**: Performance improvements have been made.
9. **ci**: Changes are related to continuous integration.
10. **build**: Changes that affect the build system or external dependencies.
11. **revert**: A previous commit has been reverted.

By following a consistent and descriptive commit message syntax, it becomes easier to understand the history of changes in a codebase and to collaborate with other developers.
