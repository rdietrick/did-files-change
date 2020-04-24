# did-files-change

Action which outputs a value that indicates whether specific resources changed in a commit.

## Why?

Because you may want to conditionally execute steps in a workflow only if certain files were changed.

## How?

Call this step in a job to check whether certain files were changed.

You will then be able to check the status in subsequent steps, by checking if `changed` is equal to `1`.

The value will be 0 if the files matched by the `pathspec` input parameter were not changed.

## Example

```yaml
name: My Workflow
on: push
      
jobs:
  build:
    runs-on: ubuntu-latest
    steps:
      - name: Checkout
        # Checkout is required before did-files-change
        uses: actions/checkout@v2
        with:
          fetch-depth: 0
          # be sure to override the default value (1) for fetch-depth
      
      - name: Check changes
        id: check-changes
        uses: rdietrick/did-files-change@test-workflow
        with:
          pathspec: test

      - name: Debug
        run: |
          echo "Changes detected in test directory: ${{ steps.check-changes.outputs.changed }}"
```

In the example above, `steps.check-changes.outputs.changed` will be set
to 1 if the current commit included any files under the `test` directory in the repo.

