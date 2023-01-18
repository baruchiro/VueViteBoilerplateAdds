#!/bin/zsh
optionsArr=("TypeScript" "JSX" "Vue Router" "Pinia" "Vitest" "Playwright" "Eslint" "Prettier")
selected_options=()

for option in "${optionsArr[@]}"
do
  selected_options+=($option)
  echo "Selecting options: ${selected_options[@]}"
  find -not -path "./.git/*" -not -name ".git" -delete
  npm init vue@latest
  mv vue-project/*(DN) .
  git add .
  git commit -m "add $option"
  echo "Press enter to continue"
  read
done
options_string=$(IFS="-" ; echo "${selected_options[*]}" | tr ' ' '-')
git tag $options_string
git push origin --tags
