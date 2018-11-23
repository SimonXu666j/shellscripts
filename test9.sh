function traverse(){
for file in `ls $1`
    do
        if [ -d $1"/"$file ]
        then
            traverse $1"/"$file
        else
            echo $1"/"$file
        file
    done
}
traverse "/usr/local/src"