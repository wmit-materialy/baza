#!/usr/bin/env fish
echo > index.toml

mkdir src
mkdir md

for d in (fd . -td source/ --exact-depth 1)
    set subj (path basename $d)
    for f in (fd -tf . $d)
        set bname (path basename $f)
        set assignment_type $(path change-extension '' $bname | string split _)[1]
        set ext (path extension $f)
        set uuid (uuidgen)

        # printf "%s\n" $bname
        # printf "%s\n" $assignment_type

        printf '[[assignment]]\nfile = "%s"\ntype = "%s"\nsubject = "%s"\nkierunek = "IAD"\n\n' \
            "$uuid$ext" $assignment_type $subj >> index.toml

        set fmd ( string replace -r "^source/" "markdown/" -- $f \
                | path change-extension '.md')
        cp -- $f "src/$uuid$ext"
        # printf "%s\n" $fmd
        if test -f $fmd
            # printf "%s exists\n" $fmd
            cp -- $fmd "md/$uuid.md"
        end
        # break

    end
end
