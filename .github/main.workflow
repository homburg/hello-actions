workflow "Build and deploy on push" {
  on = "push"
  resolves = ["Yarn install"]
}

action "Yarn install" {
  uses = "nuxt/actions-yarn@master"
  args = "install"
}
