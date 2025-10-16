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

  p6_run_parallel "0" "4" "$(cat $P6_DFZ_SRC_P6M7G8_DOTFILES_DIR/p6df-cdktf/conf/cdktf)" "p6_github_cli_clone" "$P6_DFZ_SRC_FOCUSED_DIR"

  p6_return_void
}

######################################################################
#<
#
# Function: str str = p6df::modules::cdktf::prompt::line()
#
#  Returns:
#	str - str
#
#  Environment:	 TERRAFORM_BINARY_NAME
#>
######################################################################
p6df::modules::cdktf::prompt::line() {

    local str
    if p6_file_exists "cdktf.json"; then
      local ver=$(p6_terraform_version)
      local workspace=$(p6df::modules::terraform::cli::workspace::show)
      local tfvar_file=$(p6df::modules::terraform::util::tfvar::file)
      str="cdktf:\t\t  bin=[$TERRAFORM_BINARY_NAME] $ver $workspace | $tfvar_file"
    fi
    p6_return_str "$str"
}
