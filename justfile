build-all:
  #!/usr/bin/env fish
  for in_d in ./markdown/*
    # Output directory, simply replaces 'markdown' with 'pdf'
    set out_d "./pdf/$(path basename $in_d)"
    mkdir -p -- $out_d

    # Information about current processing directory
    printf "\n%s\n%20s\n%s\n" \
      (string repeat -n20 -) \
      (path basename $in_d) \
      (string repeat -n20 -)

    # Inside loop processing all markdown files
    for in_f in $in_d/*.md
      set out_f $out_d/(path basename $in_f | path change-extension pdf)

      pandoc -i $in_f -o $out_f \
        --resource-path $in_d &

      printf "  %-30s --> %-30s\n" $in_f $out_f
    end

    # Wait for all conversion jobs to finish
    wait
  end

edit file:
  #!/usr/bin/env fish
  set ext (path extension {{file}})
  set base_path "$(path resolve .)/source"
  set target_path (path resolve -- '{{file}}')

  printf "%s\n" $ext
  printf "%s\n" $target_path
  printf "%s\n" $base_path
  if string match -q -r "^$base_path/[^/]+/[^/]+\$" $target_path && \
     test \( $ext = ".jpg" -o $ext = ".jpeg" -o $ext = ".png" \) -a \
          -f $target_path
  else
    printf "Expected existing .png/.jpg/.jpeg file in one of source\
    subdirectories (e.g. ./source/AiSD/egz1_01.jpeg)\n"
    return
  end

  set target_markdown_path \
    ( string replace -r '/source/([^/]+/[^/]+)$' '/markdown/$1' $target_path \
    | path change-extension md)
  printf "%s\n" $target_markdown_path
  mkdir -p -- (path dirname -- $target_markdown_path)

  if test ! -f $target_markdown_path
    begin
      printf "---\n"
      cat ./default_metadata.yaml
      printf "---\n"

    end >> $target_markdown_path
  end

  $EDITOR $target_markdown_path

## Edit target that given an .jpg/.jpeg/.png image opens respective .md file in
## $EDITOR
## If opened .md does not exist it contains default yaml header?

## Openai target that given .jpg/.jpeg/.png, sends a request to OpenAI gpt-4o
## mini and writes result to source and then open the markdown file in $EDITOR
##
## Target reads token from $OPENAI_API_TOKEN or something
