workflow "Build and deploy on push" {
  on = "push"
  resolves = ["Yarn install"]
}

action "Yarn install" {
  uses = "nuxt/actions-yarn@master"
  args = "install"
}

workflow "Label monorepo on PR" {
  on = "pull_request"
  resolves = ["Label PR Monorepos"]
}

action "Label PR Monorepos" {
  uses = "adamzolyak/monorepo-pr-labeler-action@master"
  secrets = ["GITHUB_TOKEN"]
  env = {
    BASE_DIRS = "packages"
  }
}
