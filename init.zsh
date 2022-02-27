
######################################################################
#<
#
# Function: p6df::modules::cfktf::deps()
#
#>
######################################################################
p6df::modules::cdktf::deps() {
  ModuleDeps=(
    p6m7g8/p6df-awscdk
    p6m7g8/p6df-terraform
    hashicorp/terraform-cdk
  )
}

######################################################################
#<
#
# Function: p6df::modules::cfktf::langs()
#
#>
######################################################################
p6df::modules::cdktf::langs() {

  npm install -g cdktf-cli@next
}

p6df::modules::cdktf::clones() {

  p6_run_parallel "0" "4" "$(cat $P6_DFZ_SRC_P6M7G8_DIR/p6df-cdktf/conf/cdktf)" "p6_github_util_repo_clone_or_pull_no_ou" "$P6_DFZ_SRC_FOCUSED_DIR"
}

