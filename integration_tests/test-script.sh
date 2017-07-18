echo "Hello Philmod"

ls

# Check the flags.
container-builder-local --version || exit
container-builder-local --help || exit
container-builder-local && exit # no source
container-builder-local . --config cloudbuild.yaml && exit # flags after source
container-builder-local --config donotexist.yaml && exit # unexisting config file
container-builder-local --config cloudbuild.yaml . || exit # happy dryrun case

# Full test
container-builder-local --config cloudbuild.yaml --dryrun=false .
