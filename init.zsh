# shellcheck shell=bash
######################################################################
#<
#
# Function: p6df::modules::cdktf::deps()
#
#>
######################################################################
p6df::modules::cdktf::deps() {
  ModuleDeps=(
    p6m7g8-dotfiles/p6df-terraform
    hashicorp/terraform-cdk
  )
}

######################################################################
#<
#
# Function: p6df::modules::cdktf::langs()
#
#>
######################################################################
p6df::modules::cdktf::langs() {

  p6_js_npm_global_install "cdktf-cli"

  p6_return_void
}

######################################################################
#<
#
# Function: p6df::modules::cdktf::home::symlink()
#
#  Environment:	 P6_DFZ_SRC_P6M7G8_DOTFILES_DIR
#>
######################################################################
p6df::modules::cdktf::home::symlink() {

  p6_file_symlink "$P6_DFZ_SRC_P6M7G8_DOTFILES_DIR/p6df-cdktf/share/.cdktf" ".cdktf"

  p6_return_void
}

######################################################################
#<
#
# Function: p6df::modules::cdktf::clones()
#
#  Environment:	 P6_DFZ_SRC_P6M7G8_DOTFILES_DIR
#>
######################################################################
p6df::modules::cdktf::clones() {

  p6_run_parallel "0" "4" "$(cat $P6_DFZ_SRC_P6M7G8_DOTFILES_DIR/p6df-cdktf/conf/cdktf)" "p6_github_gh_clone" "$P6_DFZ_SRC_FOCUSED_DIR"

  p6_return_void
}
